
<%@page import="com.entities.Admin"%>
<%@page import="com.entities.User"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand"><i class="fa-solid fa-money-bill-trend-up"></i>
			Expense-Tracker</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fa-solid fa-bars text-primary"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				
						
			   <%
			      User u = (User)session.getAttribute("currentUser");
			      User user = (User) session.getAttribute("currentUser");
			      Admin admin = (Admin)session.getAttribute("currentAdmin");
			      if(admin!=null){
			   %>		
			   <li class="nav-item"><a class="nav-link active"
					aria-current="page" href="AdminDashBoard.jsp"><i class="fa-solid fa-house"></i> Dashboard</a></li>
                     <li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-lock"></i> Admin </a>
					<ul class="dropdown-menu">

						<li><a class="dropdown-item" href="ManageFuncs.jsp"><i class="fa-solid fa-list-check"></i> Manage Functionalities</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="ManageUsers.jsp"><i class="fa-solid fa-users"></i> Manage Users</a></li>
					</ul></li>	
               <%
			      }
                
                if(u!=null){
               %>

					<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i
						class="fa-solid fa-gauge"></i> Dashboard</a></li>
						
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"><i
						class="fa-solid fa-wallet"></i> Income </a>
					<ul class="dropdown-menu">

						<li><a class="dropdown-item" href="NewIncome.jsp">New
								Income</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="IncomeRecords.jsp">Income
								Records</a></li>
					</ul></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"><i
						class="fa-solid fa-money-bill-transfer"></i> Expenditures </a>
					<ul class="dropdown-menu">

						<li><a class="dropdown-item" href="NewExpense.jsp">New
								Expenses</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="ExpenseRecords.jsp">Expense
								Records</a></li>
					</ul></li>
			 <% } %>		

			</ul>

			<ul class="navbar-nav mr-right">
			    <%
			    if(admin==null && user==null){
				%>
				<li class="nav-item"><a class="nav-link" href="AdminLogin.jsp"><i class="fa-solid fa-lock"></i> Admin Login</a></li>
				
				<li class="nav-item"><a class="nav-link" href="login.jsp"><i
						class="fa-solid fa-right-to-bracket"></i> Login</a></li>
				<li class="nav-item"><a class="nav-link" href="signup.jsp"><i
						class="fa-solid fa-user-plus"></i> Sign-up</a></li>
				<%
				  } else if(admin==null && user!=null){
				%>
				<li class="nav-item"><a class="nav-link" href="LogoutServ"><i
						class="fa-solid fa-power-off"></i> Logout</a></li>
				<li class="nav-item"><a class="nav-link" data-bs-toggle="modal"
					data-bs-target="#staticBackdrop" href="#"><i
						class="fa-solid fa-user"></i> <%=user.getfName()%></a></li>
				<%
				}
				  else if(admin!=null && user == null){
				%>	  
				      	<li class="nav-item"><a class="nav-link" href="AdminLogoutServ"><i
								class="fa-solid fa-power-off"></i> Admin Logout</a></li>
				<% 
				}
				%>
			</ul>

		</div>
	</div>
</nav>

<!-- MODAL -->
<%@include file="modal.jsp"%>

<!-- SCRIPT -->
<script type="text/javascript" src="profileEdit.js"></script>

