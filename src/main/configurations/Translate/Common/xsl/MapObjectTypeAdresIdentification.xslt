<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" indent="yes" omit-xml-declaration="yes"/>

    <xsl:param name="ObjectTypeAdres" as="node()"><ObjectTypeAdres/></xsl:param>

    <xsl:template match="/">
        <objectIdentificatie>
            <identificatie>
                <xsl:value-of select="$ObjectTypeAdres//*:identificatie"/>
            </identificatie>
            <wplWoonplaatsNaam>
                <xsl:value-of select="$ObjectTypeAdres//*:wpl.woonplaatsNaam"/>
            </wplWoonplaatsNaam>
            <gorOpenbareRuimteNaam>
                <xsl:value-of select="$ObjectTypeAdres//*:gor.openbareRuimteNaam"/>
            </gorOpenbareRuimteNaam>
            <huisnummer>
                <xsl:value-of select="$ObjectTypeAdres//*:huisnummer"/>
            </huisnummer>
            <huisletter>
                <xsl:value-of select="$ObjectTypeAdres//*:huisletter"/>
            </huisletter>
            <huisnummertoevoeging>
                <xsl:value-of select="$ObjectTypeAdres//*:huisnummertoevoeging"/>
            </huisnummertoevoeging>
            <postcode>
                <xsl:value-of select="$ObjectTypeAdres//*:postcode"/>
            </postcode>
        </objectIdentificatie>
    </xsl:template>
</xsl:stylesheet>