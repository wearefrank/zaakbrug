<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>            
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/">
        <ZgwBesluitTypen>
            <xsl:for-each select="ZgwBesluitTypen/ZgwBesluitType">
                <xsl:if test="xs:date(beginGeldigheid) &lt;= current-date()">
                    <xsl:if test="eindeGeldigheid/@nil = 'true' or (xs:date(eindeGeldigheid) &gt; current-date())">
                        <ZgwBesluitType>
                            <xsl:apply-templates select="@*|node()"/>
                        </ZgwBesluitType>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </ZgwBesluitTypen>
    </xsl:template>
</xsl:stylesheet>