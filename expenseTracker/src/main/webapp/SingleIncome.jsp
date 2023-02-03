<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.IncomeDao"%>
<%@page import="com.entities.AlertMessage"%>
<%@page import="com.entities.Income"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lilita+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Income Details</title>
</head>
<%
int i = (int) session.getAttribute("currentIncomeId");
IncomeDao dao10 = new IncomeDao(ConnectionProvider.getConnection());
Income inn = dao10.fetchSingleIncome(i);
if (inn != null) {
%>
<body>
	<%@include file="links.jsp"%>
	<%@include file="navbar.jsp"%>
	<div class="d-flex align-items-center" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-3">
					<div class="card">
						<div class="card-header" style="background-color: #f3ca20">
							<h1 id="incHead" style="font-family: 'Abril Fatface', cursive;" class="display-6 text-center">Income
								Details</h1>

							<div class="text-start">
								<div class="btn-group" role="group"
									aria-label="Basic mixed styles example">
									<a type="button" id="sInvoice" onClick="sendMail()"
										class="btn btn-success"><i class="fa-solid fa-receipt"></i>
										Invoice</a>
									<button type="button" id="editBtn" class="btn btn-danger">Edit</button>
									<a type="button" id="aExp" class="btn btn-primary"
										href="BackRecIncServ">Show All Incomes</a>
								</div>
							</div>
						</div>
						<%
						AlertMessage msg = (AlertMessage) session.getAttribute("singleIncMSG");
						if (msg != null) {
						%>
						<div class="alert alert-<%=msg.getType()%>" role="alert"><%=msg.getContent()%></div>
						<%
						}
						session.removeAttribute("singleIncMSG");
						%>
						<div class="card-body" style="background-color: #f5f0e1;">
							<table class="table" id="incomeView">
								<tbody style="color: #123C69;">
									<tr>
										<th scope="row">Income ID</th>
										<td><%=inn.getId()%></td>
									</tr>

									<tr>
										<th scope="row">Income Source</th>
										<td><%=inn.getIfrom()%></td>
									</tr>
									<tr>
										<th scope="row">Income Type</th>
										<td><%=inn.getItype()%></td>
									</tr>
									<tr>
										<th scope="row">Incurred on (mm/yy)</th>
										<td><%=inn.getMm()%>/<%=inn.getYy()%></td>
									</tr>

									<tr>
										<th scope="row">Income Amount</th>
										<td>Rs. <%=inn.getIprice()%></td>
									</tr>
								</tbody>
							</table>

							<form id="incomeEdit" action="EditIncServ" method="post"
								style="display: none;">
								<table class="table">
									<tbody style="color: #123C69;">
										<tr>
											<th>Income ID</th>
											<td><input class="form-control" disabled
												value="<%=inn.getId()%>"> <input
												value="<%=inn.getId()%>" name="iid" style="display: none;">
											</td>
										</tr>

										<tr>
											<th>Income Source</th>
											<td><input name="in" class="form-control"
												value="<%=inn.getIfrom()%>"></td>
										</tr>

										<tr>
											<th>Income Type</th>
											<td><select class="form-select" name="it">
													<option style="display: none;" selected
														value="<%=inn.getItype()%>"><%=inn.getItype()%></option>
													<option value="Salary">Salary</option>
													<option value="Sundry Debtors">Sundry Debtors</option>
											</select></td>
										</tr>
										<tr>
											<th>Incurred on</th>
											<td>
												<!-- For Showing Value --> <input
												onchange="myFunction(event)" type="month" id="mmyy"
												class="form-control"> <input name="im"
												style="display: none;" id="mm" value="<%=inn.getMm()%>">
												<input name="iy" style="display: none;" id="yy"
												value="<%=inn.getYy()%>">

											</td>
										</tr>

										<tr>
											<th>Income Amount</th>
											<td><input name="ip" class="form-contol"
												value="<%=inn.getIprice()%>"></td>
										</tr>

										<tr>
											<th>User's Email</th>
											<td><input value="<%=inn.getUser()%>"
												class="form-control" disabled></td>
										</tr>
									</tbody>
								</table>
								<div>
									<button class="btn btn-primary">Submit Changes</button>
								</div>
							</form>
							<div class="text-end" id="delInc">
								<form action="DelIncServ" method="post">
									<input style="display: none;" name="did"
										value="<%=inn.getId()%>">
									<button type="submit" class="btn btn-danger">Delete</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	$(document).ready(function(){
		let stat = false;
		$('#editBtn').click(function() {
			if (stat == false) {
				$('#incomeView').hide();
				$('#incomeEdit').show();
				$('#sInvoice').hide();
				$('#aExp').hide();
				$('#delInc').hide();
				$('#editBtn').text('View');
				stat = true;
			} else {
				$('#incomeView').show();
				$('#incomeEdit').hide();
				$('#sInvoice').show();
				$('#aExp').show();
				$('#delInc').show();
				$('#editBtn').text('Edit');
				stat = false;
			}
		});
	});
	function myFunction(event) {
		event.preventDefault();
		var x = document.getElementById('mmyy');
		let xv = x.value;

		var YY = xv.substring(0, xv.indexOf('-'));
		var MM = xv.substring(xv.indexOf('-') + 1);

		document.getElementById('mm').value = MM;
		document.getElementById('yy').value = YY;
	}
	</script>
	<script type="text/javascript">
	 function sendMail(){
		 var params= {
			 to_name: "<%=user.getfName()%> <%=user.getlName()%>" ,
			 to_address: "<%=user.getAdd()%>" ,
			 to_email: "<%=user.getEmail()%>",
			 to_itemName: "<%=inn.getIfrom()%>",
			 to_type: "<%=inn.getItype()%>",
			 to_price: "<%=inn.getIprice()%>",
		 };
		 emailjs.send("service_73pc8m8","template_f5akfll",params).then(function(res){
			 console.log("Success!!");
			 alert("Success",res.status);
		 });
	 }
	</script>
	<script type="text/javascript">
      let m = "<%=inn.getMm()%>";
	  let y = "<%=inn.getYy()%>";
	  console.log(m + " "+ y);
	  
	  var n = m.value;
	  var count = 0;

	  if (n >= 1) ++count;

	  while (n / 10 >= 1) {
		n /= 10;
		++count;
    	}

	   if (count > 1) {
		   mmyy.value = "<%=inn.getYy()%>-<%=inn.getMm()%>";
	   } else {
		   mmyy.value = "<%=inn.getYy()%>-0<%=inn.getMm()%>";
		}
	</script>


</body>
<%
} else {
response.sendRedirect("LogoutServ");
}
%>
</html>