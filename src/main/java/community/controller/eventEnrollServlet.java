package community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import common.HomeSweetHomeFileRenamePolicy;
import community.model.dto.EventAttachment;
import community.model.dto.EventExt;
import community.model.service.EventService;

/**
 * Servlet implementation class eventEnrollServlet
 */
@WebServlet("/event/eventEnroll")
public class eventEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EventService es = new EventService();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/community/event/eventEnroll.jsp")
		.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String saveDirectory = getServletContext().getRealPath("/upload/event");
			System.out.println("saveDirectory = " + saveDirectory);
			//최대파일크기 10MB 
			int maxPostSize = 1024 * 1024 * 10;
			String encoding = "utf-8";
			HomeSweetHomeFileRenamePolicy policy = new HomeSweetHomeFileRenamePolicy();
			MultipartRequest multiReq = 
					new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
			
	        
			String eventId = multiReq.getParameter("eventId");
			String title = multiReq.getParameter("title");
			String content = multiReq.getParameter("content");
			String titlefileName = multiReq.getParameter("titlefileName");

			String sdate=  multiReq.getParameter("sdate");
			String edate=  multiReq.getParameter("edate");
			
			System.out.println(sdate + "sdate"); 
			System.out.println(edate + "edate"); 
			
			SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");

			
			java.sql.Date s = java.sql.Date.valueOf(sdate);
			java.sql.Date e = java.sql.Date.valueOf(edate);
			
			EventExt event = new EventExt();
			event.setEventId(eventId);
			event.setEventTitle(title);
			event.setEventContent(content);
			event.setTitlefileName(titlefileName);
			event.setsDate(s);
			event.seteDate(e);
			/*
			 * event.setsDate(java.sql.Date.valueOf(sdate));
			 * event.seteDate(java.sql.Date.valueOf(edate));
			 */

			
			File upFile1 = multiReq.getFile("upFile1");
			File upFile2 = multiReq.getFile("upFile2");
			
			// 첨부한 파일이 하나라도 있는 경우
			if(upFile1 != null || upFile2 != null) {
				List<EventAttachment> attachments = new ArrayList<>();
				if(upFile1 != null) 
					attachments.add(getAttachment(multiReq, "upFile1"));
				if(upFile2 != null) 
					attachments.add(getAttachment(multiReq, "upFile2"));
				event.setAttachments(attachments);
			}
			
			System.out.println("event = " + event);
			

			int result = es.insertBoard(event);
			

			response.sendRedirect(request.getContextPath() + "/community/eventView?no=" + event.getNo());
			
		} catch (Exception  e) {
			e.printStackTrace();
			throw e;
		}
	}


	private EventAttachment getAttachment(MultipartRequest multiReq, String name) {
		EventAttachment attach = new EventAttachment();
		String originalFilename = multiReq.getOriginalFileName(name); // 업로드한 파일명
		String renamedFilename = multiReq.getFilesystemName(name); // 저장된 파일명
		attach.setOriginal_filename(originalFilename);
		attach.setRenamed_filename(renamedFilename);
		return attach;
	}


}
