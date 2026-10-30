<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <!-- ZDS isVan/gerelateerde/ingangsdatumObject (yyyyMMdd). Empty or invalid selects the most recent started version. -->
    <xsl:param name="IngangsdatumObject" select="''"/>

    <xsl:variable name="ingangsdatumString" select="normalize-space($IngangsdatumObject)"/>
    <xsl:variable name="ingangsdatumIso" select="concat(substring($ingangsdatumString, 1, 4), '-', substring($ingangsdatumString, 5, 2), '-', substring($ingangsdatumString, 7, 2))"/>
    <xsl:variable name="ingangsdatum" as="xs:date?"
        select="if (matches($ingangsdatumString, '^\d{8}$') and $ingangsdatumIso castable as xs:date) then xs:date($ingangsdatumIso) else ()"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/">
        <ZgwZaakTypen>
            <xsl:variable name="matchingZaakTypen" as="element(ZgwZaakType)*">
                <xsl:choose>
                    <xsl:when test="exists($ingangsdatum)">
                        <xsl:sequence select="ZgwZaakTypen/ZgwZaakType[
                            xs:date(beginGeldigheid) le $ingangsdatum
                            and (not(normalize-space(eindeGeldigheid)) or xs:date(eindeGeldigheid) gt $ingangsdatum)]"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="ZgwZaakTypen/ZgwZaakType[xs:date(beginGeldigheid) le current-date()]"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:for-each select="$matchingZaakTypen">
                <xsl:sort select="xs:date(beginGeldigheid)" order="descending"/>
                <xsl:if test="position() = 1">
                    <ZgwZaakType>
                        <xsl:apply-templates select="@*|node()"/>
                    </ZgwZaakType>
                </xsl:if>
            </xsl:for-each>
        </ZgwZaakTypen>
    </xsl:template>
</xsl:stylesheet>