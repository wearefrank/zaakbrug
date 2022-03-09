<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="StatusBody"/>

    <xsl:template match="/">
        <xsl:for-each select="root/results">
            <xsl:if test="zgw:convertZdsDatetimeToZgwDatetime(datumStatusGezet) = zgw:convertZdsDatetimeToZgwDatetime($StatusBody/status/datumStatusGezet)">
                <xsl:if test="statustype = $StatusBody/status/statustype)">
                    <statusExists>true</statusExists>
                </xsl:if>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:function name="zgw:convertZdsDatetimeToZgwDatetime" as="xs:dateTime">
    	<xsl:param name="dateTimeStr" as="xs:string"/>
		<xsl:value-of select="concat(substring($dateTimeStr,1,4), '-', substring($dateTimeStr,5,2), '-', substring($dateTimeStr,7,2), 'T', substring($dateTimeStr,9,2), ':', substring($dateTimeStr,11,2), ':', substring($dateTimeStr,13,2), 'Z')"/>
	</xsl:function>
</xsl:stylesheet>