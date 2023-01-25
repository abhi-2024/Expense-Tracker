<%@page import="com.entities.Sources"%>
<%@page import="com.entities.Types"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.adminDao"%>
<%@page import="com.entities.AlertMessage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Functionalities</title>
</head>
<body>
	<%@include file="links.jsp"%>
	<%@include file="navbar.jsp"%>
	<%
	if (admin == null) {
		response.sendRedirect("AdminLogin.jsp");
	}
	%>

	<div class="d-flex align-items-center" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-3">
					<div class="card">
						<div class="card-header">
							<h1 class="display-6 text-center" id="heading">Expense Types</h1>
							<button type="button" id="btn" class="btn btn-warning">View Income Sources</button>
						</div>
						<%
						AlertMessage am3 = (AlertMessage) session.getAttribute("mFuncMSG");
						if (am3 != null) {
						%>
						<div class="alert alert-<%=am3.getType()%>" role="alert">
							<%=am3.getContent()%>
						</div>
						<%
						}
						session.removeAttribute("mFuncMSG");
						%>
						<div class="card-body">
							<div id="expTypes">
								<table class="table">
									<thead>
										<tr>
											<th scope="col">SNO</th>
											<th scope="col">ID</th>
											<th scope="col">Type</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<%
										adminDao dao2 = new adminDao(ConnectionProvider.getConnection());
										ArrayList<Types> list2 = dao2.fetchTypes();
										int count = 1;
										for (Types tt : list2) {
										%>
										<tr>
											<th scope="row"><%=count++%></th>
											<td><%=tt.getId()%></td>
											<td><%=tt.getName()%></td>
											<td><form action="DelTypeServ" method="post">
											 <input value="<%=tt.getId()%>" name="tid" style="display: none;">
											 <button class="btn">Delete</button>
											</form></td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
								<hr>
								<form action="NewTypeServ" method="post">
									<div class="mb-3">
										<label for="typeName" class="form-label">Type Name</label> <input
											name="n" type="text" class="form-control" id="typeName"
											aria-describedby="emailHelp">
									</div>

									<button type="submit" class="btn btn-primary">Submit</button>
								</form>
							</div>
							<div id="incSource" style="display: none;">
								<table class="table">
									<thead>
										<tr>
											<th scope="col">SNO</th>
											<th scope="col">ID</th>
											<th scope="col">Source</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody>
									<% 
									 adminDao dao22 = new adminDao(ConnectionProvider.getConnection());
									 ArrayList<Sources> lis = dao22.fetchSources();	
												int c=1;
												for(Sources ss : lis){
									%>
										<tr>
											<th scope="row"><%=c++ %></th>
											<td><%=ss.getId() %></td>
											<td><%=ss.getName() %></td>
											<td>
											 <form action="DelSourceServ" method="post">
											     <input value="<%=ss.getId() %>" style="display: none;" name="sid">
											     <button class="btn">Delete</button>
											 </form>
											</td>
										</tr>
										<% } %>
									</tbody>
									
								</table>
								<hr>
								<form action="NewSourceServ" method="post">
									<div class="mb-3">
										<label for="typeName" class="form-label">Source Name</label> <input
											name="s" type="text" class="form-control" id="typeName"
											aria-describedby="emailHelp">
									</div>

									<button type="submit" class="btn btn-primary">Submit</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	 $(document).ready(function(){
		 let stat = false;
		 $('#btn').click(function(){
			 if(stat == false){
				 $('#expTypes').hide();
				 $('#incSource').show();
				 $('#heading').text("Income Sources");
				 $('#btn').text("View Expenses Types");
				 stat=true;
			 }else{
				 $('#incSource').hide();
				 $('#expTypes').show();
				 $('#heading').text("Expense Types");
				 $('#btn').text("View Income Sources");
				 stat=false; 
			 }
		 });
	 });
	</script>
</body>
</html>