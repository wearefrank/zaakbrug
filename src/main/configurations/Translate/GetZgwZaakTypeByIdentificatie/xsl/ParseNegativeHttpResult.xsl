<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <error>
            <xsl:choose>
                <xsl:when test="root/status=400">
                    <code>TranslationError</code>
                    <reason>GetZgwZaakTypeByIdentificatie received 400 Bad Request from OpenZaak</reason>
                </xsl:when>
                <xsl:when test="root/status=401">
                    <code>TechnicalError</code>
                    <reason>GetZgwZaakTypeByIdentificatie received 401 Unauthorized from OpenZaak</reason>
                </xsl:when>
                <xsl:when test="root/status=403">
                    <code>TechnicalError</code>
                    <reason>GetZgwZaakTypeByIdentificatie received 403 Forbidden from OpenZaak</reason>
                </xsl:when>
                <xsl:when test="root/status=404">
                    <code>TechnicalError</code>
                    <reason>GetZgwZaakTypeByIdentificatie received 404 Not Found from OpenZaak</reason>
                </xsl:when>
                <xsl:when test="root/status=500">
                    <code>TechnicalError</code>
                    <reason>GetZgwZaakTypeByIdentificatie received 500 Internal Server Error from OpenZaak</reason>
                </xsl:when>
                <xsl:otherwise>
                    <code>TechnicalError</code>
                    <reason>GetZgwZaakTypeByIdentificatie received some negative response from OpenZaak</reason>
                </xsl:otherwise>
            </xsl:choose>
            <details>
                <xsl:value-of select="concat(/root/code, ' ', /root/title, ' ', /root/status, ' ', /root/detail)" />
            </details>
            <detailsXml>
                <xsl:copy-of select="."/>
            </detailsXml>
        </error>
    </xsl:template>
</xsl:stylesheet>
