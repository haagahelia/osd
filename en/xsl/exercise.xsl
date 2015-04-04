<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template match="/exercise">
		<p><a href="#">EXERCISE: <xsl:value-of select="@title"/> (<xsl:value-of select="@difficulty"/>)</a></p>
	</xsl:template>
	
</xsl:stylesheet>