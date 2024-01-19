<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="code" select="'TechnicalError'" as="xs:string" />
    <xsl:param name="reason" select="'Undefined error'" as="xs:string" />
    <xsl:param name="cause" as="node()?" />
    <xsl:param name="details" select="''" as="xs:string" />
    <xsl:param name="detailsXml" as="node()?" />
    
    <xsl:template match="/">
        <error>
            <code><xsl:value-of select="$code" /></code>
            <reason><xsl:value-of select="$reason" /></reason>
            <cause><xsl:copy-of select="$cause" /></cause>
            <details><xsl:value-of select="$details" /></details>
            <detailsXml><xsl:copy-of select="$detailsXml"/></detailsXml>
        </error>
    </xsl:template>
</xsl:stylesheet>
