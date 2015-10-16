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
		<body class="language-javascript">
		<p><button type="button" class="btn btn-success col-xs-12 col-sm-6" data-toggle="modal">
		<xsl:attribute name="data-target">#<xsl:value-of select="concat('E', translate(@id, '.', ''))" /></xsl:attribute>
		<span class="glyphicon glyphicon-pencil" title="Exercise"></span>
		&#xA0;&#xA0;<xsl:value-of select="@id"/>&#xA0;<xsl:value-of select="@title"/>
		<xsl:choose>
			<xsl:when test="@difficulty = 'easy'">
			&#xA0;&#xA0;<span title="Difficulty: Easy"><span class="glyphicon glyphicon-star hide-xs"></span><span class="glyphicon glyphicon-star-empty hide-xs"></span><span class="glyphicon glyphicon-star-empty hide-xs"></span></span>
			</xsl:when>
			<xsl:when test="@difficulty = 'medium'">
			&#xA0;&#xA0;<span title="Difficulty: Medium"><span class="glyphicon glyphicon-star hide-xs"></span><span class="glyphicon glyphicon-star hide-xs"></span><span class="glyphicon glyphicon-star-empty hide-xs"></span></span>
			</xsl:when>
			<xsl:when test="@difficulty = 'hard'">
			&#xA0;&#xA0;<span title="Difficulty: Hard"><span class="glyphicon glyphicon-star hide-xs"></span><span class="glyphicon glyphicon-star hide-xs"></span><span class="glyphicon glyphicon-star hide-xs"></span></span>
			</xsl:when>
			<xsl:otherwise>
			&#xA0;&#xA0;<span title="Difficulty: Adjustable"><span class="glyphicon glyphicon-question-sign hide-xs"></span><span class="glyphicon glyphicon-question-sign hide-xs"></span><span class="glyphicon glyphicon-question-sign hide-xs"></span></span>
			</xsl:otherwise>
		</xsl:choose>
		&#xA0;<span class="hide-xs"><xsl:attribute name="title">Size: <xsl:value-of select="@size"/></xsl:attribute>(<xsl:value-of select="@size"/>)</span>
		</button></p>
          <div class="modal modal-wide fade" tabindex="-1" role="dialog" aria-hidden="true">
          	<xsl:attribute name="id"><xsl:value-of select="concat('E', translate(@id, '.', ''))" /></xsl:attribute>
          	<xsl:attribute name="aria-labelledby"><xsl:value-of select="concat('E', translate(@id, '.', ''))" /></xsl:attribute>
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
                <div class="modal-header alert-success">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&#215;</button>
                  <h4 class="modal-title"><xsl:value-of select="@id"/>&#xA0;<xsl:value-of select="@title"/></h4>
                </div>
                <div class="modal-body">
                  <xsl:copy-of select="node()"/>
                </div>
                <div class="modal-footer">
                  <xsl:choose>
    				<xsl:when test="@template">
 						<a target="_blank" class="btn btn-success col-xs-12 col-sm-4"><xsl:attribute name="href"><xsl:value-of select="@template"/></xsl:attribute><span class="glyphicon glyphicon-new-window"/>&#xA0;&#xA0;Template Code</a>
    				</xsl:when>
  				  </xsl:choose> 
                 <xsl:choose>
    				<xsl:when test="a/@href and a/@class ='jsbin-embed'">
 						<a target="_blank" class="btn btn-success col-xs-12 col-sm-4"><xsl:attribute name="href"><xsl:value-of select="a/@href"/></xsl:attribute><span class="glyphicon glyphicon-new-window"/>&#xA0;&#xA0;Online Editor</a>
    				</xsl:when>
  				</xsl:choose>                   
                <a target="_blank" class="btn btn-success col-xs-12 col-sm-4"><xsl:attribute name="href"><xsl:value-of select="@returnbox"/></xsl:attribute><span class="glyphicon glyphicon-new-window"/>&#xA0;&#xA0;Return Box</a>
                </div>
              </div>
            </div>
          </div>
         </body>
		</html>
	</xsl:template>


		

	
</xsl:stylesheet>