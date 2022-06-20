package community.controller;

import java.io.IOException;
import java.sql.Ref;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.model.dao.LikeDao;
import community.model.dto.LikeDTO;

/**
 * Servlet implementation class LikePlus
 */
@WebServlet(urlPatterns ="/picture/Like.do")
public class LikePlus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			LikeDTO likedto = new LikeDTO();
			
			likedto.setNo(Integer.parseInt(request.getParameter("no")));
			/* likedto.setMemberId(request.getParameter("member_id")); */
			
			LikeDao likeDao = new LikeDao();
			likeDao.insertLike(likedto);
			
			response.sendRedirect(request.getContextPath()+"/picture/pictureView?no=" + request.getParameter("no"));
		}
		catch(Exception e) {
			e.printStackTrace();
			response.sendError(500);
		}
	}

}
