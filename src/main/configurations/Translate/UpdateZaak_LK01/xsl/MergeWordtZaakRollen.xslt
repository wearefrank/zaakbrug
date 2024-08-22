<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

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

    <xsl:template match="*:zakLk01/*:object">
        <xsl:element name="{name()}" inherit-namespaces="yes">
            <xsl:attribute name="entiteittype"><xsl:value-of select="@entiteittype" /></xsl:attribute>
            <xsl:attribute name="verwerkingssoort"><xsl:value-of select="@verwerkingssoort" /></xsl:attribute>
            <xsl:apply-templates />
            <xsl:apply-templates select="root()/*:zakLk01/*:object[1]/*:heeftAlsBelanghebbende |
                root()/*:zakLk01/*:object[1]/*:heeftAlsInitiator |
                root()/*:zakLk01/*:object[1]/*:heeftAlsUitvoerende |
                root()/*:zakLk01/*:object[1]/*:heeftAlsVerantwoordelijke |
                root()/*:zakLk01/*:object[1]/*:heeftAlsGemachtigde |
                root()/*:zakLk01/*:object[1]/*:heeftAlsOverigBetrokkene |
                root()/*:zakLk01/*:object[1]/*:heeftAlsBetrokkene" 
                />
        </xsl:element>
    </xsl:template>

    <xsl:template match="*:heeftAlsBelanghebbende |
        *:heeftAlsInitiator |
        *:heeftAlsUitvoerende |
        *:heeftAlsVerantwoordelijke |
        *:heeftAlsGemachtigde |
        *:heeftAlsOverigBetrokkene |
        *:heeftAlsBetrokkene"
        >
        <xsl:if test="@*:verwerkingssoort != 'V'">
            <xsl:copy-of select="." />   
        </xsl:if>
    </xsl:template>

    <xsl:template match="*:zakLk01/*:object[1]/*:heeftAlsBelanghebbende |
        *:zakLk01/*:object[1]/*:heeftAlsInitiator |
        *:zakLk01/*:object[1]/*:heeftAlsUitvoerende |
        *:zakLk01/*:object[1]/*:heeftAlsVerantwoordelijke |
        *:zakLk01/*:object[1]/*:heeftAlsGemachtigde |
        *:zakLk01/*:object[1]/*:heeftAlsOverigBetrokkene |
        *:zakLk01/*:object[1]/*:heeftAlsBetrokkene"
        >
        <xsl:if test="@*:verwerkingssoort = 'V'">
            <xsl:copy-of select="." />   
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
