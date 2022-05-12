<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="EndStatusType"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy>
    </xsl:template>
    
	<xsl:template match="/">
		<endStatus>
            <xsl:for-each select="results/result/newStatuses/zgwStatus">
                <xsl:if test="statustype = $EndStatusType/ZgwStatusType/url">
                    <xsl:apply-templates select="@*|node()"/>
                </xsl:if>
            </xsl:for-each> 
        </endStatus>
	</xsl:template>
</xsl:stylesheet>