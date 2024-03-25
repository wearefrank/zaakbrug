<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="text" />
    <xsl:param name="zaak" />
    
    <xsl:template match="/">
    	<xsl:variable name="amp"><xsl:text disable-output-escaping="yes"><![CDATA[&]]></xsl:text> </xsl:variable>
    	<xsl:call-template name="Url">
            <xsl:with-param name="url">
            	<xsl:choose>
		            <xsl:when test="contains($zaak,$amp)">
		                <xsl:value-of select="substring-before(substring-after($zaak,'zaak='),$amp)"/>
		            </xsl:when>
		           <xsl:otherwise>
		           		<xsl:value-of select="substring-after($zaak,'/')"/>
		           </xsl:otherwise>           
		        </xsl:choose>
            </xsl:with-param>
        </xsl:call-template>
         
    	
    </xsl:template>
    <xsl:template name="Url">
    	 <xsl:param name="url"/> 
        <xsl:choose>
            <xsl:when test="contains(substring-after($url,'/'),'/')">
                <xsl:call-template name="Url">
                    <xsl:with-param name="url" select="substring-after($url,'/')"/>
                </xsl:call-template>
            </xsl:when>
           <xsl:otherwise>
           		<xsl:value-of select="substring-after($url,'/')"/>
           </xsl:otherwise>           
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>