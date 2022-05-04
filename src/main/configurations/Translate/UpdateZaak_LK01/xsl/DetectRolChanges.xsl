<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>    
    <xsl:param name="RolBody_1"/>

	<xsl:template match="/">
        <xsl:for-each select="$RolBody_1/roles/role">
            <xsl:if test="typeRolOmschrijving = /role/typeRolOmschrijving">
                <xsl:choose>
                    <xsl:when test="string-length(gerelateerde) = 0 and string-length(/role/gerelateerde) > 0">
                        New
                    </xsl:when>
                    <xsl:when test="string-length(gerelateerde) > 0 and string-length(/role/gerelateerde) = 0">
                        Delete
                    </xsl:when>
                    <xsl:when test="gerelateerde != /role/gerelateerde">
                        Changed
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
        </xsl:for-each>
	</xsl:template>
</xsl:stylesheet>