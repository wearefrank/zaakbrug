<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template match="@*|node()">
        <xsl:if test="normalize-space(.) != 'null'">
            <xsl:copy>
                <xsl:copy-of select = "@*"/>
                <xsl:apply-templates/>
            </xsl:copy>
        </xsl:if>
    </xsl:template>
    
	<xsl:template match="/">
		<xsl:apply-templates select="@*|node()"/>
	</xsl:template>
</xsl:stylesheet>