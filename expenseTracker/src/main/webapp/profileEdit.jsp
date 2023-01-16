<%@page import="javax.mail.Message"%>
<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User us = (User) session.getAttribute("currentUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
	<div style="display: none;" id="profileEdit">
	
		<form action="ProfileEditServ" id="updateForm" method="post">
			<table class="table">
				<tbody>
				   <tr title="ID can't be modified">
				   <th scope="row">User ID</th>
				   <td> <input class="form-control" disabled="disabled" value="<%=us.getUid()%>">
				        <input class="form-control" style="display: none;" name="id" value="<%=us.getUid()%>">
				    </td>
				   </tr>
				   
					<tr>
						<th scope="row" class="form-label">First Name</th>
						<td><input name="fn" class="form-control" value="<%=us.getfName()%>"></td>
					</tr>

					<tr>
						<th scope="row" class="form-label">Last Name</th>
						<td><input name="ln" class="form-control" value="<%=us.getlName()%>"></td>
					</tr>
					
					<tr title="Email can't be modified">
						<th scope="row" class="form-label">Email</th>
						<td><input class="form-control" disabled="disabled" value="<%=us.getEmail()%>"></td>
					</tr>
					<tr style="display: none;">
						<th scope="row" class="form-label">Email</th>
						<td><input name="e" class="form-control" value="<%=us.getEmail()%>"></td>
					</tr>					
					
					<tr>
						<th scope="row" class="form-label">Password</th>
						<td><input name="p" id="myInput" type="password" class="form-control" value="<%=us.getPass()%>"> 
						    <input type="checkbox" onclick="myFunction()"> Show password
						 </td>
					</tr>
					
					<tr>
						<th scope="row" class="form-label">Address</th>
						<td><input name="a" class="form-control" value="<%=us.getAdd()%>"></td>
					</tr>										
				</tbody>
			</table>
			<div class="text-start"><button class="btn btn-primary" type="submit">Submit</button></div>
		</form>
	</div>
</body>

<script type="text/javascript">
  function myFunction() {
	var x = document.getElementById('myInput');
	if(x.type === 'password'){
		x.type = 'text';
	}else{
		x.type = 'password';
	}
}
</script>
</html>