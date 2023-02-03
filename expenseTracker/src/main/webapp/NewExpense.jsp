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
<title>Add Expenses</title>
<style type="text/css">
input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0;
}
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Creepster&display=swap" rel="stylesheet">
</style>

</head>
<%
 User use = (User)session.getAttribute("currentUser");
 if(use==null)
	 response.sendRedirect("LogoutServ");
%>
<body>

	<%@include file="links.jsp"%>
	<%@include file="navbar.jsp"%>

	<div class="d-flex align-items-center" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-3">
					<div class="card">
						<div class="card-header" style="background-color: #f3ca20;">
							<h1 class="display-6 text-center" style="font-family: 'Creepster', cursive;">ADD EXPENSES</h1>
						</div>
						<% 
						 AlertMessage m = (AlertMessage)session.getAttribute("newExpMSG");
						 if(m!=null){
						%>
						<div class="alert alert-<%= m.getType() %>" role="alert">
                            <%= m.getContent() %>
                        </div> 
                        
                        <% } session.removeAttribute("newExpMSG"); %>
						<div class="card-body">

							<form action="AddExpenseServ" method="post" id="form">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Item
										Name</label> <input type="text" name="iName" class="form-control"
										id="exampleInputEmail1">

								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Accomodity
										Type</label> <select name="iType" class="form-select">
										<option selected="selected" disabled="disabled">Select
											an option</option>
										 <% adminDao dao22 = new adminDao(ConnectionProvider.getConnection());
											ArrayList<Types> list23 = dao22.fetchTypes();
											for(Types tt : list23){
											%>		
											<option value="<%=tt.getName()%>"><%= tt.getName() %></option>
										<% } %>	
									</select>

								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Date</label>
									<input name="my" type="month" id="mmyy" class="form-control">
									<input type="text" name="year" id="year" style="display: none;">
									<input type="text" name="mnth" id="mnth" style="display: none;">
								</div>

								<div class="input-group mb-3">
								
									<span class="input-group-text">Rs.</span> <input type="number"
										class="form-control" name="amnt" placeholder="Price"
										aria-label="Dollar amount (with dot and two decimal places)">
								</div>
								<div class="text-center">
								<button type="submit" class="btn btn-primary" onclick="addExp(event)">Submit</button></div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">

		function addExp(event) {
			event.preventDefault();
			
			var x = document.getElementById('mmyy');
			let y = x.value;
			console.log(y);
			var nY = y.substring(0, y.indexOf("-"));
			console.log(nY);
			
			var nM = y.substring(y.indexOf("-")+1);
			console.log(nM);
			document.getElementById('year').value = nY;
			document.getElementById('mnth').value = nM;
			
		    document.getElementById('form').submit(); 
			
		}
	</script>
</body>
</html>