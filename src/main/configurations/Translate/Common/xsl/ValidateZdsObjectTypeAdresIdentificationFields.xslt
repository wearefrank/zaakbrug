<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template match="/">

        <xsl:variable name="adres" select="/*:heeftBetrekkingOp/*:gerelateerde/*:adres"/>

        <IsObjectTypeAdresValidated>
            <xsl:choose>
                <xsl:when test="
                    string-length(normalize-space($adres/*:identificatie)) gt 0 and
                    string-length(normalize-space($adres/*:wpl.woonplaatsNaam)) gt 0 and
                    string-length(normalize-space($adres/*:gor.openbareRuimteNaam)) gt 0 and
                    string-length(normalize-space($adres/*:huisnummer)) gt 0">
                    true
                </xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
            </xsl:choose>
        </IsObjectTypeAdresValidated>
    </xsl:template>
</xsl:stylesheet>