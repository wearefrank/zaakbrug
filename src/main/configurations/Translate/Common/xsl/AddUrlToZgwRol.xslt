<xsl:stylesheet exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <xsl:param name="Url" />

    <xsl:template match="/zgwRol">
        <xsl:copy>
            <xsl:copy-of select="@*|node()" />
            <url><xsl:value-of select="$Url" /></url>
        </xsl:copy>
    </xsl:template>

    <!-- Anything that is not a zgwRol (e.g. the result of a role that could not be translated) can never be matched. -->
    <xsl:template match="/*[not(self::zgwRol)]">
        <dummy />
    </xsl:template>
</xsl:stylesheet>
