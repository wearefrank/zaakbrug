<xsl:stylesheet exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <xsl:param name="MatchWithZgwZaakObject" as="node()"><xsl:document /></xsl:param>

    <xsl:param name="debug" as="xs:string" select="'false'" />
    <xsl:variable name="debugSerializeParams" as="map(xs:string, item()?)">
        <xsl:map>
            <xsl:map-entry key="'indent'" select="true()"/>
        </xsl:map>
    </xsl:variable>

    <xsl:variable name="rootName" select="local-name($MatchWithZgwZaakObject/*)" />

    <xsl:template match="/">
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> MatchWithZgwZaakObject: [{serialize($MatchWithZgwZaakObject, $debugSerializeParams)}] </xsl:comment></xsl:if>
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> rootName: [{serialize($rootName, $debugSerializeParams)}] </xsl:comment></xsl:if>

        <ZgwZaakObjecten>
            <xsl:variable name="matchingZaakObject">
                <xsl:apply-templates select="//*[local-name() = $rootName]"/>
            </xsl:variable>
            <xsl:copy-of select="$matchingZaakObject" copy-namespaces="false" />
        </ZgwZaakObjecten>
    </xsl:template>

    <xsl:template match="*:zgwZaakObject">
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> zaakObjectTemplateInput: [{serialize(., $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:variable name="matchIdentificatie" select="$MatchWithZgwZaakObject/*/*:objectIdentificatie/*:identificatie/text()" />
        <xsl:variable name="currentIdentificatie" select="*:objectIdentificatie/*:identificatie/text()" />

        <xsl:choose>
            <xsl:when test="$currentIdentificatie = $matchIdentificatie">
                <xsl:copy-of select="." />
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="$debug = 'true'">
                    <xsl:comment expand-text="yes"> No match for this element </xsl:comment>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>