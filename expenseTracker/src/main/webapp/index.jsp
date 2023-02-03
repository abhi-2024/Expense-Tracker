<%@page import="com.entities.Income"%>
<%@page import="com.dao.IncomeDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.entities.Expenses"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.ExpensesDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dashboard</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Rubik+Vinyl&display=swap" rel="stylesheet">

<style type="text/css">
.list {
	background: rgb(255, 255, 255);
	background: linear-gradient(90deg, rgba(255, 255, 255, 1) 18%,
		rgba(0, 190, 178, 1) 100%);
}
</style>
</head>

<body
	style="background: rgb(255, 255, 255); background: linear-gradient(90deg, rgba(255, 255, 255, 1) 35%, rgba(0, 219, 255, 1) 100%); overflow: hidden;">

	<%@include file="links.jsp"%>
	<%@include file="navbar.jsp"%>


	<%
	if (user == null) {
		response.sendRedirect("login.jsp");
	} else {
	%>
	<div class="m-2">
		<button style="background-color: #20c997" id="viewBtn" class="btn">Track
			Incomes</button>
	</div>
	<div class="grid text-center" style="-bs-columns: 3;">
		<div class="row">

			<div class="col-md-6">
				<div class="col-md-6">

					<div id="piechart" class="text-start"
						style="width: 60vh; height: 80vh;"></div>

					<div id="incpiechart" class="text-start"
						style="width: 60vh; height: 80vh; display: none;"></div>
				</div>
			</div>
			<div class="col-md-4">
				<h3 class="text-center" style="font-family: 'Press Start 2P', cursive;">EXPENSE-TRACKER</h3>
				<p class="text-center">An expense tracker is a tool or software
					used to record and track personal or business expenses. It allows
					you to input and categorize expenses, and can generate reports to
					help you see where your money is going.</p>
					<h4 style="font-family: 'Rubik Vinyl', cursive;">Income v/s Expense</h4>
				<%
				String em = user.getEmail();
				Date today = new Date();
				Calendar cal = Calendar.getInstance();
				cal.setTime(today);

				int tMnth = cal.get(Calendar.MONTH);
				int tYr = cal.get(Calendar.YEAR);
				tMnth++;
				System.out.print(tMnth + " " + tYr);
				IncomeDao d3 = new IncomeDao(ConnectionProvider.getConnection());
				ExpensesDao d2 = new ExpensesDao(ConnectionProvider.getConnection());
				ArrayList<Income> li1 = d3.fetchIncomeUYM(tYr, tMnth, user.getEmail());
				ArrayList<Expenses> li = d2.fetchExpensesUMonth(tMnth, tYr, user.getEmail());
				double tInc=0.0;
				double tExp=0.0;
				for(Income i : li1){
					tInc += i.getIprice(); 
				}
				System.out.print("\n"+tInc);
				for(Expenses e : li){
					tExp += e.getEprice();
				}
				System.out.print("\n"+tExp);
				double res = (tExp/tInc)*100;
				System.out.print("\n"+res);
				if(res <= 50.0){
				%>
				<h6>Don't forget to pay your bills</h6>
				<div class="progress">
					<div
						class="progress-bar progress-bar-striped progress-bar-animated bg-success"
						role="progressbar" aria-label="Animated striped example"
						aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"
						style="width:<%=res%>%"></div>
				</div>
				<% } %>
				<% if(res > 50.0 && res <= 75.0){ %>
				<h6>Start maintaining your expenses !!</h6>
				<div class="progress">
					<div
						class="progress-bar progress-bar-striped progress-bar-animated bg-warning"
						role="progressbar" aria-label="Animated striped example"
						aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"
						style="width:<%=res%>%"></div>
				</div>
				<% } %>
				<% if(res >= 75.0){ %>
				<h6>Stop your EXPENDITURES!! OR you may go bankrupt.</h6>
				<div class="progress">
					<div
						class="progress-bar progress-bar-striped progress-bar-animated bg-danger"
						role="progressbar" aria-label="Animated striped example"
						aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"
						style="width:<%=res%>%">STOP!!</div>
				</div>
				<% } %>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.anychart.com/releases/8.0.1/js/anychart-core.min.js"></script>
	<script
		src="https://cdn.anychart.com/releases/8.0.1/js/anychart-pie.min.js"></script>
	<script
		src="https://cdn.anychart.com/releases/v8/js/anychart-exports.min.js"></script>

	<script type="text/javascript">
        anychart.onDocumentReady(function() {
        	var data =[
            	   <%for (Expenses ee : li) {%>
            	   {x: "<%=ee.getEname()%>", value: <%=ee.getEprice()%> },
           	   <%}%>  
               ];
        	var newData = [
     		   <%for (Income ii : li1) {%>
     		       {x: "<%=ii.getIfrom()%>", value: <%=ii.getIprice()%>},
     		   <%}%>
     	       ];
     	   
     	       console.log(newData);
               console.log(data);
               
               
               
               var newchart = anychart.pie();
               newchart.title("Incomes This Month 0<%=tMnth%>/<%=tYr%>");
               newchart.data(newData);
               newchart.container('incpiechart');
               newchart.draw();
               
               
               
               var chart = anychart.pie();
               chart.title("Expenses This Month 0<%=tMnth%>/<%=tYr%>");
               chart.data(data);
               chart.container('piechart');
               chart.draw();
		})
          
      </script>



	<script type="text/javascript">
       $(document).ready(function(){
    	   let stat = false;
    	   $('#viewBtn').click(function(){
    		   if(stat == false){
        		   $('#piechart').hide();
        		   $('#incpiechart').show();
        		   $('#viewBtn').text("Track Expenses");
        		   stat = true;   			   
    		   }else{
    			   $('#piechart').show();
    			   $('#incpiechart').hide();
    			   $('#viewBtn').text("Track Incomes");
    			   stat = false;
    		   }

    	   });
       });
      </script>

	<%
	}
	%>
</body>
</html>