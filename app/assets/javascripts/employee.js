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

	$("#search").bind({
		keyup: function () {
				$.get($("#employees_search").attr("action"), $("#employees_search").serialize(), null, "script");
				return false;
		},
		click: function () {
				var searchString = this.value;
				if(searchString == "" ) {
					// search field is empty
					// show all employees
					$.get($("#employees_search").attr("action"), $("#employees_search").serialize(), null, "script");
					return false;		
				}
		}
	})
});