package purchase.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaywayInfoServlet
 */
@WebServlet("/purchase/paywayInfo")
public class PaywayInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 사용자입력값 처리
		
		// 2. 업무로직 
		String info = "";
		
		// 3. view단 처리
		request.setAttribute("info", info);
		request.getRequestDispatcher("/WEB-INF/views/purchase/purchaseView.jsp")
			.forward(request, response);
		
	}


}
