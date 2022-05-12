<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/">
        <xsl:for-each select="ZgwStatusTypes/ZgwStatusType">
            <xsl:if test="isEindstatus = 'true'">
                <ZgwStatusType>
                    <xsl:apply-templates select="@*|node()" />
                </ZgwStatusType>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>