<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/> <!-- tarvitaan ie9-ie11 renderöintiin -->
	
	<xsl:template match="/course">
		<html>
		<head>
		<meta charset="utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/> <!-- IE spec.	x-ua-compatible -> allows users to choose what IE version should be used | content == most recent IE version | chrome=1 -> support for chromeframe plugin for ie-->
		<meta name="viewport" content="width=device-width, initial-scale=1"/> <!-- viewport = how the page should be showed | content -> render site as wide as browser width. allows landscape and portrait mode for mobile | initial scale=1 -> prevents content (eg. text) zoom when switching to landscape mode -->
		<title>Orientation to Software Development</title>
		
		<!-- CONDITIONAL SCRIPT if <ie9 then redirect to update page -->
		<!--[if lt IE 9]>
		     <script type="text/javascript">          
		     	alert("Seems your using IE8 or lower. Please upgrade to IE9 or higher.");
				window.location.href("http://windows.microsoft.com/en-us/internet-explorer/download-ie");
		        </script>
		<![endif]-->
		
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>  
		<link rel="stylesheet" type="text/css" href="css/prism.css"/>
		
		<!-- SCRIPTS -->
		<script src="js/jquery-1.11.3.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/prism.js"></script> 
		<script src="js/main.js"></script> 
		</head>
		<!-- syntax highlighting for code-blocks is javascript by default-->
		<body class="language-javascript">
		
		<div id="content" class="container">
		<!-- <span class="visible-xs">SIZE XS</span><span class="visible-sm">SIZE SM</span><span class="visible-md">SIZE MD</span><span class="visible-lg">SIZE LG</span> -->
	 	<br/><a href="http://www.haaga-helia.fi/en"><img src="img/hh_logo_en.png" alt="HH Logo"/></a>
		<h1><img alt="App" class="hidden-xs"><xsl:attribute name="src"><xsl:value-of select="@logo"/></xsl:attribute></img><xsl:value-of select="@title"/></h1>
		<div class="panel-group row" id="accordion">
		<xsl:apply-templates/>
		</div>
		
		<!-- Sidebar -->
        <div id="sidebar" class="hidden-xs hidden-sm hidden-md">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <h3>
                   	 <span class="hidden-lg visible-md">Menu</span>
                      <span class="visible-lg hidden-md"><span class="glyphicon glyphicon-th-list"></span>&#xA0;&#xA0;Menu</span>
                    </h3>
               	 </li>
                  <xsl:for-each select="part">
                 <li>
		                <a data-toggle="collapse">
			      			<xsl:attribute name="href">#collapse<xsl:number/></xsl:attribute>
			      			<xsl:attribute name="data-parent">#collapse<xsl:number/></xsl:attribute>
				          		<span class="hide-xs hidden-sm"><span class="glyphicon glyphicon-briefcase hidden-md"/>&#xa0;&#xa0;<xsl:value-of select="@title"/></span>
		          		</a>
	          	</li> 
				   </xsl:for-each>
            </ul><!-- /sidebar-nav -->
        </div> <!-- /#sidebar -->
        </div>
		</body>
		
		</html>
	</xsl:template>
	
	<xsl:template match="part">
	<div class="col-xs-12"> <!-- Parent to all xml-content -> full width -->
	  <xsl:attribute name="class">
	  panel panel-<xsl:value-of select="@type"/> accordion-caret
	  </xsl:attribute>
      <div class="panel-heading">
        <h2 class="panel-title">
        
          <a data-toggle="collapse" data-parent="#accordion" class="accordion-toggle collapsed">
          	<xsl:attribute name="href">#collapse<xsl:number/></xsl:attribute>
          	<span aria-hidden="true"><xsl:attribute name="class">glyphicon glyphicon-<xsl:value-of select="@icon"/></xsl:attribute></span>&#xA0;<xsl:value-of select="@title"/>
          </a>
        </h2>
      </div>
      <div class="panel-collapse collapse">
      	<xsl:attribute name="id">collapse<xsl:number/></xsl:attribute>
        <div class="panel-body">
          <h2><xsl:value-of select="@title"/></h2>	
          <xsl:apply-templates/>
        </div>
      </div>
    </div>
	</xsl:template>
	
	<!-- All content must be inside div element + content is col-xs-12 default-->
	<xsl:template match="pre | a | ul | li | b | table | tr | td| img| h1 | h2 | h3 | h4 | h5  | p">
	<div class="col-xs-12">
		<xsl:copy-of select="."/>
	</div>
	</xsl:template>
	
	<!-- Responsive badgeicon elements and ol- list -->
	<xsl:template match="badgeImg">
			<div class="img-responsive col-xs-3 pull-right hide-xs">
			<xsl:copy-of select="."/>
			</div>
		
			<div class="img-responsive col-xs-12 pull-right show-xs">
				<xsl:copy-of select="."/>
			</div>
	</xsl:template>
	
		<xsl:template match="ol">
		<div class="col-xs-9  hide-xs">
		<xsl:copy-of select="."/>	
		</div>
		
		<div class="col-xs-12 show-xs">
		<xsl:copy-of select="."/>
		</div>
	</xsl:template>
	
	
	<xsl:template match="exam">
			<p><a type="submit" target="_blank" class="btn btn-success col-xs-12 col-sm-4">
		<xsl:attribute name="href">
		<xsl:value-of select="@url"/>
		</xsl:attribute>
		<span title="Open Url in new window" class="glyphicon glyphicon-play"></span>
		&#xA0;&#xA0;<xsl:value-of select="@title"/>
		</a></p>
	</xsl:template>
	
	<xsl:template match="bookmark">
			<p><a type="submit" target="_blank" class="btn btn-info col-xs-12 col-sm-4">
		<xsl:attribute name="href">
		<xsl:value-of select="@url"/>
		</xsl:attribute>
		<span title="Open Url in new window" class="glyphicon glyphicon-new-window"></span>
		&#xA0;&#xA0;<xsl:value-of select="@title"/>
		</a></p>
	</xsl:template>
	
	<xsl:template match="section">
	  <div>
		<xsl:attribute name="class">
		panel panel-<xsl:value-of select="@type"/>
		</xsl:attribute>
		<div class="panel-heading">
			<b><xsl:value-of select="@title"/></b>
		</div>
		<div class="panel-body">
			<xsl:apply-templates/>
		</div>
	  </div>
	</xsl:template>

	<xsl:template match="exercise">
	<div>
		 <div class="exercise" data-xslt="xsl/exercise.xsl">
		 <xsl:attribute name="data-xml">
			<xsl:value-of select="@file"/>
		</xsl:attribute>
		</div>
