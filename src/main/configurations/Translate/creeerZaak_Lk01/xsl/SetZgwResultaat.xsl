<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="PostZgwZaakResult"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy>
    </xsl:template>
    
	<xsl:template match="/">
		<zgwResultaat>
            <zaak><xsl:value-of select="$PostZgwZaakResult/root/url"/></zaak>
            <resultaattype><xsl:value-of select="$GetResultaatTypeByZaakTypeAndOmschrijvingResult/results/url"/></resultaattype>
            <toelichting><xsl:value-of select="Envelope/Body/zakLk01/object/resultaat/omschrijving"/></toelichting>
        </zgwResultaat>
	</xsl:template>
</xsl:stylesheet>