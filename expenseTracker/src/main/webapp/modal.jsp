<!-- Modal -->
<% User u4 = (User)session.getAttribute("currentUser");
 if(u4!=null){
%>
<div class="container">
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5  lead" id="staticBackdropLabel">Welcome !!</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>

				</div>
				<div class="modal-body">
				
				<!-- Profile View -->
					<h5 id ="exampleModalLabel" class="lead">Profile Details</h5>
					<div id="profileDetails">
						<table class="table">
							<tbody>

								<tr>
									<th scope="row">User ID</th>
									<td><%=u4.getUid()%></td>
								</tr>

								<tr>
									<th scope="row">User Name</th>
									<td><%=u4.getfName()%> <%=u4.getlName()%></td>
								</tr>

								<tr>
									<th scope="row">Email</th>
									<td><%=u4.getEmail()%></td>
								</tr>
						</table>
					</div>
					
					<!-- End of View -->
					
					<!-- Profile Edit -->
					<div>
					 <%@include file="profileEdit.jsp" %>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" id="edit" class="btn btn-primary">Edit Details</button>
				</div>
			</div>
		</div>
	</div>
</div>
<% } %>