<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="GetZaakTypeResult"/>
    <xsl:param name="Type"/>

    <xsl:template match="/">
        <result>
            <xsl:choose>
                <xsl:when test="$Type = 'endCaseEndDate'">
                    <xsl:for-each select="root/profile/endCaseEndDate">
                        <xsl:if test="../zaakTypeIdentificatie = $GetZaakTypeResult/ZgwZaakType/identificatie">
                            <coalesceResultaat><xsl:value-of select="coalesceResultaat"/></coalesceResultaat>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="$Type = 'endDateAndResultLastStatus'">
                    <xsl:for-each select="root/profile/endDateAndResultLastStatus">
                        <xsl:if test="../zaakTypeIdentificatie = $GetZaakTypeResult/ZgwZaakType/identificatie">
                            <coalesceResultaat><xsl:value-of select="coalesceResultaat"/></coalesceResultaat>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
        </result>
	</xsl:template>
</xsl:stylesheet>