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
 * Servlet implementation class AddExpenseServ
 */
@WebServlet("/AddExpenseServ")
public class AddExpenseServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddExpenseServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String in = request.getParameter("iName");
		String it = request.getParameter("iType");
		String my = request.getParameter("my");
		int y =  Integer.parseInt(request.getParameter("year"));
		
		HttpSession s = request.getSession();
		User user = (User)s.getAttribute("currentUser");
		
		String ue = user.getEmail();
		
		int mm = Integer.parseInt(request.getParameter("mnth"));
		int p = Integer.parseInt(request.getParameter("amnt"));
		
		Expenses ex = new Expenses(in, it, mm, y, p, ue);
		
		ExpensesDao dao = new ExpensesDao(ConnectionProvider.getConnection());
		
		if(dao.saveExpense(ex)) {
			out.print("Done!");
			AlertMessage m = new AlertMessage("success", "Addedd Successfully !!");
			s.setAttribute("newExpMSG", m);
			response.sendRedirect("NewExpense.jsp");
		}else {
			out.print("Error!!");
			AlertMessage m = new AlertMessage("danger", "Something Went Wrong !! Please re-verify your entered data.");
			s.setAttribute("newExpMSG", m); 
			response.sendRedirect("NewExpense.jsp");
		}
	}

}
