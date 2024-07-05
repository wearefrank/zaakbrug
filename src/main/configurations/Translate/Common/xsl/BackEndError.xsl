<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="text" version="1.0" encoding="UTF-8" omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates select="(//error)[last()]" />
    </xsl:template>
    <xsl:template match="error">
        <xsl:choose>
            <xsl:when test="code='TechnicalError'">500</xsl:when>
            <xsl:when test="code='TranslationError'">400</xsl:when>
            <xsl:when test="code='ConfigurationError'">500</xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
