<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="Einddatum"/>
    
	<xsl:template match="/">
        <zdsStatusDatum><xsl:value-of select="$Einddatum"/></zdsStatusDatum>
        <beeindigd>true</beeindigd>
	</xsl:template>
</xsl:stylesheet>