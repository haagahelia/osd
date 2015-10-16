<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	
	<xsl:template match="/exercise">
		<html>
		<head>
		<meta charset="utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/> <!-- IE spec.	x-ua-compatible -> allows users to choose what IE version should be used | content == most recent IE version | chrome=1 -> support for chromeframe plugin for ie-->
		<meta name="viewport" content="width=device-width, initial-scale=1"/> <!-- viewport = how the page should be showed | content -> render site as wide as browser width. allows landscape and portrait mode for mobile | initial scale=1 -> prevents content (eg. text) zoom when switching to landscape mode -->
		<title><xsl:value-of select="@title"/></title>
		
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>  
		<link rel="stylesheet" type="text/css" href="css/prism.css"/>
		
		<!-- SCRIPTS -->
		<script src="js/jquery-1.11.3.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/prism.js"></script> 
		<!-- <script src="js/main.js"></script> --> 
		</head>
		<!-- syntax highlighting for code-blocks is javascript by default-->
		<body class="language-javascript" style="margin: 10px">
		          <h1><xsl:value-of select="@id"/>&#xA0;<xsl:value-of select="@title"/></h1>
		          <p><b>Difficulty: <xsl:value-of select="@difficulty"/><br/>
		          Size: <xsl:value-of select="@size"/></b></p>
		          <br/>
            <div>
                  <xsl:copy-of select="node()"/>
            </div>
				<xsl:choose>
    				<xsl:when test="@template">
 						<a target="_blank" class="btn btn-success col-xs-12 col-sm-4"><xsl:attribute name="href"><xsl:value-of select="@template"/></xsl:attribute><span class="glyphicon glyphicon-download"/>&#xA0;&#xA0;Download Template Code</a>
    				</xsl:when>
  				  </xsl:choose> 
                 <xsl:choose>
    				<xsl:when test="a/@href and a/@class ='jsbin-embed'">
 						<a target="_blank" class="btn btn-success col-xs-12 col-sm-4"><xsl:attribute name="href"><xsl:value-of select="a/@href"/></xsl:attribute><span class="glyphicon glyphicon-edit"/>&#xA0;&#xA0;Start editing in JSBin</a>
    				</xsl:when>
  				</xsl:choose>                   
                <a target="_blank" class="btn btn-success col-xs-12 col-sm-4"><xsl:attribute name="href"><xsl:value-of select="@returnbox"/></xsl:attribute><span class="glyphicon glyphicon-check"/>&#xA0;&#xA0;Return your solution at Moodle</a>
                <a target="_blank" class="btn btn-success col-xs-12 col-sm-4"><xsl:attribute name="href"><xsl:value-of select="@id"/>.xml.standalone.html</xsl:attribute><span class="glyphicon glyphicon-new-window"/>&#xA0;&#xA0;Open assignment in a new window</a>
         </body>
		</html>
	</xsl:template>


		

	
</xsl:stylesheet>