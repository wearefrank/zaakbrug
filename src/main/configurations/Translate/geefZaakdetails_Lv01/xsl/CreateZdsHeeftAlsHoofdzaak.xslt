<xsl:stylesheet exclude-result-prefixes="xs zgw" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://www.wearefrank.nl/zgw" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="ZgwZaak" select="''"/>
    <xsl:param name="Identificatie" select="''"/>
    <xsl:param name="Omschrijving" select="''"/>

    <xsl:template match="/">
        <ZKN:heeftAlsHoofdzaak StUF:entiteittype="ZAKZAKHFD">
            <ZKN:gerelateerde StUF:entiteittype="ZAK">
                <xsl:choose>
                    <xsl:when test="$ZgwZaak">
                        <xsl:if test="$ZgwZaak/ZgwZaak/identificatie">
                            <ZKN:identificatie><xsl:value-of select="$ZgwZaak/ZgwZaak/identificatie"/></ZKN:identificatie>
                        </xsl:if>
                        <xsl:if test="$ZgwZaak/ZgwZaak/omschrijving">
                            <ZKN:omschrijving><xsl:value-of select="$ZgwZaak/ZgwZaak/omschrijving"/></ZKN:omschrijving>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="$Identificatie">
                            <ZKN:identificatie><xsl:value-of select="$Identificatie"/></ZKN:identificatie>
                        </xsl:if>
                        <xsl:if test="$Omschrijving">
                            <ZKN:omschrijving><xsl:value-of select="$Omschrijving"/></ZKN:omschrijving>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </ZKN:gerelateerde>
        </ZKN:heeftAlsHoofdzaak>
    </xsl:template>
</xsl:stylesheet>