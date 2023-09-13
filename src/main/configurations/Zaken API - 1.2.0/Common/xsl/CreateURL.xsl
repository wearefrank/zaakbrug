<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="text" />
    <xsl:param name="BaseUrl" />
    <xsl:param name="UrlParam" />
    
    <xsl:template match="/">
    	<xsl:variable name="tempUrl">
         <xsl:call-template name="Url">
             <xsl:with-param name="url" select="$UrlParam"/>
         </xsl:call-template>
         </xsl:variable>
         <xsl:variable name="fixedUrl">/zaken/api/v1/</xsl:variable>
          <xsl:choose>
            <xsl:when test="contains($UrlParam,$fixedUrl)">
                <xsl:value-of select="concat($BaseUrl,substring-after($UrlParam,$fixedUrl))"/>
            </xsl:when>
           <xsl:otherwise>
           		<xsl:value-of select="concat($BaseUrl,$tempUrl)"/>
           </xsl:otherwise>           
        </xsl:choose>
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