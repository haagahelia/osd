$(function() {
		
	//get prexslt exercises by xhr
	$(".exercise").each(
			function() {
				$(this).load($(this).data("xml")+".html");
			}
	);
	/*
	//we need this to make accordion open from external links
	if (window.location.hash.indexOf("#collapse") === 0) {
		$(window.location.hash).collapse("show");
	}
	
	//video stop on modal hide
	$(".modal").on('hidden.bs.modal', function(e) {
	    $iframe = $(this).find( "iframe" );
	    $iframe.attr("src", $iframe.attr("src"));
	}); 
	*/
	//use bootstraps built-in event callback to scroll up to accordion header
	$("#accordion").on("shown.bs.collapse", function () {
	    var myEl = $(this).find('.collapse.in').prev('.panel-heading');

	    $('html, body').animate({
	        scrollTop: $(myEl).offset().top
	    }, 500);
	});
	
	// when .modal-wide opened, set content-body height based on browser height; 200 is approx height of modal padding, modal title and button bar
	$(".modal-wide").on("show.bs.modal", function() {
	  var height = $(window).height() - 200;
	  $(this).find(".modal-body").css("max-height", height);
	});

	// Close all open accordions when sidemenu is clicked. -> href opens next accordion.	
	$('#sidebar li a').click(function() {           
		$('.panel-collapse.in').collapse('hide');
	});
	
	/*//close all accordions
	$('.closeall').click(function(){
		  $('.panel-collapse.in')
		    .collapse('hide');
		});
	//open all accordions
		$('.openall').click(function(){
		  $('.panel-collapse:not(".in")')
		    .collapse('show');
		});
		*/
		
});