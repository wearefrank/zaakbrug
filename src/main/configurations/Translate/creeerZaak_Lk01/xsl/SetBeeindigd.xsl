<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="SetEndStatusTypeResult"/>
    
	<xsl:template match="/">
        <xsl:for-each select="root/results">
            <xsl:if test="statustype = $SetEndStatusTypeResult/ZgwStatusType/url">
                <beeindigd>true</beeindigd>
            </xsl:if>
        </xsl:for-each>
        <xsl:if test="root/results = 'null'">
            <beeindigd>false</beeindigd>
        </xsl:if>
	</xsl:template>
</xsl:stylesheet>