<%@page import="com.entities.AlertMessage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
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
							<h1 class="display-6 text-center">Admin Login</h1>
						</div>
						<%
										 AlertMessage m = (AlertMessage)session.getAttribute("adminloginMSG");
										 if(m!=null){
						%>
						<div class="alert alert-<%= m.getType() %>" role="alert">
                            <%= m.getContent() %>
                        </div>
                        <% 
                        }
						session.removeAttribute("adminloginMSG"); 
						 %>
						<div class="card-body">
						
						 <form action="AdminLoginServ" method="post">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput" required name="email" placeholder="name@example.com"> 
								<label for="floatingInput">Email address</label>
							</div>
							
							<div class="form-floating">
								<input type="password" class="form-control" id="floatingPassword" required name="pass" placeholder="Password">
								 <label for="floatingPassword">Password</label>
							</div>
							<div class="text-end"> <button class="btn" id="pBtn" onclick="myFunction(event)"> Show Password</button> </div>
							<div class="mt-2 text-center">
							 <button type="submit" class="btn btn-primary">Login</button>
							</div>
						 </form>
						  

						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
 
  function myFunction(event) {
	event.preventDefault();
    
	var x =  document.getElementById('floatingPassword');
	var y =  document.getElementById('pBtn');
	if(x.type === 'password'){
		x.type = 'text';
		y.innerHTML = 'Hide Password';
	}else{
		x.type = 'password';
		y.innerHTML = 'Show Password';
	}
 }
 
 
</script>
</html>