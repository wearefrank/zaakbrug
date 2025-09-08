<xsl:stylesheet exclude-result-prefixes="xs zgw" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://www.wearefrank.nl/zgw" xmlns:BG="http://www.egem.nl/StUF/sector/bg/0310" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="3.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates select="@*|node()"/>
    </xsl:template>

    <xsl:template match="*[objectType='adres']">
        <ZKN:heeftBetrekkingOp StUF:entiteittype="ZAKOBJ">
            <ZKN:gerelateerde>
                <ZKN:adres StUF:entiteittype="AOA">
                    <xsl:if test="objectIdentificatie/identificatie != ''">
                        <BG:identificatie><xsl:value-of select="objectIdentificatie/identificatie"/></BG:identificatie>
                    </xsl:if>
                    <xsl:if test="objectIdentificatie/wplWoonplaatsNaam != ''">
                        <BG:wpl.woonplaatsNaam><xsl:value-of select="objectIdentificatie/wplWoonplaatsNaam"/></BG:wpl.woonplaatsNaam>
                    </xsl:if>
                    <xsl:if test="objectIdentificatie/gorOpenbareRuimteNaam != ''">
                        <BG:gor.openbareRuimteNaam><xsl:value-of select="objectIdentificatie/gorOpenbareRuimteNaam"/></BG:gor.openbareRuimteNaam>
                    </xsl:if>
                    <xsl:if test="objectIdentificatie/huisnummer != ''">
                        <BG:huisnummer><xsl:value-of select="objectIdentificatie/huisnummer"/></BG:huisnummer>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="normalize-space(objectIdentificatie/huisletter)">
                            <BG:huisletter>
                                <xsl:value-of select="objectIdentificatie/huisletter"/>
                            </BG:huisletter>
                        </xsl:when>
                        <xsl:otherwise>
                            <BG:huisletter xsi:nil="true" StUF:noValue="geenWaarde"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="normalize-space(objectIdentificatie/huisnummertoevoeging)">
                            <BG:huisnummertoevoeging>
                                <xsl:value-of select="objectIdentificatie/huisnummertoevoeging"/>
                            </BG:huisnummertoevoeging>
                        </xsl:when>
                        <xsl:otherwise>
                            <BG:huisnummertoevoeging xsi:nil="true" StUF:noValue="geenWaarde"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="normalize-space(objectIdentificatie/postcode)">
                            <BG:postcode>
                                <xsl:value-of select="objectIdentificatie/postcode"/>
                            </BG:postcode>
                        </xsl:when>
                        <xsl:otherwise>
                            <BG:postcode xsi:nil="true" StUF:noValue="geenWaarde"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </ZKN:adres>
            </ZKN:gerelateerde>
        </ZKN:heeftBetrekkingOp>
    </xsl:template>

</xsl:stylesheet>