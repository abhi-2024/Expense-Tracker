package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.adminDao;
import com.entities.AlertMessage;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class DelTypeServ
 */
@WebServlet("/DelTypeServ")
public class DelTypeServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DelTypeServ() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("tid"));
		HttpSession s = request.getSession();
		adminDao dao = new adminDao(ConnectionProvider.getConnection());
		if (dao.delType(id)) {
			System.out.println("Done");
			AlertMessage msg = new AlertMessage("danger", "Option deleted!!");
			s.setAttribute("mFuncMSG", msg);
			response.sendRedirect("ManageFuncs.jsp");
		} else {
			System.out.println("Error");
			AlertMessage msg = new AlertMessage("info", "Failed!!");
			s.setAttribute("mFuncMSG", msg);
			response.sendRedirect("ManageFuncs.jsp");
		}

	}
}