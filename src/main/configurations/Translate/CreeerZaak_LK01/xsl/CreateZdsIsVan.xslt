<xsl:stylesheet exclude-result-prefixes="xs zgw" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="ZgwZaakType" select="''"/>
    <xsl:param name="Identificatie" select="''"/>
    <xsl:param name="Omschrijving" select="''"/>
    
    <xsl:template match="/">
        <isVan>
            <xsl:attribute name="entiteittype" select="'ZAKZKT'"/>
            <gerelateerde>
                <xsl:attribute name="entiteittype" select="'ZKT'"/>
                <xsl:choose>
                    <xsl:when test="$ZgwZaakType">
                        <code><xsl:value-of select="$ZgwZaakType/ZgwZaakType/identificatie"/></code>
                        <omschrijving><xsl:value-of select="$ZgwZaakType/ZgwZaakType/omschrijving"/></omschrijving>
                    </xsl:when>
                    <xsl:otherwise>
                        <code><xsl:value-of select="$Identificatie"/></code>
                        <omschrijving><xsl:value-of select="$Omschrijving"/></omschrijving>
                    </xsl:otherwise>
                </xsl:choose>
            </gerelateerde>
        </isVan>
    </xsl:template>
</xsl:stylesheet>