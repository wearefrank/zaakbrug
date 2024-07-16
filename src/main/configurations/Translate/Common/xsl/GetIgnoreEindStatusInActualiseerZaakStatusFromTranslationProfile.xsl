<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:param name="ZaakTypeCode" select="''" as="xs:string" />

    <xsl:template match="/">
            <xsl:apply-templates select="//profile[zaakTypeIdentificatie = $ZaakTypeCode]/ignoreEindStatusInActualiseerZaakStatus" />
    </xsl:template>

    <xsl:template match="ignoreEindStatusInActualiseerZaakStatus">
            <xsl:value-of select="." />
    </xsl:template>
</xsl:stylesheet>
