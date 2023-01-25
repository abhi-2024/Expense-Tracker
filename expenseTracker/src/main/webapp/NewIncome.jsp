<%@page import="com.entities.Sources"%>
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
<title>Add Income</title>
<style type="text/css">
input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0;
}
</style>
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
							<h1 class="display-6 text-center">Income</h1>
						</div>
						
						<div class="card-body">
							<form id="iForm" action="AddIncServ" method="post">
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Income
										From</label> <input name="iN" type="text" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">
								</div>

								<div class="mb-3">
									<label for="inctype" class="form-label">Income Source</label> <select
										id="inctype" class="form-select" name="iT">
										<option disabled selected>-: Select an option :-</option>
										<% 
										 adminDao daoo = new adminDao(ConnectionProvider.getConnection());
										 ArrayList<Sources> listt = daoo.fetchSources();
										 for(Sources ss : listt){
										%>
										 <option value="<%=ss.getName()%>"><%=ss.getName() %></option>
										<% } %>
									</select>
								</div>

								<div class="mb-3">
									<label for="mmyy" class="form-label">Incurred on</label> <input
										name="iMMYY" type="month" class="form-control" id="mmyy"
										aria-describedby="emailHelp"> <input
										style="display: none;" name="iMM" id="imm"> <input
										style="display: none;" name="iYY" id="iyy">
								</div>

								<div class="input-group mb-3">
									<span class="input-group-text">Rs.</span> <input type="number"
										class="form-control"
										name="iP"
										aria-label="Amount (to the nearest Rupee)"> <span
										class="input-group-text">.00</span>
								</div>
								<button type="submit" onclick="myFunction(event)"
									class="btn btn-primary">Submit</button>
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

		var x = document.getElementById('mmyy');
		let y = x.value;

		var yy = y.substring(0, y.indexOf('-'));
		var mm = y.substring(y.indexOf('-') + 1);

		document.getElementById('imm').value = mm;
		document.getElementById('iyy').value = yy;

		document.getElementById('iForm').submit();
	}
</script>
</html>