// Employee.js
// Contains logic related to searching/showing/hiding employees based on user input

$().ready(function () {
	//  sift employees based on each user input (show/hide)
	$('#q').keyup(function() {
		$('.employee').each(function() {
			var variable = $('#q').val();
			var pattern = new RegExp(variable, 'gi')
			// search: name value
			if($(this).children('.name')[0].innerHTML.match(pattern)) {
				$(this).show();
			} else {
				$(this).hide();
			};
		})
	});
	// see if the search field has been cleared (click X)
	$('#q').click(function(e) {
		var searchString = this.value;
		if(searchString == "" ) {
			// search field is empty
			// show all employees
			$('.employee').each(function() {
				$(this).show();
			})
		}
	});
	// attach fancybox behavior to each person
	$(".employee").live("click",function(ev){
    	ev.preventDefault();
    	$.fancybox({
        	type: "iframe",
			href: $(this).find('.employee-details').attr('href'),
			'transitionIn'	:	'elastic',
			'transitionOut'	:	'elastic',
			'speedIn'		:	10, 
			'speedOut'		:	10, 
			'overlayShow'	:	true,
			'height'		: 	600
    	})
	});
});
