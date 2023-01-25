<%@page import="com.entities.AlertMessage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.adminDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>
</head>
<body>
	<%@include file="links.jsp"%>
	<%@include file="navbar.jsp"%>

	<div class="d-flex align-items-center" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-3">
					<div class="card">
						<div class="card-header">
							<h1 class="display-6 text-center">Users List</h1>
						</div>
						<%
						AlertMessage am3 = (AlertMessage) session.getAttribute("mUsersMSG");
						if (am3 != null) {
						%>
						<div class="alert alert-<%=am3.getType()%>" role="alert">
							<%=am3.getContent()%>
						</div>
						<%
						}
						session.removeAttribute("mUsersMSG");
						%>
						
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">User ID</th>
										<th scope="col">User Name</th>
										<th scope="col">User Email</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody>
								 <% 
								  adminDao daooo = new adminDao(ConnectionProvider.getConnection());
								  ArrayList<User> listtt = daooo.fetchAllUsers();
								  
								  for(User uu : listtt){
								 %>
									<tr>
										<th scope="row"><%=uu.getUid()%></th>
										<td><%= uu.getfName() %> <%=uu.getlName() %></td>
										<td><%=uu.getEmail() %></td>
										<td>
										   <form action="DelUserServ" method="post">
										    <input value="<%=uu.getUid()%>" name="uid" style="display: none;">
										    <button class="btn">Delete</button>
										   </form>
										</td>
									</tr>
									<% } %>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>