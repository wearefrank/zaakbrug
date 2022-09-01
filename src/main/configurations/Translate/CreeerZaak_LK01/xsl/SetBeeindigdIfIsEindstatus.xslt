<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="IsEindstatus"/>
    
	<xsl:template match="/">
        <xsl:choose>
            <xsl:when test="$IsEindstatus/ZgwStatusType/isEindstatus = 'true'">
                <beeindigd>true</beeindigd>
            </xsl:when>
            <xsl:otherwise>
                <beeindigd>false</beeindigd>
            </xsl:otherwise>
        </xsl:choose>
	</xsl:template>
</xsl:stylesheet>