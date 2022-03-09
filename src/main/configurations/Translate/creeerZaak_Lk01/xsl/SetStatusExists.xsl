<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="StatusBody"/>
    <xsl:param name="GetStatussenResult"/>
    
	<xsl:template match="/">
        <xsl:for-each select="$GetStatussenResult/root/results">
            <xsl:if test="statustype = $StatusBody/status/statustype">
                <statusExists>true</statusExists>
            </xsl:if>
        </xsl:for-each>
	</xsl:template>
</xsl:stylesheet>