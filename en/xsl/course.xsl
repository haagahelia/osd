<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template match="/course">
	 	<a href="http://www.haaga-helia.fi/en"><img src="img/hh_logo_en.png" alt="HH Logo"/></a>
		<h1><img alt="App"><xsl:attribute name="src"><xsl:value-of select="@logo"/></xsl:attribute></img><xsl:value-of select="@title"/> (<xsl:value-of select="@ects"/> ects)</h1>
		<div class="exercise" data-xslt="foo.xsl" data-xml="foo.xml"/> <!-- TODO: why the first transformation on the second round is not done? -->
		<div class="panel-group" id="accordion">
		<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<xsl:template match="part">
	<div>
	  <xsl:attribute name="class">
	  panel panel-<xsl:value-of select="@type"/> accordion-caret 
	  </xsl:attribute>
      <div class="panel-heading ">
        <h2 class="panel-title ">
        
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
	
	<xsl:template match="pre | p | a | ul | ol | li | b | table | tr | td | h1 | h2 | h3 | h4 | h5">
	<div>
		<xsl:copy-of select="."/>
	</div>
	</xsl:template>
	
	<xsl:template match="img">
		<div class="col-xs-12 col-sm-3 col-md-3 col-xl-3">
		<xsl:copy-of select="."/>
		</div>
	</xsl:template>
		<xsl:template match="ol">
		<div class="col-xs-12 col-sm-9 col-md-9 col-xl-9">
		<xsl:copy-of select="."/>
		</div>
	</xsl:template>
	
	<xsl:template match="exam">
			<p><a type="submit" target="_blank" class="btn btn-success">
		<xsl:attribute name="href">
		<xsl:value-of select="@url"/>
		</xsl:attribute>
		<span title="Open Url in new window" class="glyphicon glyphicon-play"></span>
		&#xA0;&#xA0;<xsl:value-of select="@title"/>
		</a></p>
	</xsl:template>
	
	<xsl:template match="bookmark">
			<p><a type="submit" target="_blank" class="btn btn-info">
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
		 <div class="exercise" data-xslt="xsl/exercise.xsl">
		 <xsl:attribute name="data-xml">
			<xsl:value-of select="@file"/>
		</xsl:attribute>
		</div>

	</xsl:template>
	
	<xsl:template match="subpage">
		<p><button type="button" class="btn btn-info" data-toggle="modal" data-target="#{generate-id()}">
		<span title="Read more"><xsl:attribute name="class">glyphicon glyphicon-<xsl:value-of select="@icon"/></xsl:attribute></span>
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
                  <xsl:copy-of select="node()"/>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>
	</xsl:template>

	<xsl:template match="video">
		<p><button type="button" class="btn btn-info" data-toggle="modal" data-target="#{generate-id()}">
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
                  <iframe width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"><xsl:attribute name="src">https://www.youtube.com/embed/<xsl:value-of select="@youtubeid"/></xsl:attribute></iframe>
                </div>
                <!-- <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div> -->
              </div>
            </div>
          </div>
	</xsl:template>

	<xsl:template match="slides">
		<p><button type="button" class="btn btn-info" data-toggle="modal" data-target="#{generate-id()}">
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
                  
                  <iframe width="560" height="315" frameborder="0"><xsl:attribute name="src"><xsl:value-of select="@url"/></xsl:attribute></iframe>
                </div>
                <div class="modal-footer">
                <a class="btn btn-info" target="_blank"><xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute><span title="Open in new window" class="glyphicon glyphicon-new-window"></span>&#xA0;&#xA0;Open Presentation in new window</a>
                </div>
              </div>
            </div>
          </div>
	</xsl:template>

</xsl:stylesheet>