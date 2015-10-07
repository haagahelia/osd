<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"
    omit-xml-declaration="yes"
    encoding="UTF-8"
    indent="yes" />
    
	<xsl:template match="/exercise">
		
		<p><button type="button" class="btn btn-success col-xs-12 col-sm-6" data-toggle="modal" data-target="#{generate-id()}">
		<span class="glyphicon glyphicon-pencil" title="Exercise"></span>
		&#xA0;&#xA0;<xsl:value-of select="@title"/>
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
          <div class="modal modal-wide fade" tabindex="-1" role="dialog" aria-hidden="true" id="{generate-id()}" aria-labelledby="{generate-id()}">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
                <div class="modal-header alert-success">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&#215;</button>
                  <h4 class="modal-title"><xsl:value-of select="@title"/></h4>
                </div>
                <div class="modal-body">
                  <xsl:copy-of select="node()"/>
                </div>
                <div class="modal-footer">
                  <xsl:choose>
    				<xsl:when test="@template">
 						<a target="_blank" class="btn btn-success col-xs-12 col-sm-4"><xsl:attribute name="href"><xsl:value-of select="@template"/></xsl:attribute><span class="glyphicon glyphicon-new-window"/>&#xA0;&#xA0;Download Template Code</a>
    				</xsl:when>
  				  </xsl:choose> 
                 <xsl:choose>
    				<xsl:when test="a/@href and a/@class ='jsbin-embed'">
 						<a target="_blank" class="btn btn-success col-xs-12 col-sm-4"><xsl:attribute name="href"><xsl:value-of select="a/@href"/></xsl:attribute><span class="glyphicon glyphicon-new-window"/>&#xA0;&#xA0;Open JSBin</a>
    				</xsl:when>
  				</xsl:choose>                   
                <a target="_blank" class="btn btn-success col-xs-12 col-sm-4"><xsl:attribute name="href"><xsl:value-of select="@returnbox"/></xsl:attribute><span class="glyphicon glyphicon-new-window"/>&#xA0;&#xA0;Go to Return Box</a>
                </div>
              </div>
            </div>
          </div>
	</xsl:template>
	
	
</xsl:stylesheet>