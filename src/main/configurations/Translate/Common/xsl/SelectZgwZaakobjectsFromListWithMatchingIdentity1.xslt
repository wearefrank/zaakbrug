<xsl:stylesheet exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <xsl:param name="MatchWithZgwZaakobject" as="node()"><xsl:document /></xsl:param>

    <xsl:param name="debug" as="xs:string" select="'false'" />
    <xsl:variable name="debugSerializeParams" as="map(xs:string, item()?)">
        <xsl:map>
            <xsl:map-entry key="'indent'" select="true()"/>
        </xsl:map>
    </xsl:variable>

    <xsl:variable name="rootName" select="local-name($MatchWithZgwZaakobject/*)" />

    <xsl:template match="/">
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> MatchWithZgwZaakobject: [{serialize($MatchWithZgwZaakobject, $debugSerializeParams)}] </xsl:comment></xsl:if>
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> rootName: [{serialize($rootName, $debugSerializeParams)}] </xsl:comment></xsl:if>

        <ZgwZaakobjecten>
            <xsl:variable name="matchingZaakobject">
                <xsl:apply-templates select="//*[local-name() = $rootName]"/>
            </xsl:variable>
            <xsl:copy-of select="$matchingZaakobject" copy-namespaces="false" />
        </ZgwZaakobjecten>
    </xsl:template>

    <xsl:template match="*:ZgwZaakobject">
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> zaakObjectTemplateInput: [{serialize(., $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:variable name="matchIdentificatie" select="$MatchWithZgwZaakobject/*/*:objectIdentificatie/*:identificatie/text()" />
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