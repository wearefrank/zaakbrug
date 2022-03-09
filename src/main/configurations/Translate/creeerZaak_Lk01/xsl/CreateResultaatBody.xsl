<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="ZaakUrl"/>
    <xsl:param name="ResultaatType"/>
    <xsl:param name="Toelichting"/>

    <xsl:template match="/">
        <zgwResultaat>
            <zaak><xsl:value-of select="$ZaakUrl"/></zaak>
            <resultaattype><xsl:value-of select="$ResultaatType"/></resultaattype>
            <toelichting><xsl:value-of select="$Toelichting"/></toelichting>
        </zgwResultaat>
    </xsl:template>
</xsl:stylesheet>