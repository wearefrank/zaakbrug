<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:param name="zaaktype" select="''" as="xs:string" />

    <xsl:template match="/">
        <root>
            <!-- Check for profile with matching zaakTypeIdentificatie -->
            <xsl:choose>
                <xsl:when test="//profile[zaakTypeIdentificatie = $zaaktype]">
                    <xsl:apply-templates select="//profile[zaakTypeIdentificatie = $zaaktype]/valueOverrides" mode="copy"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="//profileDefaults/valueOverrides" mode="copy"/>
                </xsl:otherwise>
            </xsl:choose>
        </root>
    </xsl:template>

    <xsl:template match="valueOverrides" mode="copy">
        <xsl:copy-of select="." />
    </xsl:template>
</xsl:stylesheet>
