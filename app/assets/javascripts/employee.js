// Employee.js
// Contains logic related to searching/showing/hiding employees based on user 

$(document).ready(function () {
	// Each employee when clicked should be displayed in a particulair way 
	$(".employee").live("click", function(ev){
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
	// what should happen when interacting with the search-field
	$("#search").bind({
		keyup: function () {
				var searchStringLength = this.value.length;
				if ( searchStringLength == 0) {
					// empty searchvalue
					$.get($("#employees_search").attr("action"), $("#employees_search").serialize(), null, "script");
					return false;
				} else if (searchStringLength >= 3) {
					// 3 or more characters in searchvalue
					$.get($("#employees_search").attr("action"), $("#employees_search").serialize(), null, "script");
					return false;
				}				
		},
		click: function () {
				// cross to empty search clicked
				var searchStringLength = this.value.length;
				if ( searchStringLength == 0) {
					// empty searchvalue
					$.get($("#employees_search").attr("action"), $("#employees_search").serialize(), null, "script");
					return false;
				}
		}		
	})
});