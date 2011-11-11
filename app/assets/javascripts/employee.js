// Employee.js
// Contains logic related to searching/showing/hiding employees based on user 



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
	// see if the search field has been cleared (click X)
	$('#search').click(function(e) {
		var searchString = this.value;
		if(searchString == "" ) {
			// search field is empty
			// show all employees
			$.get($("#employees_search").attr("action"), $("#employees_search").serialize(), null, "script");
			return false;		
		}
	});
});

$(function() {
	$("#employees_search input").keyup( function() {
		$.get($("#employees_search").attr("action"), $("#employees_search").serialize(), null, "script");
		return false;
	});
});