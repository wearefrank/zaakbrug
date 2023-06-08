<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="text"/>
    <xsl:param name="catalogus_url" />
    
    <xsl:template match="/">
    
    	<xsl:variable name="cat_url">{{catalogus_url}}</xsl:variable>
    	<!-- <xsl:value-of select="replace(//Body,'catalogus_url','cat_url')" version="2.0"/> -->
    	
    	<xsl:call-template name="string-replace-all">
	        <xsl:with-param name="text" select="//Body"/>
	        <xsl:with-param name="replace" select="$cat_url"/>
	        <xsl:with-param name="by" select="$catalogus_url"/>
	      </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="string-replace-all">
	  <xsl:param name="text"/>
	  <xsl:param name="replace"/>
	  <xsl:param name="by"/>
	  <xsl:choose>
	    <xsl:when test="contains($text,$replace)">
	      <xsl:value-of select="substring-before($text,$replace)"/>
	      <xsl:value-of select="$by"/>
	      <xsl:call-template name="string-replace-all">
	        <xsl:with-param name="text" select="substring-after($text,$replace)"/>
	        <xsl:with-param name="replace" select="$replace"/>
	        <xsl:with-param name="by" select="$by"/>
	      </xsl:call-template>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:value-of select="$text"/>
	    </xsl:otherwise>
	  </xsl:choose>
	</xsl:template>
    
</xsl:stylesheet>