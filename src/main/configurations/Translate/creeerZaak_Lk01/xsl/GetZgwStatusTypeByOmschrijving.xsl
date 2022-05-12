<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:param name="Omschrijving" />

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/">
        <ZgwStatusTypes>
            <xsl:for-each select="ZgwStatusTypes/ZgwStatusType">
                <xsl:if test="omschrijving = $Omschrijving">
                    <ZgwStatusType>
                        <xsl:apply-templates select="@*|node()" />
                    </ZgwStatusType>
                </xsl:if>
            </xsl:for-each>
        </ZgwStatusTypes>
    </xsl:template>
</xsl:stylesheet>