package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.IncomeDao;
import com.entities.AlertMessage;
import com.entities.Income;
import com.entities.User;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class AddIncServ
 */
@WebServlet("/AddIncServ")
public class AddIncServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddIncServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession s = request.getSession();
		User un = (User) s.getAttribute("currentUser");
		String in = request.getParameter("iN");
		String it = request.getParameter("iT");
		String ue = un.getEmail();
		int mm = Integer.parseInt(request.getParameter("iMM"));
		int yy = Integer.parseInt(request.getParameter("iYY"));
		int ip = Integer.parseInt(request.getParameter("iP"));
		
		Income inc = new Income(in, it, mm, yy, ip, ue);
		IncomeDao dao = new IncomeDao(ConnectionProvider.getConnection());
		
		if(dao.saveIncome(inc)) {
			System.out.println("Done!!");
			AlertMessage am = new AlertMessage("success", "Added Successfully!!");
			s.setAttribute("incMSG", am);
			response.sendRedirect("IncomeRecords.jsp");
		}else {
			System.out.println("Error!!");
			AlertMessage am = new AlertMessage("danger", "Something went wrong!! Please check the entered details.");
			s.setAttribute("incMSG", am);
			response.sendRedirect("IncomeRecords.jsp");
		}
	}

}