</div>
	</xsl:template>
	
	<xsl:template match="subpage">
		<p><button type="button" class="btn btn-info col-xs-12 col-sm-4" data-toggle="modal" data-target="#{generate-id()}">
		<span title="Read more"><xsl:attribute name="class">glyphicon glyphicon-<xsl:value-of select="@icon"/></xsl:attribute></span>
		&#xA0;&#xA0;<xsl:value-of select="@title"/>
		</button></p>
		
          <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="{generate-id()}" aria-labelledby="{generate-id()}">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
                <div class="modal-header alert-info">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&#215;</button>
                  <h4 class="modal-title"><xsl:value-of select="@title"/></h4>
                </div>
                <div class="modal-body">
                  <xsl:copy-of select="node()"/>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default col-xs-12 col-sm-4" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>
	</xsl:template>

	<xsl:template match="video">
		<!-- <p><button type="button" class="btn btn-info col-xs-12 col-sm-4" data-toggle="modal" data-target="#{generate-id()}">
		<span title="Watch video" class="glyphicon glyphicon-facetime-video"></span>
		&#xA0;&#xA0;<xsl:value-of select="@title"/>
		</button></p>
          <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="{generate-id()}" aria-labelledby="{generate-id()}">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header alert-info">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&#215;</button>
                  <h4 class="modal-title"><xsl:value-of select="@title"/></h4>
                </div>
                <div class="modal-body">
                <div class="video-responsive">
                  <iframe  frameborder="0" allowfullscreen="allowfullscreen"><xsl:attribute name="src">https://www.youtube.com/embed/<xsl:value-of select="@youtubeid"/></xsl:attribute></iframe>
                </div>
                </div> -->
                <!-- <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div> 
              </div>
            </div>
          </div>-->
        <p><a type="button" target="_blank" class="btn btn-info col-xs-12 col-sm-4">
		<xsl:attribute name="href">https://www.youtube.com/watch?v=<xsl:value-of select="@youtubeid"/></xsl:attribute>
			<span title="Open video in new window" class="glyphicon glyphicon-facetime-video"></span>
			&#xA0;&#xA0;<xsl:value-of select="@title"/>
		</a></p>
	</xsl:template>

	<xsl:template match="slides">
		<!-- Slides won't work in ff or opera correctly when in modal, therefore opens in new tab
		
		<p class="btn-group"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#{generate-id()}">
		<span title="Open presentation slides" class="glyphicon glyphicon-blackboard"></span>
		&#xA0;&#xA0;<xsl:value-of select="@title"/>
		</button></p>
          <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="{generate-id()}" aria-labelledby="{generate-id()}">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header alert-info">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&#215;</button>
                  <h4 class="modal-title"><xsl:value-of select="@title"/></h4>
                </div>
                <div class="modal-body">
                  <div class="video-responsive">
                  <iframe><xsl:attribute name="src"><xsl:value-of select="@url"/></xsl:attribute></iframe>
	              </div>   
                </div>
                <div class="modal-footer">
                <a class="btn btn-info col-xs-12 col-sm-4" target="_blank"><xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute><span title="Open in new window" class="glyphicon glyphicon-new-window"></span>&#xA0;&#xA0;Open Presentation in new window</a>
                </div>
              </div>
            </div>
          </div> -->
		<p><a type="submit" target="_blank" class="btn btn-info col-xs-12 col-sm-4">
		<xsl:attribute name="href">
			<xsl:value-of select="@url"/>
		</xsl:attribute>
			<span title="Open Url in new window" class="glyphicon glyphicon-blackboard"></span>
			&#xA0;&#xA0;<xsl:value-of select="@title"/>
		</a></p>
		</xsl:template>

</xsl:stylesheet>