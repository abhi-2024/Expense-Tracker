package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.adminDao;
import com.entities.Admin;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class AdminLoginServ
 */
@WebServlet("/AdminLoginServ")
public class AdminLoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		Admin admin = new Admin(email, pass);
		adminDao dao = new adminDao(ConnectionProvider.getConnection());
		HttpSession s = request.getSession();
		Admin ad =  dao.adminLogIn(admin);
		s.setAttribute("currentAdmin", ad);
		if(ad!=null) {
		response.sendRedirect("AdminDashBoard.jsp");
		}else {
			System.out.println("Error");
			response.sendRedirect("index.jsp");
		}
	  }
	}


