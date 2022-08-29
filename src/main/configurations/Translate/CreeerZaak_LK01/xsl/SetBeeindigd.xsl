<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="EndStatusType"/>
    
	<xsl:template match="/">
        <xsl:for-each select="ZgwStatussen/ZgwStatus">
            <xsl:if test="statustype = $EndStatusType/ZgwStatusType/url">
                <beeindigd>true</beeindigd>
            </xsl:if>
        </xsl:for-each>
	</xsl:template>
</xsl:stylesheet>