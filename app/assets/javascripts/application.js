// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.fancybox-1.3.1
//= require_tree .

$().ready(function () {
	//  sift employees based on each user input (show/hide)
	$('#q').keyup(function() {
		$('.employee').each(function() {
			var re = new RegExp($('#q').val(), 'i')
			// search: name value
			if($(this).children('.name')[0].innerHTML.match(re)) {
				$(this).show();
			} else {
				$(this).hide();
			};
		})
	});
	// see if the search field has been cleared (click X)
	$('#q').live("click", function(e) {
		var searchString = this.value;
		if(searchString == "" ) {
			// search field is empty
			// show all employees
			$('.employee').each(function() {
				$(this).show();
			})
		} else {
			// search field has content
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



