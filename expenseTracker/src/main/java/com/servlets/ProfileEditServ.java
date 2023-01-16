package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
 * Servlet implementation class ProfileEditServ
 */
@WebServlet("/ProfileEditServ")
@MultipartConfig
public class ProfileEditServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileEditServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname = request.getParameter("fn");
		String lname = request.getParameter("ln");
		String email = request.getParameter("e");
		String pass = request.getParameter("p");
		String add = request.getParameter("a");
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(fname+" "+lname+" "+email+" "+pass+" "+add+" "+id);
		User user = new User(fname, lname, email, pass, add, id);
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		PrintWriter out = response.getWriter();
		if(dao.updateUser(user)) {
			out.print("Done!");
			HttpSession s = request.getSession();
			s.setAttribute("currentUser", user);
		}else {
			out.print("error");
		}
		
	}

}
