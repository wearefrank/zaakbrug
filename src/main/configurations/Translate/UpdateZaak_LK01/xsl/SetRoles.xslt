<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:param name="RolMapping"/>

    <xsl:template match="/">
		<roles>
            <role>
                <xsl:copy-of select="*/heeftBetrekkingOp/gerelateerde"/>
                <typeRolOmschrijving><xsl:value-of select="$RolMapping/root/rolMapping/heeftBetrekkingOp"/></typeRolOmschrijving>
            </role>
            <role>
                <xsl:copy-of select="*/heeftAlsBelanghebbende/gerelateerde"/>
                <typeRolOmschrijving><xsl:value-of select="$RolMapping/root/rolMapping/heeftAlsBelanghebbende"/></typeRolOmschrijving>
            </role>
            <role>
                <xsl:copy-of select="*/heeftAlsInitiator/gerelateerde"/>
                <typeRolOmschrijving><xsl:value-of select="$RolMapping/root/rolMapping/heeftAlsInitiator"/></typeRolOmschrijving>
            </role>
            <role>
                <xsl:copy-of select="*/heeftAlsUitvoerende/gerelateerde"/>
                <typeRolOmschrijving><xsl:value-of select="$RolMapping/root/rolMapping/heeftAlsUitvoerende"/></typeRolOmschrijving>
            </role>
            <role>
                <xsl:copy-of select="*/heeftAlsVerantwoordelijke/gerelateerde"/>
                <typeRolOmschrijving><xsl:value-of select="$RolMapping/root/rolMapping/heeftAlsVerantwoordelijke"/></typeRolOmschrijving>
            </role>
            <role>
                <xsl:copy-of select="*/heeftAlsGemachtigde/gerelateerde"/>
                <typeRolOmschrijving><xsl:value-of select="$RolMapping/root/rolMapping/heeftAlsGemachtigde"/></typeRolOmschrijving>
            </role>
            <role>
                <xsl:copy-of select="*/heeftAlsOverigBetrokkene/gerelateerde"/>
                <typeRolOmschrijving><xsl:value-of select="$RolMapping/root/rolMapping/heeftAlsOverigBetrokkene"/></typeRolOmschrijving>
            </role>
        </roles>
	</xsl:template>
</xsl:stylesheet>