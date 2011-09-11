$(document).ready(function () {
	$("a.employee").live("click",function(ev){
    	ev.preventDefault();
    	$.fancybox({
        	type: "iframe",
			href: this
    	})
	});
});

$(function() {
	$("#employees_search input").keyup( function() {
		$.get($("#employees_search").attr("action"), $("#employees_search").serialize(), null, "script");
		return false;
	});
});