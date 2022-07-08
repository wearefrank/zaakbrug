<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/">
        <zakLk01>
            <xsl:apply-templates select="@*|node()"/>
        </zakLk01>
	</xsl:template>
</xsl:stylesheet>