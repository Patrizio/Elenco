// Employee.js
// Contains logic related to searching/showing/hiding employees based on user 

$(document).ready(function () {
	// Each employee when clicked should be displayed in a particulair way 
	$(".employee").live('click', function () {
		$this = $(this);
		$.fancybox({
        	type: "ajax",
			href: $this.attr('href'),
			'transitionIn'	:	'none',
			'transitionOut'	:	'none', 
			'overlayShow'	:	true,
			'autoDimensions': true
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