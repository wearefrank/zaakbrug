<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:param name="ZaakTypeCode" select="''" as="xs:string" />

    <xsl:template match="/">
        <xsl:choose>
            <!-- First condition: Check if there is a profile with the specified ZaakTypeCode -->
            <xsl:when test="//profile[zaakTypeIdentificatie = $ZaakTypeCode]">
                <xsl:choose>
                    <!-- Nested choose to handle the existence of ignoreEindStatusInActualiseerZaakStatus in specified profile-->
                    <xsl:when test="exists(//profile[zaakTypeIdentificatie = $ZaakTypeCode]/ignoreEindStatusInActualiseerZaakStatus)">
                        <xsl:apply-templates select="//profile[zaakTypeIdentificatie = $ZaakTypeCode]/ignoreEindStatusInActualiseerZaakStatus" mode="copy"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'false'" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>

            <!-- Second condition: Check if ignoreEindStatusInActualiseerZaakStatus exists under profileDefaults -->
            <xsl:when test="exists(//profileDefaults/ignoreEindStatusInActualiseerZaakStatus)">
                <xsl:apply-templates select="//profileDefaults/ignoreEindStatusInActualiseerZaakStatus" mode="copy"/>
            </xsl:when>

            <!-- Default condition: Output false -->
            <xsl:otherwise>
                <xsl:value-of select="'false'" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="ignoreEindStatusInActualiseerZaakStatus" mode="copy">
        <xsl:value-of select="." />
    </xsl:template>
</xsl:stylesheet>
