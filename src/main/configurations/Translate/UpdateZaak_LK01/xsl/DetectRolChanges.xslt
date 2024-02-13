<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="role/gerelateerde[@verwerkingssoort='T']">New</xsl:when>
            <xsl:when test="role/gerelateerde[@verwerkingssoort='V']">Delete</xsl:when>
            <xsl:when test="role/gerelateerde[@verwerkingssoort='W']">Changed</xsl:when>
            <xsl:when test="role/gerelateerde[@verwerkingssoort='I']">Check</xsl:when>
            <xsl:otherwise>Exit</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
