<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" >
    <xsl:output method="xml" version="1.0" indent="yes" omit-xml-declaration="yes"/>

    <xsl:param name="ZaakobjectIdentificatie" as="node()"><ZaakobjectIdentificatie/></xsl:param>

    <xsl:template match="/">
        <ZgwZaakobject>
            <objectType>
                <xsl:value-of select="name(/*:heeftBetrekkingOp/*:gerelateerde/*[1])"/> <!-- This is always 'adres' for now until the others are implemented -->
            </objectType>
            <xsl:copy-of select="$ZaakobjectIdentificatie"/>
        </ZgwZaakobject>
    </xsl:template>
</xsl:stylesheet>