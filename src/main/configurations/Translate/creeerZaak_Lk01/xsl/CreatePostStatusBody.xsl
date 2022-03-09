<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:zgw="http://google.com/zgw" version="2.0">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:param name="PostZgwZaakResult"/>
  <xsl:param name="ZdsStatusDatum"/>

  <xsl:template match="/">
    <status>
      <zaak><xsl:value-of select="$PostZgwZaakResult/root/url"/></zaak>
      <statustype><xsl:value-of select="statusType/url"/></statustype>
      <statustoelichting><xsl:value-of select="statusType/omschrijving"/></statustoelichting>
      <datumStatusGezet><xsl:value-of select="zgw:convertZdsDatetimeToZgwDatetime($ZdsStatusDatum)"/></datumStatusGezet>
    </status>
  </xsl:template>

  <xsl:function name="zgw:convertZdsDatetimeToZgwDatetime" as="xs:dateTime">
    	<xsl:param name="dateTimeStr" as="xs:string"/>
		<xsl:value-of select="concat(substring($dateTimeStr,1,4), '-', substring($dateTimeStr,5,2), '-', substring($dateTimeStr,7,2), 'T', substring($dateTimeStr,9,2), ':', substring($dateTimeStr,11,2), ':', substring($dateTimeStr,13,2), 'Z')"/>
	</xsl:function>
</xsl:stylesheet>