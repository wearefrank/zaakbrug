<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:zgw="http://google.com/zgw" version="2.0" >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>

    <xsl:function name="zgw:mapVervalreden">
        <xsl:param name="vervalreden"/>
        <xsl:choose>
            <xsl:when test="$vervalreden = 'tijdelijk'">
                <xsl:text>Besluit met tijdelijke werking</xsl:text>
            </xsl:when>
            <xsl:when test="$vervalreden = 'ingetrokken_overheid'">
                <xsl:text>Besluit ingetrokken door overheid</xsl:text>
            </xsl:when>
            <xsl:when test="$vervalreden = 'ingetrokken_belanghebbende'">
                <xsl:text>Besluit ingetrokken o.v.v. belanghebbende</xsl:text>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>