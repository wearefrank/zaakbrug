<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:param name="RolMapping"/>

    <xsl:template match="/">
        <roles>
            <xsl:apply-templates select="*/heeftBetrekkingOp"/>
            <xsl:apply-templates select="*/heeftAlsBelanghebbende"/>
            <xsl:apply-templates select="*/heeftAlsInitiator"/>
            <xsl:apply-templates select="*/heeftAlsUitvoerende"/>
            <xsl:apply-templates select="*/heeftAlsVerantwoordelijke"/>
            <xsl:apply-templates select="*/heeftAlsGemachtigde"/>
            <xsl:apply-templates select="*/heeftAlsOverigBetrokkene"/>
        </roles>
    </xsl:template>

    <xsl:template match="heeftAlsBelanghebbende | heeftAlsInitiator | heeftAlsUitvoerende | heeftAlsVerantwoordelijke | heeftAlsGemachtigde | heeftAlsOverigBetrokkene | heeftBetrekkingOp">
        <role>
            <gerelateerde verwerkingssoort="{@verwerkingssoort}">
                <xsl:copy-of select="gerelateerde/*"/>
            </gerelateerde>
            <typeRolOmschrijving><xsl:value-of select="$RolMapping/root/rolMapping/*[local-name() = name(current())]"/></typeRolOmschrijving>
        </role>
    </xsl:template>

    <xsl:template match="heeftBetrekkingOp[gerelateerde/*[@*:entiteittype = 'AOA']]" />
</xsl:stylesheet>