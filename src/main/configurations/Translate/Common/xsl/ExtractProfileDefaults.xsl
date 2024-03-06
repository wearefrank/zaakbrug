<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:variable name="zaaktype" />

    <xsl:template match="/">
        <root>
            <xsl:apply-templates select="//profile[zaakTypeIdentificatie=$zaaktype]" />
        </root>
    </xsl:template>

    <xsl:template match="profile">
        <xsl:copy-of select="profileDefaults/*" />
    </xsl:template>
</xsl:stylesheet>
