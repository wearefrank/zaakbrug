<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" />
        </xsl:copy>
    </xsl:template>
    <xsl:template match="message//*[not(node())]">
        <xsl:copy>
            <xsl:value-of
                select="/root/defaults//*[local-name() = local-name(current())]" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/root/defaults" />
</xsl:stylesheet>