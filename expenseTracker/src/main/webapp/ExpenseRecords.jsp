<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.ExpensesDao"%>
<%@page import="com.entities.Expenses"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="links.jsp"%>
	<%@include file="navbar.jsp"%>
	<%
	User user1 = (User) session.getAttribute("currentUser");
	if (user1 == null) {
		response.sendRedirect("LogoutServ");
	}
	ExpensesDao dao = new ExpensesDao(ConnectionProvider.getConnection());
	ArrayList<Expenses> list = dao.fetchExpenses(user1.getEmail());
	%>
	<div class="d-flex align-items-center" style="height: 80vh;">
		<div class="container">
		  <div class="row">
		   <div class="col-md-12 text-center">
		    <h1 class="display-5 p-6"> Expense Records </h1>
		   </div>
		  </div>
			<div class="row">
				<div class="col-md-12 ">
					<div class="table-responsive">
						<table class="table align-middle">
							<thead>
								<tr>
									<th>Item</th>
									<th>Type</th>
									<th>MM/YY</th>
									<th>Price</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<%
								for (Expenses e : list) {
								%>
								<tr>
									<td><%=e.getEname()%></td>
									<td><%=e.getEtype()%></td>
									<td>0<%=e.getEmm()%>/<%=e.getEyy()%></td>
									<td><%=e.getEprice()%></td>
									<td></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>