<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="ZdsWordtZaakRol"/>

    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="$ZdsWordtZaakRol/role/gerelateerde[@verwerkingssoort='T']">New</xsl:when>
            <xsl:when test="$ZdsWordtZaakRol/role/gerelateerde[@verwerkingssoort='V'] and roles/role/typeRolOmschrijving = $ZdsWordtZaakRol/role/typeRolOmschrijving">Delete</xsl:when>
            <xsl:when test="$ZdsWordtZaakRol/role/gerelateerde[@verwerkingssoort='W'] and roles/role/typeRolOmschrijving = $ZdsWordtZaakRol/role/typeRolOmschrijving">Changed</xsl:when>
            <xsl:otherwise>Exit</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
