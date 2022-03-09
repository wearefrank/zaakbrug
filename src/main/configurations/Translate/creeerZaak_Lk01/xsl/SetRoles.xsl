<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy>
    </xsl:template>
    
	<xsl:template match="/">
		<roles>
            <xsl:apply-templates select="Envelope/Body/zakLk01/object/heeftBetrekkingOp"/>
            <xsl:apply-templates select="Envelope/Body/zakLk01/object/heeftAlsBelanghebbende"/>
            <xsl:apply-templates select="Envelope/Body/zakLk01/object/heeftAlsInitiator"/>
            <xsl:apply-templates select="Envelope/Body/zakLk01/object/heeftAlsUitvoerende"/>
            <xsl:apply-templates select="Envelope/Body/zakLk01/object/heeftAlsVerantwoordelijke"/>
            <xsl:apply-templates select="Envelope/Body/zakLk01/object/heeftAlsGemachtigde"/>
            <xsl:apply-templates select="Envelope/Body/zakLk01/object/heeftAlsOverigBetrokkene"/>
        </roles>
	</xsl:template>

    <xsl:template match="Envelope/Body/zakLk01/object/heeftBetrekkingOp">
		<role>
            <xsl:apply-templates select="@*|node()"/>
            <typeRolOmschrijving>BetrekkingOp</typeRolOmschrijving>
        </role>
	</xsl:template>

    <xsl:template match="Envelope/Body/zakLk01/object/heeftAlsBelanghebbende">
		<role>
            <xsl:apply-templates select="@*|node()"/>
            <typeRolOmschrijving>Belanghebbende</typeRolOmschrijving>
        </role>
	</xsl:template>

    <xsl:template match="Envelope/Body/zakLk01/object/heeftAlsInitiator">
		<role>
            <xsl:apply-templates select="@*|node()"/>
            <typeRolOmschrijving>Initiator</typeRolOmschrijving>
        </role>
	</xsl:template>

    <xsl:template match="Envelope/Body/zakLk01/object/heeftAlsUitvoerende">
		<role>
            <xsl:apply-templates select="@*|node()"/>
            <typeRolOmschrijving>Uitvoerende</typeRolOmschrijving>
        </role>
	</xsl:template>

    <xsl:template match="Envelope/Body/zakLk01/object/heeftAlsVerantwoordelijke">
		<role>
            <xsl:apply-templates select="@*|node()"/>
            <typeRolOmschrijving>Verantwoordelijke</typeRolOmschrijving>
        </role>
	</xsl:template>

    <xsl:template match="Envelope/Body/zakLk01/object/heeftAlsGemachtigde">
		<role>
            <xsl:apply-templates select="@*|node()"/>
            <typeRolOmschrijving>Gemachtigde</typeRolOmschrijving>
        </role>
	</xsl:template>

    <xsl:template match="Envelope/Body/zakLk01/object/heeftAlsOverigBetrokkene">
		<role>
            <xsl:apply-templates select="@*|node()"/>
            <typeRolOmschrijving>OverigeBetrokkene</typeRolOmschrijving>
        </role>
	</xsl:template>
</xsl:stylesheet>