<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dashboard</title>
</head>

<body>

	<%@include file="links.jsp"%>
	<%@include file="navbar.jsp"%>



	<div class="grid text-center" style="-bs-columns: 3;">
		<div class="row mt-4">

			<div class="col-md-6 p-4">
				<img alt="Bootstrap Image Preview" src="img/expense.jpg"
					class="rounded" width="450" />
			</div>
			<div class="col-md-6 p-4">
				<h3 class="text-center font-monospace">EXPENSE-TRACKER</h3>
				<p class="text-center">An expense tracker is a tool or software
					used to record and track personal or business expenses. It allows
					you to input and categorize expenses, and can generate reports to
					help you see where your money is going.</p>
				<ol class="text-start list-group list-group-numbered">
					<li class="list-group-item lead">Add New Expense</li>
					<li class="list-group-item lead">View & Manage Expense Records</li>
					<li class="list-group-item lead">Add New Income</li>
					<li class="list-group-item lead">View & Manage Income Records</li>
					<li class="list-group-item lead">Manage Total Balance</li>
					<li class="list-group-item lead">Track Expenses</li>
				</ol>
			</div>
		</div>
	</div>
	<hr>
</body>

</html>