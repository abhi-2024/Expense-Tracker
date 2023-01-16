package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entities.AlertMessage;
import com.entities.User;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServ
 */
@WebServlet("/LoginServ")
public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServ() {
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
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		User user = dao.loginUser(email, pass);
		HttpSession s = request.getSession();
		if(user!=null) {
		s.setAttribute("currentUser", user);
		response.sendRedirect("index.jsp");
		}
		else {
			AlertMessage m = new AlertMessage("danger", "Invalid-Details!!");
			s.setAttribute("loginMSG", m);
			response.sendRedirect("login.jsp");
		}
	}

}
