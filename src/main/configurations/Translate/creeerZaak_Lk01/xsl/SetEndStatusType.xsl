<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="GetStatusTypesResult"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy>
    </xsl:template>
    
	<xsl:template match="/">
		<statusType>
            <xsl:for-each select="root/results">
                <xsl:if test="isEindstatus = 'true'">
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:if>
            </xsl:for-each> 
        </statusType>
	</xsl:template>
</xsl:stylesheet>