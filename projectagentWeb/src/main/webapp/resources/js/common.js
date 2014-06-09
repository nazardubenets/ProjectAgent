$(document).ready(function(){
	unescape();
});

function unescape() {
	 $('.unescape').each(function(){
		var inner = $(this).find('.ui-inplace-display');
		inner.html(inner.text());
	 });
}
