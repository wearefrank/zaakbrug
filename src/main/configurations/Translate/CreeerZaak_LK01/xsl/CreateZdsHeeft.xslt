<xsl:stylesheet exclude-result-prefixes="xs zgw" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://www.wearefrank.nl/zgw" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="ZgwZaakType" select="''"/>
    <xsl:param name="ZgwStatus" select="''"/>
    <xsl:param name="ZgwStatusType" select="''"/>
    <xsl:param name="Identificatie" select="''"/>
    <xsl:param name="Omschrijving" select="''"/>
    <xsl:param name="StatusToelichting" select="''"/>
    <xsl:param name="IndicatieLaatsteStatus" select="''"/>
    <xsl:param name="DatumStatusGezet" select="''"/>
    
    <xsl:function name="zgw:convertZgwBooleanToZdsBoolean" as="xs:string">
        <xsl:param name="zgwBoolean" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="lower-case($zgwBoolean)='true'">J</xsl:when>
            <xsl:when test="lower-case($zgwBoolean)='false'">N</xsl:when>
            <xsl:otherwise>invalid character</xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:function name="zgw:convertZdsDateTimeToZgwDateTime" as="xs:string">
        <xsl:param name="dateStr" as="xs:string"/>
        <xsl:value-of select="concat(substring($dateStr,1,4), substring($dateStr,6,2), substring($dateStr,9,2), substring($dateStr,12,2), substring($dateStr,15,2), substring($dateStr,18,2))"/>
	</xsl:function>
    
    <xsl:template match="/">
        <heeft>
            <xsl:attribute name="entiteittype" select="'ZAKSTT'"/>
            <gerelateerde>
                <xsl:attribute name="entiteittype" select="'STT'"/>
                <xsl:choose>
                    <xsl:when test="$ZgwZaakType">
                        <zktCode><xsl:value-of select="$ZgwZaakType/ZgwZaakType/identificatie"/></zktCode>
                        <zktOmschrijving><xsl:value-of select="$ZgwZaakType/ZgwZaakType/omschrijving"/></zktOmschrijving>
                    </xsl:when>
                    <xsl:otherwise>
                        <zktCode><xsl:value-of select="$Identificatie"/></zktCode>
                        <zktOmschrijving><xsl:value-of select="$Omschrijving"/></zktOmschrijving>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="$ZgwStatus">
                        <omschrijving><xsl:value-of select="$ZgwStatus/ZgwStatus/statustoelichting"/></omschrijving>
                        <datumStatusGezet><xsl:value-of select="zgw:convertZdsDateTimeToZgwDateTime($ZgwStatus/ZgwStatus/datumStatusGezet)"/></datumStatusGezet>
                    </xsl:when>
                    <xsl:otherwise>
                        <omschrijving><xsl:value-of select="$StatusToelichting"/></omschrijving>
                        <omschrijving><xsl:value-of select="$DatumStatusGezet"/></omschrijving>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="$ZgwStatusType">
                        <indicatieLaatsteStatus><xsl:value-of select="zgw:convertZgwBooleanToZdsBoolean($ZgwStatus/ZgwStatus/indicatieLaatstGezetteStatus)"/></indicatieLaatsteStatus>
                    </xsl:when>
                    <xsl:otherwise>
                        <indicatieLaatsteStatus><xsl:value-of select="$IndicatieLaatsteStatus"/></indicatieLaatsteStatus>
                    </xsl:otherwise>
                </xsl:choose>
            </gerelateerde>
        </heeft>
    </xsl:template>
</xsl:stylesheet>