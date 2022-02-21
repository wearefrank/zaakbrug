<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

    <xsl:variable name="gemeenteCode"><xsl:value-of select="/Envelope/Body/zakLk01/stuurgegevens/zender/organisatie"/></xsl:variable>

    <xsl:template match="/">
		<xsl:choose>
            <xsl:when test="$gemeenteCode = '1900'">
                <rsin>823288444</rsin>
            </xsl:when>
            <xsl:when test="$gemeenteCode = '0392'">
                <rsin>001005650</rsin>
            </xsl:when>
            <xsl:when test="$gemeenteCode = '0478'">
                <rsin>001509962</rsin>
            </xsl:when>
        </xsl:choose>
	</xsl:template>
</xsl:stylesheet>