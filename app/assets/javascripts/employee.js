$(document).ready(function () {
	$(".employee").live("click",function(ev){
    	ev.preventDefault();
    	$.fancybox({
        	type: "iframe",
			href: $(this).attr('href'),
			'transitionIn'	:	'elastic',
			'transitionOut'	:	'elastic',
			'speedIn'		:	10, 
			'speedOut'		:	10, 
			'overlayShow'	:	true,
			'height'		: 	600
    	})
	});
});

$(function() {
	$("#employees_search input").keyup( function() {
		$.get($("#employees_search").attr("action"), $("#employees_search").serialize(), null, "script");
		return false;
	});
});