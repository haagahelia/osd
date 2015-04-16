$(function() {
	//course xslt
	magicXML.parse();
	//all exercises xslt
	magicXML.parse(".exercise");
	
	//we need this to make accordion open from external links
	if (window.location.hash.indexOf("#collapse") === 0) {
		$(window.location.hash).collapse("show");
	}
	
});