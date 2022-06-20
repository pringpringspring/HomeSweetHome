package community.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.model.dto.PictureExt;
import community.model.service.PictureService;

/**
 * Servlet implementation class PictureViewByTheme
 */
@WebServlet("/picture/pictureViewByTheme")
public class PictureViewByTheme extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PictureService ps = new PictureService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String spaceStr = request.getParameter("space");
		String shapeStr =  request.getParameter("shape");
		
		int space = 0;
		int shape = 0;
	
		if(spaceStr != null) {
			space = Integer.parseInt(spaceStr);
		}
		
		if(shapeStr != null) {
			shape = Integer.parseInt(shapeStr);
		}
		
		final int PAGE_SIZE = 20;  //한페이지당 글 수 
		final int PAGE_BLOCK = 3;  //한화면에 나타날 페이지 링크 수
		int rCount = 0;  //총 글수
		int pageCount = 0;  //총페이지 수 
		int startPage = 1;  //화면에 나타날 시작페이지
		int endPage = 1;  //화면에 나타날 마지막페이지
		int currentPage =1;  //눌려진 페이지
		int startRnum = 1; //화면에 나타날 글 번호
		int endRnum = 1; //화면에 나타날 글 번호
		
		String pageNum = request.getParameter("pagenum");
		if(pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		rCount = ps.getProductCount(space , shape);
	
		pageCount = (rCount/PAGE_SIZE) + (rCount%PAGE_SIZE == 0 ? 0 : 1);

		startRnum = (currentPage - 1) * PAGE_SIZE + 1;
		endRnum = startRnum + PAGE_SIZE -1;
		if(endRnum > rCount) {
			endRnum = rCount;
		}
		
		if(currentPage%PAGE_BLOCK == 0) {
			startPage = (currentPage/PAGE_BLOCK - 1) *PAGE_BLOCK + 1;
		}else {
			startPage = (currentPage/PAGE_BLOCK) *PAGE_BLOCK + 1;
		}
		
		endPage = startPage + PAGE_BLOCK - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		
		
		ArrayList<PictureExt> list =ps.productList(startRnum, endRnum, space, shape);

		request.setAttribute("productList", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("space", space);
		request.setAttribute("shape", shape);

		request.getRequestDispatcher("/WEB-INF/views/community/picture/pictureViewbyTheme.jsp").forward(request, response);
		
		
		
		
	}

}
