

$(document).ready(function() {
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
	})
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