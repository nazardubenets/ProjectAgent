$(document).ready(function(){
	$("#showPassword").click(function(){
		var isChecked = $(this).is(':checked');
		if (isChecked) {
			$("#password,#confirmPassword").prop('type', 'text');
		} else {
			$("#password,#confirmPassword").prop('type', 'password');
		}
	});
});