<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <xsl:template match="@*|node()">
        <xsl:choose>
            <xsl:when test=".">
                <xsl:choose>
                    <xsl:when test="normalize-space(.) = 'null'">
                        <xsl:element name="{local-name()}">
                            <xsl:attribute name="xsi:nil" select="true()"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy>
                            <xsl:copy-of select = "@*"/>
                            <xsl:apply-templates/>
                        </xsl:copy>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:copy-of select = "@*"/>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
	<xsl:template match="/">
		<xsl:apply-templates select="@*|node()"/>
	</xsl:template>
</xsl:stylesheet>