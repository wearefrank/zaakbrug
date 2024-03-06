<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />

    <xsl:param name="defaults"/>

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*[not(node())]">
        <xsl:copy>
            <xsl:value-of select="$defaults//*[local-name() = local-name(current())] | ." />
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>