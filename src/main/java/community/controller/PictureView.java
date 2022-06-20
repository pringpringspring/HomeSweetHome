package community.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import community.model.dto.PictureExt;
import community.model.service.PictureService;
import member.model.dto.Member;

/**
 * Servlet implementation class PictureView
 */
@WebServlet("/picture/pictureView")
public class PictureView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PictureService ps = new PictureService();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int no = Integer.parseInt(request.getParameter("no"));

			boolean hasRead = false;
			String boardCookieVal = "";
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					String name = cookie.getName();
					String value = cookie.getValue();
					if ("boardCookie".equals(name)) {
						boardCookieVal = value;
						if (value.contains("|" + no + "|")) {
							hasRead = true;
						}
						break;
					}
				}
			}

			if (!hasRead) {
				int result = ps.updateReadCount(no);
				Cookie cookie = new Cookie("boardCookie", boardCookieVal + "|" + no + "|");
				cookie.setPath(request.getContextPath() + "community/picture/pictureView"); 
				cookie.setMaxAge(365 * 24 * 60 * 60); // 1년
				response.addCookie(cookie); 
				System.out.println("> NoticeCookie가 새로 생성되었음.");
			}

			PictureExt picture = ps.findByNo(no);
			
			
			HttpSession session = request.getSession();
	
	
			/* List <LikeBc> likeit = ps.LikebyMemberId(memberId); */
			
			
			picture.setContent(picture.getContent().replaceAll("\n", "<br/>"));

			System.out.println(picture);

			request.setAttribute("picture", picture);
			/* request.setAttribute("likeit", likeit); */
			

			request.getRequestDispatcher("/WEB-INF/views/community/picture/pictureView.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * try { String memberId = request.getParameter("memberId"); int board_num =
		 * Integer.parseInt(request.getParameter("board_num"));
		 * request.setAttribute("like", (boolean)true);
		 * 
		 * List<KnowhowComment> replylist = ks.selectCommentList(board_num); comLike cl
		 * = ks.selectLikeOne(board_num, memberId); boolean exitistLike = cl == null ?
		 * false : true; if(exitistLike) { //like 삭제 int result =ks.deleteLike(cl);
		 * System.out.println("insertLike="+result); }else { //like 추가 comLike like =
		 * new comLike(memberId, board_num, "T"); int result = ks.insertLike(like);
		 * System.out.println("insertLike="+result); }
		 * 
		 * comLike resultCl = ks.selectLikeOne(board_num, memberId); boolean like =
		 * resultCl == null ? false : true; } catch(Exception e) { e.printStackTrace();
		 * 
		 * throw e; }
		 */
	}

}
