<xsl:stylesheet exclude-result-prefixes="xsl xs" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="Type" as="xs:string" select="''"/>
    <xsl:param name="List" as="xs:string" select="''"/>
    
    <xsl:template match="/">
        <xsl:element name="{$List}">
            <xsl:apply-templates select="//results"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="results">
        <xsl:element name="{$Type}">
            <xsl:copy-of select="*"/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>