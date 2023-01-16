package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class NewUserServ
 */
@WebServlet("/NewUserServ")
public class NewUserServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewUserServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname = request.getParameter("fName");
		String lname = request.getParameter("lName");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String add = request.getParameter("add");
		
		PrintWriter out = response.getWriter();
		
		User user = new User(fname, lname, email, pass, add);
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		HttpSession s = request.getSession();
		if(dao.saveUser(user)) {
			out.print("Done!");
			AlertMessage m = new AlertMessage("success", "Registration Successfull! Please Login...");
			s.setAttribute("loginMSG", m);
			response.sendRedirect("login.jsp");
		}else {
			out.print("Error!");
			AlertMessage m = new AlertMessage("danger", "Something Went Wrong! Please try again later.");
			s.setAttribute("signupMSG", m);
			response.sendRedirect("signup.jsp");
		}
	}

}
