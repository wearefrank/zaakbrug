<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />

    <!-- Created to be able to filter any type of element by time but still not working -->

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*">
        <xsl:copy>
            <xsl:apply-templates select="@*" />
            <xsl:for-each select="*">
                <xsl:if test="xs:date(beginGeldigheid) &lt;= current-date()">
                    <xsl:if test="eindeGeldigheid/@nil = 'true' or (xs:date(eindeGeldigheid) &gt; current-date())">
                        <xsl:element name="{name()}">
                            <xsl:apply-templates select="@*|node()" />
                        </xsl:element>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>