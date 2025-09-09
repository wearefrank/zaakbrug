<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" indent="yes" omit-xml-declaration="yes"/>

    <xsl:param name="ObjectTypeAdres" as="node()"><ObjectTypeAdres/></xsl:param>

    <xsl:template match="/">

        <xsl:variable name="adres" select="/*:heeftBetrekkingOp/*:gerelateerde/*:adres"/>

        <objectIdentificatie>
            <identificatie>
                <xsl:value-of select="$adres/*:identificatie"/>
            </identificatie>
            <wplWoonplaatsNaam>
                <xsl:value-of select="$adres/*:wpl.woonplaatsNaam"/>
            </wplWoonplaatsNaam>
            <gorOpenbareRuimteNaam>
                <xsl:value-of select="$adres/*:gor.openbareRuimteNaam"/>
            </gorOpenbareRuimteNaam>
            <huisnummer>
                <xsl:value-of select="$adres/*:huisnummer"/>
            </huisnummer>
            <huisletter>
                <xsl:value-of select="$adres/*:huisletter"/>
            </huisletter>
            <huisnummertoevoeging>
                <xsl:value-of select="$adres/*:huisnummertoevoeging"/>
            </huisnummertoevoeging>
            <postcode>
                <xsl:value-of select="$adres/*:postcode"/>
            </postcode>
        </objectIdentificatie>
    </xsl:template>
</xsl:stylesheet>