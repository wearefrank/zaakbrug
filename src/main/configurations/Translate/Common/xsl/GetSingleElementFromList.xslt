<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="Nth" select="1" as="xs:integer"/>
    <xsl:param name="Where" select="''" as="xs:string"/>
    <xsl:param name="Equals" select="''"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="/*/*"/>
    </xsl:template>
    
    <xsl:template match="*">
        <xsl:choose>
            <xsl:when test="$Where = ''">
                <xsl:if test="position() = $Nth">
                    <xsl:copy-of select="."/>
                </xsl:if>
            </xsl:when>    
            <xsl:otherwise>
                <xsl:if test="descendant::*[name() = $Where] = $Equals">
                    <xsl:if test="position() = $Nth">
                        <xsl:copy-of select="."/>
                    </xsl:if>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>