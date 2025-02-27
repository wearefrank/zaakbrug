<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="Omschrijving"/>
    <xsl:param name="Toelichting"/>

    <xsl:template match="/">
        <resultaat>
            <omschrijving><xsl:value-of select="$Omschrijving" /></omschrijving>
            <xsl:if test="$Toelichting != ''">
                <toelichting><xsl:value-of select="$Toelichting"/></toelichting>
            </xsl:if>
        </resultaat>
    </xsl:template>
</xsl:stylesheet>