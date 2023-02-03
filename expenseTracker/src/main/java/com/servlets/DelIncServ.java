package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpensesDao;
import com.dao.IncomeDao;
import com.entities.AlertMessage;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class DelIncServ
 */
@WebServlet("/DelIncServ")
public class DelIncServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelIncServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int did = Integer.parseInt(request.getParameter("did"));
		HttpSession s = request.getSession();		
		IncomeDao dao = new IncomeDao(ConnectionProvider.getConnection());
		if(dao.deleteIncome(did)) {

			AlertMessage m = new AlertMessage("danger", "Entry Deleted !!");
			s.setAttribute("incMSG", m);
			response.sendRedirect("IncomeRecords.jsp");
		}
	}

}
