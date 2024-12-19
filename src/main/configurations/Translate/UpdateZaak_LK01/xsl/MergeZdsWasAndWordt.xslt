<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
    <xsl:mode on-no-match="shallow-skip" />

    <xsl:template match="/">
        <xsl:choose>
            <xsl:when test="count(*:zakLk01/*:object) = 1">
                <xsl:copy-of select="*:zakLk01/*:object" />
            </xsl:when>
            <xsl:when test="count(*:zakLk01/*:object) = 2">
                <xsl:apply-templates select="*:zakLk01/*:object[2]" />
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:template>

    <xsl:template match="*:zakLk01/*:object[2]">
        <xsl:copy>
            <xsl:copy-of select="@*" />
            <xsl:apply-templates select="*" />
            <xsl:apply-templates select="root()/*:zakLk01/*:object[1]/*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*:object[2]/*[not(@*:verwerkingssoort)]">
        <xsl:copy-of select="." />
    </xsl:template>

    <xsl:template match="*:object[2]/*[@*:verwerkingssoort != 'V']">
        <xsl:copy-of select="." />
    </xsl:template>

    <xsl:template match="*:object[1]/*[@*:verwerkingssoort = 'V']">
        <xsl:copy-of select="." />
    </xsl:template>
</xsl:stylesheet>
