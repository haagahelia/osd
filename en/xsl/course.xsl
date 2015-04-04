<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template match="/course">
		<h1>Orientation to Software Development</h1>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="part">
		<h2><xsl:value-of select="@title"/></h2>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="exercise">
		<div class="exercise" data-xslt="xsl/exercise.xsl">
		 <xsl:attribute name="data-xml">
			<xsl:value-of select="@file"/>
		</xsl:attribute> 
		</div>
		
	</xsl:template>
	 
</xsl:stylesheet>