<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="Where" select="''" as="xs:string"/>
    <xsl:param name="Equals" select="''"/>
    <xsl:param name="StartsWith" select="''"/>
    
    <xsl:template match="/">
        <xsl:element name="{local-name(*)}">
            <xsl:apply-templates select="/*/*"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="*">
        
        <xsl:choose>
            <xsl:when test="$Where = '' and $StartsWith = ''">
                <xsl:copy-of select="."/>
            </xsl:when>    
            <xsl:otherwise>
                <xsl:variable name="element" select="descendant::*[name() = $Where]"/>
                <xsl:if test="$Equals">
                    <xsl:if test="$element = $Equals">
                        <xsl:copy-of select="."/>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="$StartsWith">
                    <xsl:if test="starts-with($element, $StartsWith)">
                        <xsl:copy-of select="."/>
                    </xsl:if>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>