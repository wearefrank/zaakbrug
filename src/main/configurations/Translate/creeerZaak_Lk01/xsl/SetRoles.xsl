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
            <roltypeOmschrijving>BetrekkingOp</roltypeOmschrijving>
        </role>
	</xsl:template>

    <xsl:template match="Envelope/Body/zakLk01/object/heeftAlsBelanghebbende">
		<role>
            <xsl:apply-templates select="@*|node()"/>
            <roltypeOmschrijving>Belanghebbende</roltypeOmschrijving>
        </role>
	</xsl:template>

    <xsl:template match="Envelope/Body/zakLk01/object/heeftAlsInitiator">
		<role>
            <xsl:apply-templates select="@*|node()"/>
            <roltypeOmschrijving>Initiator</roltypeOmschrijving>
        </role>
	</xsl:template>

    <xsl:template match="Envelope/Body/zakLk01/object/heeftAlsUitvoerende">
		<role>
            <xsl:apply-templates select="@*|node()"/>
            <roltypeOmschrijving>Uitvoerende</roltypeOmschrijving>
        </role>
	</xsl:template>

    <xsl:template match="Envelope/Body/zakLk01/object/heeftAlsVerantwoordelijke">
		<role>
            <xsl:apply-templates select="@*|node()"/>
            <roltypeOmschrijving>Verantwoordelijke</roltypeOmschrijving>
        </role>
	</xsl:template>

    <xsl:template match="Envelope/Body/zakLk01/object/heeftAlsGemachtigde">
		<role>
            <xsl:apply-templates select="@*|node()"/>
            <roltypeOmschrijving>Gemachtigde</roltypeOmschrijving>
        </role>
	</xsl:template>

    <xsl:template match="Envelope/Body/zakLk01/object/heeftAlsOverigBetrokkene">
		<role>
            <xsl:apply-templates select="@*|node()"/>
            <roltypeOmschrijving>OverigeBetrokkene</roltypeOmschrijving>
        </role>
	</xsl:template>
</xsl:stylesheet>