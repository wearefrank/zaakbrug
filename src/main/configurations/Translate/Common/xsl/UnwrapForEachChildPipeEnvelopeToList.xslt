<xsl:stylesheet exclude-result-prefixes="xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="List"/>

    <xsl:template match="/">
        <xsl:element name="{$List}">
            <xsl:apply-templates select="/results"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="result">
            <xsl:copy-of select="*"/>
    </xsl:template>

</xsl:stylesheet>