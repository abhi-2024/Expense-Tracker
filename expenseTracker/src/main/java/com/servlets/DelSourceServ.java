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
 * Servlet implementation class DelSourceServ
 */
@WebServlet("/DelSourceServ")
public class DelSourceServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelSourceServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("sid"));
		adminDao dao = new adminDao(ConnectionProvider.getConnection());
		HttpSession s = request.getSession();
		if(dao.delSource(id)) {
			System.out.println("Done");
			AlertMessage msg = new AlertMessage("danger", "Option deleted!!");
			s.setAttribute("mFuncMSG", msg);
			response.sendRedirect("ManageFuncs.jsp");
		}else {
			System.out.println("Error");
			AlertMessage msg = new AlertMessage("info", "Failed!!");
			s.setAttribute("mFuncMSG", msg);
			response.sendRedirect("ManageFuncs.jsp");
		}
	}

}
