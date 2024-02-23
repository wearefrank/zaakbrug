<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:param name="defaults" />

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/">
        <root>
            <message>
                <xsl:copy-of select="root/node()" />
            </message>
            <defaults>
                <xsl:copy-of select="$defaults/root/node()" />
            </defaults>
        </root>
    </xsl:template>
</xsl:stylesheet>