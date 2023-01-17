<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tracking Expenses</title>
</head>
<body>
	<%@include file="links.jsp"%>
	<%@include file="navbar.jsp"%>




	<div class="container">

		<div class="row p-4">
		
			<div class="col-md-6">
				<h1 class="display-6 text-center">This Month</h1>
				<div id="piechart"></div>
				
			</div>
 
    
             
			<div class="col-md-6">
				<h1 class="display-6 text-center">This Year</h1>
				<div id="myChart" style="max-width: 700px; height: 400px"></div>
			</div>
		</div>
		
		
		
		<div class="row">
			<div class="col-md-12">
				<h1 class="display-6 text-center" style="text-decoration: underline;">
				 Expense
				</h1>
			</div>
		</div>
		

	</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="Expense.js"></script>
<script type="text/javascript" src="YearlyExp.js"></script>
</body>
</html>