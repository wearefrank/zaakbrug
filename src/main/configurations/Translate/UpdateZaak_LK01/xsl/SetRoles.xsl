<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy>
    </xsl:template>
    
	<xsl:template match="/">
		<roles>
            <role>
                <xsl:if test="exists(heeftBetrekkingOp)">
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:if> 
                <typeRolOmschrijving>BetrekkingOp</typeRolOmschrijving>
            </role>
            <role>
                <xsl:if test="exists(heeftAlsBelanghebbende)">
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:if> 
                <typeRolOmschrijving>Belanghebbende</typeRolOmschrijving>
            </role>
            <role>
                <xsl:if test="exists(heeftAlsInitiator)">
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:if> 
                <typeRolOmschrijving>Initiator</typeRolOmschrijving>
            </role>
            <role>
                <xsl:if test="exists(heeftAlsUitvoerende)">
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:if> 
                <typeRolOmschrijving>Uitvoerende</typeRolOmschrijving>
            </role>
            <role>
                <xsl:if test="exists(heeftAlsVerantwoordelijke)">
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:if> 
                <typeRolOmschrijving>Verantwoordelijke</typeRolOmschrijving>
            </role>
            <role>
                <xsl:if test="exists(heeftAlsGemachtigde)">
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:if> 
                <typeRolOmschrijving>Gemachtigde</typeRolOmschrijving>
            </role>
            <role>
                <xsl:if test="exists(heeftAlsOverigBetrokkene)">
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:if> 
                <typeRolOmschrijving>OverigeBetrokkene</typeRolOmschrijving>
            </role>
        </roles>
	</xsl:template>
</xsl:stylesheet>