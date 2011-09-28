$(document).ready(function () {
	$("a.employee-details").live("click",function(ev){
    	ev.preventDefault();
    	$.fancybox({
        	type: "iframe",
			href: this,
			'transitionIn'	:	'elastic',
			'transitionOut'	:	'elastic',
			'speedIn'		:	150, 
			'speedOut'		:	100, 
			'overlayShow'	:	true,
			'height'		: 	450
    	})
	});
});

$(function() {
	$("#employees_search input").keyup( function() {
		$.get($("#employees_search").attr("action"), $("#employees_search").serialize(), null, "script");
		return false;
	});
});