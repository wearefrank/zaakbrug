<xsl:stylesheet exclude-result-prefixes="xsl xs" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="Alpha2" select="''" as="xs:string" />
    <xsl:param name="Alpha3t" select="''" as="xs:string" />
    <xsl:param name="Alpha3b" select="''" as="xs:string" />
    <xsl:param name="Alpha3" select="''" as="xs:string" />
    
    <xsl:key name="alpha2" match="row" use="alpha2"/>
    <xsl:key name="alpha3t" match="row" use="alpha3-t"/>
    <xsl:key name="alpha3b" match="row" use="alpha3-b"/>
    
    <xsl:template match="/root">
        <xsl:choose>
            <xsl:when test="$Alpha2">
                <xsl:for-each select="key('alpha2', $Alpha2)">
                    <xsl:value-of select="alpha3-t" />
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$Alpha3t">
                <xsl:for-each select="key('alpha3t', $Alpha3t)">
                    <xsl:value-of select="alpha2" />
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$Alpha3b">
                <xsl:for-each select="key('alpha3b', $Alpha3b)">
                    <xsl:value-of select="alpha2" />
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$Alpha3">
                <xsl:variable name="alpha3tResult">
                    <xsl:for-each select="key('alpha3t', $Alpha3)">
                        <xsl:value-of select="alpha2" />
                    </xsl:for-each>
                </xsl:variable>
                <xsl:choose>         
                    <xsl:when test="string-length($alpha3tResult) = 0">
                        <xsl:for-each select="key('alpha3b', $Alpha3)">
                            <xsl:value-of select="alpha2" />
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$alpha3tResult" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>