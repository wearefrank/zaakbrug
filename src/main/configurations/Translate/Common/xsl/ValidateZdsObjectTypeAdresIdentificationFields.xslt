<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" indent="no" omit-xml-declaration="yes"/>

    <xsl:template match="/">

        <xsl:variable name="adres" select="/*:heeftBetrekkingOp/*:gerelateerde/*:adres"/>

        <IsObjectTypeAdresValidated>
            <xsl:value-of select="
                normalize-space($adres/*:identificatie) and
                normalize-space($adres/*:wpl.woonplaatsNaam) and
                normalize-space($adres/*:gor.openbareRuimteNaam) and
                normalize-space($adres/*:huisnummer)"/>
        </IsObjectTypeAdresValidated>
    </xsl:template>
</xsl:stylesheet>