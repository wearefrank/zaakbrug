<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" >
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>

    <xsl:function name="zgw:toZgwDatetime" as="xs:dateTime">
        <xsl:param name="dateTimeStr" as="xs:string"/>
        <xsl:value-of select="concat(substring($dateTimeStr,1,4), '-', substring($dateTimeStr,5,2), '-', substring($dateTimeStr,7,2), 'T', substring($dateTimeStr,9,2), ':', substring($dateTimeStr,11,2), ':', substring($dateTimeStr,13,2), 'Z')"/>
    </xsl:function>

    <xsl:function name="zgw:toZgwDate">
        <xsl:param name="dateStr"/>
        <xsl:if test="string-length($dateStr) > 0">
            <xsl:value-of select="concat(substring($dateStr,1,4), '-', substring($dateStr,5,2), '-', substring($dateStr,7,2))"/>
        </xsl:if>
    </xsl:function>

    <xsl:function name="zgw:toZgwDocumentStatus">
        <xsl:param name="status"/>
        <xsl:if test="string-length($status) > 0">
            <xsl:variable name="transformed" as="xs:string" select="lower-case(replace($status, ' ', '_'))"/>    
            <xsl:choose>
                <xsl:when test="$transformed = 'in_bewerking' or $transformed = 'ter_vaststelling' or $transformed = 'definitief' or $transformed = 'gearchiveerd'">
                    <xsl:value-of select="$transformed"/>
                </xsl:when>
                <xsl:otherwise />
            </xsl:choose>
        </xsl:if>
    </xsl:function>
    
    <xsl:function name="zgw:convertZgwBooleanToZdsBoolean">
        <xsl:param name="zgwBoolean"/>
        <xsl:if test="string-length($zgwBoolean) > 0">
            <xsl:choose>
                <xsl:when test="lower-case($zgwBoolean)='true'">J</xsl:when>
                <xsl:when test="lower-case($zgwBoolean)='false'">N</xsl:when>
                <xsl:otherwise>invalid character</xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>
    
    <xsl:function name="zgw:FromOrderedSource">
        <xsl:param name="param"/>
        <xsl:param name="zgwObject"/>
        <xsl:param name="zdsObject"/>
        <xsl:param name="self"/>
        <xsl:choose>
            <xsl:when test="$param">
                <xsl:value-of select="$param"/>
            </xsl:when>
            <xsl:when test="$zgwObject">
                <xsl:value-of select="$zgwObject"/>
            </xsl:when>
            <xsl:when test="$zdsObject">
                <xsl:value-of select="$zdsObject"/>
            </xsl:when>
            <xsl:when test="$self">
                <xsl:value-of select="$self"/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="zgw:WrapNullOrSkip" as="node()*">
        <xsl:param name="elementName" as="xs:string"/>
        <xsl:param name="mode" as="xs:string" />
        <xsl:param name="value" />
        <xsl:choose>
            <xsl:when test="string-length($value) > 0">
                <xsl:element name="{$elementName}"><xsl:copy-of select="$value" /></xsl:element>
            </xsl:when>
            <xsl:when test="$mode = 'null'">
                <xsl:element name="{$elementName}"><xsl:attribute name="xsi:nil" select="true()"/></xsl:element>
            </xsl:when>
            <xsl:when test="$mode = 'empty'">
                <xsl:element name="{$elementName}" />
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:function>

</xsl:stylesheet>