<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template match="/course">
	 	<a href="http://www.haaga-helia.fi/en"><img src="img/hh_logo_en.png" alt="HH Logo"/></a>
		<h1><img src="img/app.svg" alt="App" class="logo"/> Orientation to Software Development</h1>
		<div class="panel-group" id="accordion">
		<div class="exercise" data-xslt="foo.xsl" data-xml="foo.xml"/> <!-- TODO: why the first transformation on the second round is not done? -->
		<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<xsl:template match="part">
	<div>
	  <xsl:attribute name="class">
	  panel panel-<xsl:value-of select="@type"/> accordion-caret
	  </xsl:attribute>
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" class="accordion-toggle collapsed">
          	<xsl:attribute name="href">#collapse<xsl:number/></xsl:attribute>
          	<span aria-hidden="true"><xsl:attribute name="class">glyphicon glyphicon-<xsl:value-of select="@icon"/></xsl:attribute></span>&#xA0;<xsl:value-of select="@title"/>
          </a>
        </h4>
      </div>
      <div class="panel-collapse collapse">
      	<xsl:attribute name="id">collapse<xsl:number/></xsl:attribute>
        <div class="panel-body">
          <h3><xsl:value-of select="@title"/></h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
          <xsl:apply-templates/>
        </div>
      </div>
    </div>
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

</xsl:stylesheet>