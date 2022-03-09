<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:param name="zaak"/>
  <xsl:param name="resultaattype"/>
  <xsl:param name="toelichting"/>

  <xsl:template match="/">
    <resultaat>
        <zaak><xsl:value-of select="$zaak"/></zaak>
        <resultaattype><xsl:value-of select="$resultaattype"/></resultaattype>
        <toelichting><xsl:value-of select="$toelichting"/></toelichting>
    </resultaat>
	</xsl:template>
</xsl:stylesheet>