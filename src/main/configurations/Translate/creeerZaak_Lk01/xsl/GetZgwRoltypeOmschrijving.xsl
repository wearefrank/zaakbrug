<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="Omschrijving"/>

    <xsl:template match="/">
		<xsl:if test="roltypes/roltype/omschrijving = $Omschrijving">
            <roltype>
                <url><xsl:value-of select="../url"/></url>
                <zaaktype><xsl:value-of select="../zaaktype"/></zaaktype>
                <omschrijving><xsl:value-of select="../omschrijving"/></omschrijving>
                <omschrijvingGeneriek><xsl:value-of select="../omschrijvingGeneriek"/></omschrijvingGeneriek>
            </roltype>
        </xsl:if>
	</xsl:template>
</xsl:stylesheet>