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

$(document).ready(function () {
	$("a.employee-details").live("click",function(ev){
    	ev.preventDefault();
    	$.fancybox({
        	type: "iframe",
			href: this,
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