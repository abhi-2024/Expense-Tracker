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
 * Servlet implementation class DelUserServ
 */
@WebServlet("/DelUserServ")
public class DelUserServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelUserServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("uid"));
		adminDao dao = new adminDao(ConnectionProvider.getConnection());
		HttpSession s = request.getSession();
		if(dao.delUser(id)) {
			System.out.println("Done");
			AlertMessage msg = new AlertMessage("danger", "User deleted!!");
			s.setAttribute("mUsersMSG", msg);
			response.sendRedirect("ManageUsers.jsp");
		}else {
			System.out.println("Error");
			AlertMessage msg = new AlertMessage("warning", "Can't delete!!");
			s.setAttribute("mUsersMSG", msg);
			response.sendRedirect("ManageUsers.jsp");
		}
		// TODO Auto-generated method stub
	}

}
