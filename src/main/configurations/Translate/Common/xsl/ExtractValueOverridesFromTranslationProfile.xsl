<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:param name="zaaktype" select="''" as="xs:string" />

    <xsl:template match="/">
        <root>
            <xsl:apply-templates select="//profile[zaakTypeIdentificatie = $zaaktype]" />
        </root>
    </xsl:template>

    <xsl:template match="profile">
        <xsl:copy-of select="valueOverrides" />
    </xsl:template>
</xsl:stylesheet>
