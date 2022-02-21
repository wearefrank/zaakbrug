<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy>
    </xsl:template>
    
	<xsl:template match="/root">
		<global>
            <organizations>
                <xsl:apply-templates select="organizations"/>
            </organizations>
            <xsl:apply-templates select="rolMapping"/>
        </global>
	</xsl:template>
    
    <xsl:template match="organizations">
        <organization>
            <xsl:apply-templates select="@*|node()"/>            
        </organization>
    </xsl:template>

    <xsl:template match="rolMapping">
        <rolMapping>
            <xsl:apply-templates select="@*|node()"/>
        </rolMapping>
    </xsl:template>
</xsl:stylesheet>