
function myFunction(event) {
		event.preventDefault();
		var mmy = document.getElementById('mmyy');
		let y = mmy.value;
		console.log(y);
		var nY = y.substring(0, y.indexOf("-"));
		console.log(nY);

		var nM = y.substring(y.indexOf("-") + 1);
		console.log(nM);
		document.getElementById('Nyear').value = nY;
		document.getElementById('Nmnth').value = nM;
		
		document.getElementById('editForm').submit();
}

$(document).ready(function() {
	

	let stat = false;
	$('#editBtn').click(function() {

		if (stat == false) {
			$('#expenseView').hide();
			$('#editForm').show();
			$('#editBtn').text("Back to View");
			$('#incHead').text("Edit Details");
			$('#aExp').hide();
			$('#delExp').hide();
			$('#sInvoice').hide();
			stat = true;
		}else{
			$('#expenseView').show();
			$('#editForm').hide();
			$('#sInvoice').show();
			$('#aExp').show();
			$('#delExp').show();
			$('#editBtn').text("Edit");
			$('#incHead').text("Income Details");
			stat=false;
		}

	});
});