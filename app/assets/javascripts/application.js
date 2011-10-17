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
	// instant search on name-value
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



