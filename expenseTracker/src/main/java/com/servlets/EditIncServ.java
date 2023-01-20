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
import com.helper.ConnectionProvider;

/**
 * Servlet implementation class EditIncServ
 */
@WebServlet("/EditIncServ")
public class EditIncServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditIncServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("iid"));
		int mm = Integer.parseInt(request.getParameter("im"));
		int yy = Integer.parseInt(request.getParameter("iy"));
		int ip = Integer.parseInt(request.getParameter("ip"));
		
		String in = request.getParameter("in");
		String it = request.getParameter("it");
		HttpSession s = request.getSession();
		Income inc = new Income(id, in, it, mm, yy, ip);
		IncomeDao dao = new IncomeDao(ConnectionProvider.getConnection());
		if(dao.updateIncome(inc)) {
			System.out.print("Done!!");
			AlertMessage amsg = new AlertMessage("success", "Updated-Successfully");
			s.setAttribute("singleIncMSG", amsg);
			response.sendRedirect("SingleIncome.jsp");
		}else {
			System.out.println("Error");
			AlertMessage amsg = new AlertMessage("danger", "Couldn't update, Please try again later.");
			s.setAttribute("singleIncMSG", amsg);
			response.sendRedirect("SingleIncome.jsp");
		}
	}

}
