// Employee.js
// Contains logic related to searching/showing/hiding employees based on user 

$(document).ready(function () {
	$("#company_details").hide();
	$(".company_name").click(function() {
    	$("#company_details").slideToggle(100);
  	});
	// Each employee when clicked should be displayed in a particulair way 
	$(".employee").live('click', function () {
		$.getJSON($(this).attr('href'), function(data) {
			console.log(data);
		});
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