<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="text"/>
    <xsl:param name="zaaktype" select="''" as="xs:string" />
    <xsl:param name="SOAPAction" select="''" as="xs:string" />

    <xsl:template match="/">
        <!-- Check for profile with matching zaakTypeIdentificatie, otherwise, take the default -->
        <xsl:choose>
            <xsl:when test="//profile[zaakTypeIdentificatie = $zaaktype]">
                <xsl:value-of select="//profile[zaakTypeIdentificatie = $zaaktype]/*[@name=$SOAPAction]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="//profileDefaults/*[@name=$SOAPAction]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>