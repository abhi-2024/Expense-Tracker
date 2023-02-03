<%@page import="com.entities.AlertMessage"%>
<%@page import="com.entities.Income"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.IncomeDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Income Records</title>
</head>
<body>

	<%@include file="links.jsp"%>
	<%@include file="navbar.jsp"%>
	<%
	if (user == null){
		response.sendRedirect("LogoutServ");
	}
	%>
	<div class="d-flex align-items-center" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-3">
					<div class="card">
						<div class="card-header" style="background-color: #f3ca20">
							<h1 class="display-6 text-center" style="font-family: 'Abril Fatface', cursive;">Income Records</h1>
						</div>
						<% 
						 AlertMessage am4 = (AlertMessage)session.getAttribute("incMSG");
						 if(am4 != null){
						%>
						<div class="alert alert-<%=am4.getType() %>" role="alert">
                           <%= am4.getContent() %>
                        </div>
                        <% } session.removeAttribute("incMSG"); %>
						<div class="card-body" style="background-color: #f5f0e1;">
							<div class="table-responsive">
								<table class="table align-middle">
									<thead>
										<tr>
											<th>SNO.</th>
											<th>Income From</th>
											<th>Type</th>
											<th>Incurred On</th>
											<th>Amount</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<%
										int count = 1;
										String email = user.getEmail();
										IncomeDao da = new IncomeDao(ConnectionProvider.getConnection());
										ArrayList<Income> list = da.fetchIncome(email);
										if (list != null) {
											for (Income ii : list) {
										%>
										<tr>
											<td><%=count++%></td>
											<td><%=ii.getIfrom()%></td>
											<td><%=ii.getItype()%></td>
											<td><%=ii.getMm()%>/<%=ii.getYy()%></td>
											<td><%=ii.getIprice()%></td>
											<td>
											<form action="ViewIncServ" method="post">
											 <input value="<%=ii.getId()%>" name="id" style="display: none;">
											 <button class="btn"><i class="fa-solid fa-eye"></i></button>
											</form>
											</td>
										</tr>
										<%
										}
										} else {
										%>

										<tr>
											<td><%=count++%></td>
											<td>null</td>
											<td>null</td>
											<td>null</td>
											<td>null</td>
											<td><button class="btn disabled">View</button></td>
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
		</div>
	</div>
</body>
</html>