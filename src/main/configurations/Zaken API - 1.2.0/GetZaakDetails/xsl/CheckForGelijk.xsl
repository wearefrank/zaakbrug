<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>    

	<xsl:template match="/zakLv01">
        <xsl:choose>
            <xsl:when test="string-length(gelijk) > 0 and string-length(gelijk/identificatie) > 0">CallGetZdsZaak</xsl:when>
            <xsl:when test="string-length(gelijk) > 0 and string-length(gelijk/heeftAlsInitiator) > 0 and 
                string-length(gelijk/heeftAlsInitiator/gerelateerde) > 0 and 
                string-length(gelijk/heeftAlsInitiator/gerelateerde/identificatie) > 0">CheckForGerelateerdeIdentificatie</xsl:when>
            <xsl:otherwise>EXCEPTION</xsl:otherwise>
        </xsl:choose>
	</xsl:template>
</xsl:stylesheet>