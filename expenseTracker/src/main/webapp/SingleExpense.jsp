<%@page import="com.entities.AlertMessage"%>
<%@page import="com.entities.Expenses"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.ExpensesDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0;
}
</style>
<meta charset="ISO-8859-1">
<title>Expense Details</title>
</head>
<body>

	<%@include file="links.jsp"%>
	<%@include file="navbar.jsp"%>

	<%
	ExpensesDao dao = new ExpensesDao(ConnectionProvider.getConnection());
	int id = (int) session.getAttribute("expID");
	Expenses e2 = dao.fetchExpense(id);
	if (e2 == null) {
		response.sendRedirect("index.jsp");
	}
	%>

	<div class="d-flex align-items-center" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-3">
					<div class="card">
						<div class="card-header">
							<h1 class="display-6 text-center">Expense</h1>
							<div class="text-start">
								<div class="btn-group" role="group"
									aria-label="Basic mixed styles example">
									<a type="button" onClick="sendEmail()" id="sInvoice" class="btn btn-warning"><i
										class="fa-solid fa-receipt"></i> Invoice</a>
									<button type="button" id="editBtn" class="btn btn-danger">Edit</button>
									<a type="button" id="aExp" class="btn btn-primary" href="BackRecExpServ">All
										Expenses</a>
								</div>
							</div>
						</div>
						<%
						 AlertMessage am2 = (AlertMessage)session.getAttribute("sExpMSG");
						 if(am2!=null){
						%>
						<div class="alert alert-<%=am2.getType() %>" role="alert">
                           <%=am2.getContent() %>
                        </div>
                        <% } session.removeAttribute("sExpMSG");%>
						<div class="card-body">
							<table class="table" id="expenseView">
								<tbody>
									<tr>
										<th scope="row">Item ID</th>
										<td><%=e2.getEid()%></td>
									<tr>
										<th scope="row">Item Name</th>
										<td><%=e2.getEname()%></td>
									</tr>
									<tr>
										<th scope="row">Expense Type</th>
										<td><%=e2.getEtype()%></td>
									</tr>
									<tr>
										<th scope="row">MM-YY</th>
										<td><%=e2.getEmm()%> - <%=e2.getEyy()%></td>
									</tr>
									<tr>
										<th scope="row">Price</th>
										<td>Rs.<%=e2.getEprice()%>
										</td>
									</tr>
								</tbody>
							</table>
                             <form action="EditExpServ" id="editForm" method="post" style="display: none;">
							<table class="table">
								<tbody>

									<tr>
										<th scope="row"><label class="form-label">Item ID</label></th>
										<td><input class="form-control" disabled
											value="<%=e2.getEid()%>"> <input class="form-control"
											style="display: none;" name="iID" value="<%=e2.getEid()%>"></td>
									</tr>

									<tr>
										<th scope="row">Item Name</th>
										<td><input class="form-control" name="iN"
											value="<%=e2.getEname()%>"></td>
									</tr>

									<tr>
										<th scope="row">Expense Type</th>
										<td>
										   <select name="iT" class="form-select">
										         <option selected="selected" style="display: none;" value="<%=e2.getEtype()%>"><%=e2.getEtype()%></option>
										         <option value="Self">Self</option>
										         <option value="Business">Business</option>
										         <option value="Gift">Gift</option>	
									       </select>
									   </td>
									</tr>

									<tr>
										<th scope="row">MM-YY</th>
										<td>
										   <input class="form-control" style="display: none;" type="text" id="year" value="<%=e2.getEyy()%>"> 
										   <input class="form-control" style="display: none;" type="text" id="mnth" value="<%=e2.getEmm()%>">
										   <input class="form-control" type="month" id="mmyy">
										   <input class="form-control" style="display: none;" name="yy" type="text" id="Nyear">
										   <input class="form-control" style="display: none;" name="mm" type="text" id="Nmnth">
										</td>
									</tr>

									<tr>
										<th scope="row">Price</th>
										<td><input name="iP" type="number" class="form-control"
											value="<%=e2.getEprice()%>"></td>
									</tr>
								</tbody>
							</table>
							 <div><button class="btn btn-primary" onclick="myFunction(event)">Submit Changes</button></div>
							</form>
							<div class="text-end" id="delExp">
							   <form action="DelExpServ" method="post">
							     <input style="display: none;" name="did" value="<%=e2.getEid()%>">
							     <button type="submit" class="btn btn-danger">Delete</button>
							   </form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="singleExp.js"></script>
	<script type="text/javascript">
	 function sendEmail(){
		 var params = {
			to_name: "<%=user.getfName()%> <%=user.getlName()%>" ,
			to_address: "<%=user.getAdd()%>" ,
			to_email: "<%=user.getEmail()%>",
			to_itemName: "<%=e2.getEname()%>",
			to_type: "<%=e2.getEtype()%>",
			to_price: "<%=e2.getEprice()%>",
		 };
		 
		 emailjs.send("service_73pc8m8","template_f5akfll",params).then(function(res){
			 console.log("Success!!");
			 alert("Success",res.status);
		 })
	 }
	</script>
	<script type="text/javascript">
      var m = document.getElementById('mnth');
	  var my = document.getElementById('mmyy');
	  var n = m.value;
	  var count = 0;

	  if (n >= 1) ++count;

	  while (n / 10 >= 1) {
		n /= 10;
		++count;
    	}

	   if (count > 1) {
		   my.value = "<%=e2.getEyy()%>-<%=e2.getEmm()%>";
	   } else {
		    my.value = "<%=e2.getEyy()%>-0<%=e2.getEmm()%>";
		 }
  </script>

</body>
</html>