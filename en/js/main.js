$(function() {
	magicXML.parse();
	magicXML.parse(".exercise");
});

/*
$(function() {
	new Transformation().setXml("xml/course.xml")
    .setXslt("xsl/course.xsl").transform("content");
	alert($(".exercise").size());
	setTimeout(function() {
		$(".exercise").each(
				function() {
					alert(this.id);
					new Transformation().setXml(this.id)
			    .setXslt("xsl/exercise.xsl").transform(this.id)
			    });
	}, 5000);
	
});*/
/*$(function() {
 $("#content").xslt("xml/course.xml", "xsl/course.xsl");
});*/
/*
function doCourseXslt() {
	
}

fonction doExerciseXslt(var xmlFile, var parentElement) {
	
}
*/