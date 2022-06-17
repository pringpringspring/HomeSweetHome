package community.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.HomeSweetHomeUtils;
import community.model.dto.KnowhowExt;
import community.model.service.KnowhowService;

/**
 * Servlet implementation class KnowhowThemeView
 */
@WebServlet("/knowhow/knowhowView")
public class KnowhowThemeView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private KnowhowService ks = new KnowhowService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int no = Integer.parseInt(request.getParameter("no"));
			Map<String, Object> param = new HashMap<>();
			List<KnowhowExt> list = ks.findAll(param);
			
			KnowhowExt knowhow = ks.findByNo(no);
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("/WEB-INF/views/community/knowhow/knowhowThemeView.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;

		}
	}

}
