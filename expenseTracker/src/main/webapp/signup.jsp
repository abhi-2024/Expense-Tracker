<%@page import="com.entities.AlertMessage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
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
							<h1 class="display-6 text-center">Register</h1>
						</div>
						<%
						AlertMessage m1 = (AlertMessage)session.getAttribute("signupMSG");
										 if(m1 != null){
						%>
						<div class="alert alert-<%= m1.getType() %>" role="alert">
                            <%= m1.getContent() %>
                        </div>
                        <% 
						 }
						 session.removeAttribute("signupMSG");
                        %>
						<div class="Card-body p-2">
							<form class="row g-3" action="NewUserServ" method="post">
							
							    <div class="col-md-6">
							      <label class="form-label" >First Name</label>
							      
							      <input type="text" name="fName" required class="form-control">
							    </div>
							    <div class="col-md-6">
							      <label class="form-label" >Last Name</label>
							      <input type="text" name="lName" required class="form-control">
							    </div>
							    
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Email</label> 
									
									<input type="email" name="email" required class="form-control" id="inputEmail4">
								</div>
								<div class="col-md-6">
									<label for="inputPassword4" class="form-label">Password</label>
									<input type="password" name="pass" required title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" class="form-control" id="inputPassword4">
								</div>
								
								<div class="col-12">
									<label for="inputAddress" class="form-label">Address</label> 
									<input	type="text" name="add" class="form-control" required id="inputAddress" placeholder="1234 Main St">
								</div>


								<div class="col-12">
									<div class="form-check">
										<input class="form-check-input" required type="checkbox" id="gridCheck">
										<label class="form-check-label" for="gridCheck"> Agree to terms & conditions </label>
									</div>
									
								</div>
								
								<div class="col-12">
									<button type="submit" class="btn btn-primary">Sign in</button>
									<a class="btn btn-secondary" href="login.jsp">Login</a>
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>