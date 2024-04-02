<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*" />

    <xsl:template match="text()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*">
        <xsl:copy>
            <xsl:attribute name="path">
                <xsl:call-template name="genPath" />
            </xsl:attribute>
      <xsl:apply-templates
                select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template name="genPath">
        <xsl:param name="prevPath" />
        <xsl:variable name="currPath"
            select="concat('/',name(),'[',
                count(preceding-sibling::*[name() = name(current())])+1,']',$prevPath)" />
        <xsl:for-each
            select="parent::*">
            <xsl:call-template name="genPath">
                <xsl:with-param name="prevPath" select="$currPath" />
            </xsl:call-template>
        </xsl:for-each>
        <xsl:if
            test="not(parent::*)">
            <xsl:value-of select="$currPath" />
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>