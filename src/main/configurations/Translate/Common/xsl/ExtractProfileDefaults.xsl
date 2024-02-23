<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:param name="hierarchy" />

    <xsl:template match="/">
        <root>
            <!-- New hierarchy in Profiles.json? 
                Copy the xsl:when node and replace every "zgw/zaken/zaken" with your new hierarchy. -->
            <!-- <xsl:choose>
                <xsl:when test="$hierarchy = 'zgw/zaken/zaken'">
                    <xsl:copy select="root/profile/profileDefaults/zgw/zaken/zaken/*">
                        <xsl:copy-of select="node()" />
                    </xsl:copy>
                </xsl:when>
            </xsl:choose> -->
        </root>
    </xsl:template>

</xsl:stylesheet>