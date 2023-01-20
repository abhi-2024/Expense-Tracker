package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpensesDao;
import com.entities.AlertMessage;
import com.entities.Expenses;
import com.entities.User;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class EditExpServ
 */
@WebServlet("/EditExpServ")
public class EditExpServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditExpServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("iID"));
		String name = request.getParameter("iN");
		String type = request.getParameter("iT");
		int m = Integer.parseInt(request.getParameter("mm"));
		int y = Integer.parseInt(request.getParameter("yy"));
		int p = Integer.parseInt(request.getParameter("iP"));
		
		HttpSession s = request.getSession();
		User ne = (User)s.getAttribute("currentUser");
	
		PrintWriter out = response.getWriter();
		out.println(id);
		out.println(name);
		out.println(type);
		out.println(m);
		out.println(y);
		out.println(p);
		
		Expenses exp = new Expenses(id, name, type, m, y, p, ne.getEmail());
	    
		ExpensesDao dao = new ExpensesDao(ConnectionProvider.getConnection());
		
		if(dao.updateExpense(id, exp)) {
			out.print("Done!!");
			AlertMessage al = new AlertMessage("success", "Updated Successfully");
			s.setAttribute("sExpMSG", al);
			response.sendRedirect("SingleExpense.jsp");
		}else {
			out.println("Error");
			AlertMessage al = new AlertMessage("danger", "Something went wrong !!");
			s.setAttribute("sExpMSG", al);
			response.sendRedirect("SingleExpense.jsp");
		}
	}

}
