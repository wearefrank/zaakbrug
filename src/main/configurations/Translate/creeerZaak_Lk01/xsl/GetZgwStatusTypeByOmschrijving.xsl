<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="Omschrijving"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/">
        <xsl:for-each select="root/results">
            <xsl:if test="omschrijving = $Omschrijving">
                <statusType>
                    <xsl:apply-templates select="@*|node()"/>
                </statusType>
            </xsl:if>
        </xsl:for-each>
	</xsl:template>
</xsl:stylesheet>