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
</head>

<body>

	<%@include file="links.jsp"%>
	<%@include file="navbar.jsp"%>
	

	<% 
	 if(user == null){
		 response.sendRedirect("login.jsp");
	 } else{
	%>
   <div class="m-2">
     <button style="background-color: #20c997" id="viewBtn" class="btn">Track Incomes</button>
   </div>
	<div class="grid text-center" style="-bs-columns: 3;">
		<div class="row">

			<div class="col-md-6 p-4">
				<div class="col-md-6">

					<div id="piechart" class="text-start"
						style="width: 60vh; height: 80vh"></div>
						
					<div id="incpiechart" class="text-start" style="width: 60vh; height: 80vh; display: none;"></div>	
				</div>
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
	<%
   String em = user.getEmail();
   Date today = new Date();
   Calendar cal = Calendar.getInstance();
   cal.setTime(today);
   
   int tMnth = cal.get(Calendar.MONTH);
   int tYr = cal.get(Calendar.YEAR);
   tMnth++;
   System.out.print(tMnth+" "+tYr);
   IncomeDao d3 = new IncomeDao(ConnectionProvider.getConnection());
   ExpensesDao d2 = new ExpensesDao(ConnectionProvider.getConnection());
   ArrayList<Income> li1 = d3.fetchIncomeUYM(tYr, tMnth, user.getEmail());
   ArrayList<Expenses> li = d2.fetchExpensesUMonth(tMnth, tYr, user.getEmail());
  %>
 
      <script src="https://cdn.anychart.com/releases/8.0.1/js/anychart-core.min.js"></script>
      <script src="https://cdn.anychart.com/releases/8.0.1/js/anychart-pie.min.js"></script>
      <script src="https://cdn.anychart.com/releases/v8/js/anychart-exports.min.js"></script>
      
      <script type="text/javascript">
        anychart.onDocumentReady(function() {
        	var data =[
            	   <%for(Expenses ee : li){ %>
            	   {x: "<%=ee.getEname()%>", value: <%=ee.getEprice()%> },
           	   <%  } %>  
               ];
        	var newData = [
     		   <% for(Income ii : li1){ %>
     		       {x: "<%=ii.getIfrom()%>", value: <%=ii.getIprice()%>},
     		   <% } %>
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
      
      <% } %>
</body>
</html>