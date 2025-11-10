<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="zaaktype" select="''" as="xs:string" />
    <xsl:param name="SOAPAction" select="''" as="xs:string" />

    <xsl:template match="/">
        <!-- Check for profile with matching zaakTypeIdentificatie, otherwise, take the default -->
        <xsl:choose>
            <xsl:when test="//profile[zaakTypeIdentificatie = $zaaktype]">
                <xsl:copy-of select="//profile[zaakTypeIdentificatie = $zaaktype]/*[@name=$SOAPAction]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="//profileDefaults/*[name()=$SOAPAction]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>