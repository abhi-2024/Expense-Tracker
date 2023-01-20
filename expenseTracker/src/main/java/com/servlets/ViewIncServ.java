package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.IncomeDao;
import com.entities.Income;
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class ViewIncServ
 */
@WebServlet("/ViewIncServ")
public class ViewIncServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewIncServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		// TODO Auto-generated method stub
		/*
		 * IncomeDao dao = new IncomeDao(ConnectionProvider.getConnection()); Income in
		 * = dao.fetchSingleIncome(id);
		 */
		HttpSession s = request.getSession();
		s.setAttribute("currentIncomeId", id);
		response.sendRedirect("SingleIncome.jsp");
	}

}
