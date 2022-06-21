<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="ZaakUrl"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy>
    </xsl:template>
    
	<xsl:template match="/zgwRol">
        <zgwRol>
            <zaak><xsl:value-of select="$ZaakUrl"/></zaak>
            <xsl:apply-templates select="@*|node()"/>
        </zgwRol>   
	</xsl:template>
</xsl:stylesheet>