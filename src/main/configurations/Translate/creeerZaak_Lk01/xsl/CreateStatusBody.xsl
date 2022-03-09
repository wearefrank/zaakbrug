<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:zgw="http://google.com/zgw" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="ZaakUrl"/>
    <xsl:param name="StatusType"/>
    <xsl:param name="Einddatum"/>
    <xsl:param name="ZdsStatusDatum"/>

    <xsl:template match="/">
        <status>
            <zaak><xsl:value-of select="$ZaakUrl"/></zaak>
            <statustype><xsl:value-of select="$StatusType/statusType/url"/></statustype>
            <statustoelichting><xsl:value-of select="$StatusType/statusType/omschrijving"/></statustoelichting>
            <datumStatusGezet>
                <xsl:choose>
                    <xsl:when test="$StatusType/statusType/isEindstatus = 'true' and not($Einddatum = 'Undefined')">
                        <xsl:value-of select="zgw:convertZdsDatetimeToZgwDatetime($Einddatum)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="zgw:convertZdsDatetimeToZgwDatetime($ZdsStatusDatum)"/>
                    <xsl:otherwise>
                </xsl:choose>
            </datumStatusGezet>
        </status>
    </xsl:template>

    <xsl:function name="zgw:convertZdsDatetimeToZgwDatetime" as="xs:dateTime">
        <xsl:param name="dateTimeStr" as="xs:string"/>
        <xsl:value-of select="concat(substring($dateTimeStr,1,4), '-', substring($dateTimeStr,5,2), '-', substring($dateTimeStr,7,2), 'T', substring($dateTimeStr,9,2), ':', substring($dateTimeStr,11,2), ':', substring($dateTimeStr,13,2), 'Z')"/>
    </xsl:function>
</xsl:stylesheet>