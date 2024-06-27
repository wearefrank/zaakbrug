<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>    
    <xsl:param name="ZdsWordtZaakRol"/>

	<xsl:template match="/">
        <xsl:for-each select="roles/role">
            <xsl:if test="typeRolOmschrijving = $ZdsWordtZaakRol/role/typeRolOmschrijving">
                <xsl:choose>
                    <xsl:when test="count(gerelateerde/*) = 0 and string-length($ZdsWordtZaakRol/role/gerelateerde) > 0">New</xsl:when>
                    <xsl:when test="count(gerelateerde/*) > 0 and $ZdsWordtZaakRol/role/gerelateerde/*[@*:verwerkingssoort='V']">Delete</xsl:when>
                    <xsl:when test="$ZdsWordtZaakRol/role/gerelateerde/*[@*:verwerkingssoort='W']">Changed</xsl:when>
                    <xsl:otherwise>Exit</xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>