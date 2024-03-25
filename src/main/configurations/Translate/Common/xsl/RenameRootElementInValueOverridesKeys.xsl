<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*"/>

    <xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
  	</xsl:template>

	<xsl:template match="//valueOverrides/key[contains(self::key, 'zgw.zaken-api.zaken.zaak')]">
		<xsl:element name="key"><xsl:value-of select="replace(current(), 'zgw.zaken-api.zaken.zaak', 'zgw.zaken-api.zaken.ZgwZaak')" /></xsl:element>
  	</xsl:template>

</xsl:stylesheet>


