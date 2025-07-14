<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates select="@*|node()" />
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="ZKN:code">
        <xsl:copy-of select="."/>
        <Zaaktype><xsl:value-of select="."/></Zaaktype>
    </xsl:template>
</xsl:stylesheet>