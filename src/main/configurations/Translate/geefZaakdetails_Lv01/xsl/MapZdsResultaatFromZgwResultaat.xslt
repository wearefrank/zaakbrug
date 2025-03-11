<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="Omschrijving"/>
    <xsl:param name="Toelichting"/>

    <xsl:template match="/">
        <ZKN:resultaat>
            <ZKN:omschrijving><xsl:value-of select="$Omschrijving" /></ZKN:omschrijving>
            <xsl:if test="$Toelichting != ''">
                <ZKN:toelichting><xsl:value-of select="$Toelichting"/></ZKN:toelichting>
            </xsl:if>
        </ZKN:resultaat>
    </xsl:template>
</xsl:stylesheet>