$(document).ready(function() {
		let stat = false;
		$('#edit').click(function() {
			if (stat == false) {
				$('#profileDetails').hide();

				$('#profileEdit').show();

				$('#signOut').hide();
				
				$('#exampleModalLabel').text("Profile Edit");

				stat = true;

				$(this).text("Back");
			} else {
				$('#profileDetails').show();

				$('#profileEdit').hide();
				
				$('#signOut').show();

				$('#exampleModalLabel').text("Profile View");

				stat = false;

				$(this).text("Edit");
			}
		});

		$('#updateForm').on('submit', function(event) {

			event.preventDefault();

			let form = new FormData(this);
			$.ajax({
				url : "ProfileEditServ",
				type : 'post',
				data : form,
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					
					 if(data.trim()==='Done!'){
						 swal("Updated successfully !! ")
						 .then((value) => {
						   swal("Refreshing...!!");
						   window.location.reload();
						 });
					   }
						 else swal(data);
				

				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR)
					 
					 swal(jqXHR);
				},
				processData : false,
				contentType : false
			});
		});
	});