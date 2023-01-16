<%@page import="com.entities.AlertMessage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Password Recovery</title>
</head>
<body>
  <%@include file="links.jsp" %>
  <%@include file="navbar.jsp" %>
   
<%--    <% 
    User u = (User)session.getAttribute("currentUser");
    if(u==null){
    	Message m2 = new Message("info","Please Login Again!");
    	session.setAttribute("loginMSG", m2);
    	response.sendRedirect("login.jsp");
    }
   %> --%>
   
   <div class="d-flex align-items-center" style="height: 80vh;">
      <div class="container">
         <div class="row">
            <div class="col-md-6 offset-3">
               <div class="card">
                  <div class="card-head">
                    <h1 class="display-6 text-center"> Password Recovery</h1>
                  </div>
                  <div class="card-body">
                   <form action="ForgotPassServ" method="post">
                    <div class="form-floating mb-3">
						<input type="email" class="form-control" id="floatingInput" required name="mail" placeholder="name@example.com"> 
						<label for="floatingInput">Enter your account's email address</label>
					</div>
					<div class="text-center">
					 <button class="btn btn-primary">Submit</button>
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