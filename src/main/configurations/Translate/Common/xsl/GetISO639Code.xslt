<xsl:stylesheet exclude-result-prefixes="xsl xs" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="Alpha2" select="''" as="xs:string" />
    <xsl:param name="Alpha3t" select="''" as="xs:string" />
    
    <xsl:key name="alpha2" match="row" use="alpha2"/>
    <xsl:key name="alpha3t" match="row" use="alpha3-t"/>
    
    <xsl:template match="/root">
        <xsl:choose>
            <xsl:when test="$Alpha2">
                <xsl:for-each select="key('alpha2', $Alpha2)">
                    <xsl:value-of select="alpha3-t"/>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$Alpha3t">
                <xsl:for-each select="key('alpha3t', $Alpha3t)">
                    <xsl:value-of select="alpha2"/>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>