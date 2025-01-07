<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://www.wearefrank.nl/zgw" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <xsl:param name="StatusBody" />
    <xsl:param name="Beeindigd" />

    <xsl:template match="/">
        <result>
            <xsl:for-each select="ZgwStatussen/ZgwStatus">
                <xsl:if test="statustype = $StatusBody/ZgwStatus/statustype">
                    <xsl:choose>
                        <xsl:when test="$Beeindigd">
                            <exception>ConverterException</exception>
                        </xsl:when>
                        <xsl:otherwise>
                            <statusExists>true</statusExists>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:for-each>
        </result>
    </xsl:template>

</xsl:stylesheet>