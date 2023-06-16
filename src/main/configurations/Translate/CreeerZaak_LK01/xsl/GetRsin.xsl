<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="GemeenteCode"/>

    <!-- <xsl:variable name="gemeenteCode"><xsl:value-of select="/Envelope/Body/zakLk01/stuurgegevens/zender/organisatie"/></xsl:variable> -->

    <xsl:template match="/">
        <xsl:for-each select="root/organizations/gemeenteCode">
            <xsl:if test="current() = $GemeenteCode">
                <rsin><xsl:value-of select="../RSIN"/></rsin>
            </xsl:if>
        </xsl:for-each>
	</xsl:template>
</xsl:stylesheet>