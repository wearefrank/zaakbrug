<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/">
        <ZgwZaakTypen>
            <xsl:for-each select="ZgwZaakTypen/ZgwZaakType">
                <xsl:if test="xs:date(beginGeldigheid) &lt;= current-date()">
                    <xsl:if test="eindeGeldigheid/@nil = 'true' or (xs:date(eindeGeldigheid) &gt; current-date())">
                        <ZgwZaakType>
                            <xsl:apply-templates select="@*|node()"/>
                        </ZgwZaakType>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </ZgwZaakTypen>
    </xsl:template>
</xsl:stylesheet>