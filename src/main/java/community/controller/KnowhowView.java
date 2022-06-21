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

import community.model.dto.Knowhow;
import community.model.dto.KnowhowComment;
import community.model.dto.KnowhowExt;
import community.model.dto.LikeDTO;
import community.model.service.KnowhowService;
import member.model.dto.Member;
import oracle.net.aso.l;

/**
 * Servlet implementation class KnowhowView
 */
@WebServlet("/knowhow/knowhowListView")
public class KnowhowView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private KnowhowService ks = new KnowhowService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
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
						boardCookieVal = value; // 기존쿠키값
						if (value.contains("|" + no + "|")) {
							hasRead = true;
						}
						break;
					}
				}
			}

			// 조회수증가
			if (!hasRead) {
				int result = ks.updateReadCount(no);
				Cookie cookie = new Cookie("boardCookie", boardCookieVal + "|" + no + "|");
				cookie.setPath(request.getContextPath() + "community/knowhow/knowhowListView"); // 쿠키를 사용할 경로
				cookie.setMaxAge(365 * 24 * 60 * 60); // 1년
				response.addCookie(cookie); // 응답헤더에 Set-Cookie로 전송
				System.out.println("> NoticeCookie가 새로 생성되었음.");
			}

			
			/*
			 * List<KnowhowComment> replylist = ks.selectCommentList(no); Knowhow kh =
			 * ks.selectOne(no); int replycount = ks.selectreplyCount(no);
			 * 
			 * HttpSession session = request.getSession(); Member memberLoggedIn =
			 * (Member)session.getAttribute("memberLoggedIn"); if(memberLoggedIn!=null) {
			 * LikeDTO resultCl = ks.selectLikeOne(kh.getNo(),
			 * memberLoggedIn.getMemberId()); boolean like = resultCl == null ? false :
			 * true;
			 * 
			 * request.setAttribute("LikeIt", like); } request.setAttribute("replylist",
			 * replylist); request.setAttribute("Knowhow", kh);
			 * request.setAttribute("replycount", replycount);
			 */
			
			
			
			// 게시글 조회
			KnowhowExt knowhow = ks.findByNo(no);

			// board#content 개행처리
			knowhow.setContent(knowhow.getContent().replaceAll("\n", "<br/>"));

			System.out.println(knowhow);

			// 3.view단 위임
		
			request.setAttribute("knowhow", knowhow);
			request.getRequestDispatcher("/WEB-INF/views/community/knowhow/knowhowView.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		/*
		 * try { String memberId = request.getParameter("memberId"); int cono =
		 * Integer.parseInt(request.getParameter("cono")); request.setAttribute("like",
		 * (boolean)true);
		 * 
		 * List<KnowhowComment> replylist = ks.selectCommentList(cono); LikeDTO cl =
		 * ks.selectLikeOne(cono, memberId); boolean exitistLike = cl == null ? false :
		 * true; if(exitistLike) { //like 삭제 int result =ks.deleteLike(cl);
		 * System.out.println("insertLike="+result); }else { //like 추가 LikeDTO like =
		 * new LikeDTO(memberId, cono, "T"); int result = ks.insertLike(like);
		 * System.out.println("insertLike="+result); }
		 * 
		 * LikeDTO resultCl = ks.selectLikeOne(cono, memberId); boolean like = resultCl
		 * == null ? false : true; } catch(Exception e) { e.printStackTrace();
		 * 
		 * throw e; }
		 */
		/*
		 * try { int no = Integer.parseInt(request.getParameter("no")); int cono =
		 * Integer.parseInt(request.getParameter("cono")); String memberId =
		 * request.getParameter("memberId");
		 * 
		 * LikeDTO like = ks.likeCheck(cono, memberId);
		 * 
		 * if(like == null) { ks.updateLikeCount(cono, memberId); } else {
		 * ks.setPostingLike(like); }
		 * 
		 * request.setAttribute("like", like);
		 * response.sendRedirect(request.getContextPath() +
		 * "/knowhow/knowhowListView?no=" + no); } catch (Exception e) {
		 * e.printStackTrace(); throw e; }
		 */
		
	}		
}

