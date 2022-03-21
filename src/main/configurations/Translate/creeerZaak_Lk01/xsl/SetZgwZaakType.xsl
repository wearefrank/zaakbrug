<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy>
    </xsl:template>
    
	<xsl:template match="/">
        <zgwZaakType>
            <xsl:for-each select="root/results">
                <xsl:if test="xs:date(beginGeldigheid) &lt; current-date()">
                    <xsl:if test="eindeGeldigheid = 'null' or (xs:date(eindeGeldigheid) &gt; current-date())">
                        <ZaakType>
                            <xsl:apply-templates select="@*|node()"/>
                        </ZaakType>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </zgwZaakType>   
	</xsl:template>
</xsl:stylesheet>