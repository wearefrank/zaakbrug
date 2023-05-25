<xsl:stylesheet exclude-result-prefixes="xsl xs" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

    <xsl:param name="Alpha2" select="''" as="xs:string"/>
    <xsl:param name="Alpha3" select="''" as="xs:string"/>

    <xsl:key name="alpha2" match="row[alpha2]" use="alpha2"/>
    <xsl:key name="alpha3b" match="row[alpha3-b]" use="alpha3-b"/>
    <xsl:key name="alpha3t" match="row[alpha3-t]" use="alpha3-t"/>

    <xsl:template match="/root">
        <xsl:choose>
            <xsl:when test="$Alpha2">
                <xsl:variable name="matchedRows" select="key('alpha2', $Alpha2)"/>
                <xsl:choose>
                    <xsl:when test="not(string-length($matchedRows/alpha3-t))">
                        <xsl:value-of select="$matchedRows/alpha3-b"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$matchedRows/alpha3-t"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$Alpha3">
                <xsl:variable name="matchedRowsT" select="key('alpha3t', $Alpha3)"/>
                <xsl:variable name="matchedRowsB" select="key('alpha3b', $Alpha3)"/>
                <xsl:variable name="partialMatch"
                              select="key('alpha3t', substring($Alpha3, 1, 3)) | key('alpha3b', substring($Alpha3, 1, 3))"/>

                <xsl:choose>
                    <xsl:when test="$matchedRowsT">
                        <xsl:apply-templates select="$matchedRowsT/alpha2"/>
                    </xsl:when>
                    <xsl:when test="$matchedRowsB">
                        <xsl:apply-templates select="$matchedRowsB/alpha2"/>
                    </xsl:when>
                    <xsl:when test="$partialMatch">
                        <xsl:apply-templates select="$partialMatch/(alpha2 | alpha3-t | alpha3-b)[1]"/>
                    </xsl:when>
                    <xsl:when test="key('alpha2', $Alpha3)">
                        <xsl:apply-templates select="key('alpha2', $Alpha3)/alpha2"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>