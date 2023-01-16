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
import com.helper.ConnectionProvider;
import com.helper.sendMail;

/**
 * Servlet implementation class ForgotPassServ
 */
@WebServlet("/ForgotPassServ")
public class ForgotPassServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uMail = request.getParameter("mail");
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		String fPass = dao.fetchPassword(uMail);
		HttpSession s = request.getSession();
		if(fPass!=null) {
			
			sendMail sm = new sendMail();
			
			boolean val = sm.sendingMail(uMail, "emailmanagement1234@gmail.com", "Your Password", fPass);
			
			if(val) {
			AlertMessage m = new AlertMessage("success", "Email containing your password was successfully sent !!");
			s.setAttribute("loginMSG", m);
			response.sendRedirect("login.jsp");
			}else {
				System.out.println("Error!!");
				
			}
		}else {
			AlertMessage m = new AlertMessage("danger", "User doesn't exist !! Please check your email again.");
			s.setAttribute("loginMSG", m);
			response.sendRedirect("login.jsp");
		}
	}

}
