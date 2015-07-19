$(function() {
	//course xslt
	magicXML.parse();
	//all exercises xslt
	magicXML.parse(".exercise");
	
	//we need this to make accordion open from external links
	if (window.location.hash.indexOf("#collapse") === 0) {
		$(window.location.hash).collapse("show");
	}
	
	//video stop on modal hide
	$(".modal").on('hidden.bs.modal', function(e) {
	    $iframe = $(this).find( "iframe" );
	    $iframe.attr("src", $iframe.attr("src"));
	}); 
	//close all accordions
	$('.closeall').click(function(){
		  $('.panel-collapse.in')
		    .collapse('hide');
		});
	//open all accordions
		$('.openall').click(function(){
		  $('.panel-collapse:not(".in")')
		    .collapse('show');
		});
		
});