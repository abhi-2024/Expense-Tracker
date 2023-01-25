package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entities.AlertMessage;

/**
 * Servlet implementation class AdminLogoutServ
 */
@WebServlet("/AdminLogoutServ")
public class AdminLogoutServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogoutServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession s = request.getSession();
		s.removeAttribute("currentAdmin");
		AlertMessage msg = new AlertMessage("success", "Logout Success!!");
		s.setAttribute("adminloginMSG", msg);
		response.sendRedirect("AdminLogin.jsp");
	}

}
