$(document).ready(function(){
	unescapseDescription();
});

function unescapseDescription() {
	$('.projectDescription').each(function(){
		$(this).html($(this).text()).text();
	});
}