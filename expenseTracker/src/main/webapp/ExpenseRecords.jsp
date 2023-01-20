<%@page import="com.entities.AlertMessage"%>
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
					<h1 class="display-5 p-6">Expense Records</h1>
				</div>
			</div>
			
			<% 
			  AlertMessage am2 = (AlertMessage)session.getAttribute("expRecMSG");
			  if(am2!=null){
			%>
			<div class="row">
				<div class="col-md-6 offset-3 text-center">
					<div class="alert alert-<%=am2.getType() %>" role="alert"><%=am2.getContent() %></div>
				</div>
			</div>	
			<% } session.removeAttribute("expRecMSG"); %>	
			
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
									<td>Rs.<%=e.getEprice()%></td>
									<td>
										<form action="SingleExpServ" method="post">
											<input name="id" style="display: none;"
												value="<%=e.getEid()%>">
											<button title="View Details" class="btn">
												<i class="fa-solid fa-eye"></i>
											</button>
										</form>
									</td>
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