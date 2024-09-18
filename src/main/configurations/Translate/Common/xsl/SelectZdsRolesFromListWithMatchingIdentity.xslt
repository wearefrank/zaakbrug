<xsl:stylesheet exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="true" />

    <xsl:param name="MatchWithZdsRol" as="node()"><xsl:document /></xsl:param>

    <xsl:param name="debug" as="xs:string" select="'false'" />
	<xsl:variable name="debugSerializeParams" as="map(xs:string, item()?)">
		<xsl:map>
			<xsl:map-entry key="'indent'" select="true()"/>
		</xsl:map>
	</xsl:variable>

    <xsl:variable name="rootName" select="local-name($MatchWithZdsRol/*)" />

    <xsl:template match="/">
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> MatchWithZdsRol: [{serialize($MatchWithZdsRol, $debugSerializeParams)}] </xsl:comment></xsl:if>
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> rootName: [{serialize($rootName, $debugSerializeParams)}] </xsl:comment></xsl:if>

        <roles>
            <xsl:variable name="matchingRoles">
                <xsl:apply-templates select="//*[local-name() = $rootName]"/>
            </xsl:variable>
            <xsl:copy-of select="$matchingRoles//namespace-node()" />
            <!-- Transfer any namespaces from children to roles parent -->
            <xsl:copy-of select="$matchingRoles" copy-namespaces="false" />
        </roles>
    </xsl:template>

    <xsl:template match="*:heeftAlsBelanghebbende | *:heeftAlsInitiator | *:heeftAlsUitvoerende | *:heeftAlsVerantwoordelijke | *:heeftAlsGemachtigde | *:heeftAlsOverigBetrokkene | *:heeftBetrekkingOp">
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> rolesTemplateInput: [{serialize(., $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> rootName: [{serialize(*[*:gerelateerde/*/@*:entiteittype = $MatchWithZdsRol/*/*:gerelateerde/*/@*:entiteittype], $debugSerializeParams)}] </xsl:comment></xsl:if>
        <xsl:apply-templates select="*[*:gerelateerde/*/@*:entiteittype = $MatchWithZdsRol/*/*:gerelateerde/*/@*:entiteittype]" />
    </xsl:template>

    <!-- NNP-zkn-kerngegevensKennisgeving -->
    <xsl:template match="*[*:gerelateerde/*/@*:entiteittype = 'NNP']">
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> gerelateerdeTemplateInput: [{serialize(., $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:variable name="matchWithZdsRolGerelateerde" select="$MatchWithZdsRol/*/*:gerelateerde/*" />
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> matchWithZdsRolGerelateerde: [{serialize($matchWithZdsRolGerelateerde, $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:variable name="currentGerelateerde" select="*:gerelateerde/*" />
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> currentGerelateerde: [{serialize($currentGerelateerde, $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:choose>
            <xsl:when test="
                $currentGerelateerde/*:inn.nnpId/text() = $matchWithZdsRolGerelateerde/*:inn.nnpId/text() and 
                $currentGerelateerde/*:inn.nnpId/text() != ''
                ">
                <xsl:copy-of select="." />
            </xsl:when>
            <xsl:when test="
                $currentGerelateerde/*:ann.identificatie/text() = $matchWithZdsRolGerelateerde/*:ann.identificatie/text() and 
                $currentGerelateerde/*:ann.identificatie/text() != ''
                ">
                <xsl:copy-of select="." />
            </xsl:when>
            <!-- The test checks if all of the elements have the same value on both sides as a whole AND checks if atleast 1 of them is not empty.
                OR statements between () is to prevent positively matching on the absence of all elements on both sides. -->
            <xsl:when test="
                $currentGerelateerde/*:statutaireNaam/text() = $matchWithZdsRolGerelateerde/*:statutaireNaam/text() and
                $currentGerelateerde/*:inn.rechtsvorm/text() = $matchWithZdsRolGerelateerde/*:inn.rechtsvorm/text() and
                $currentGerelateerde/*:bezoekadres = $matchWithZdsRolGerelateerde/*:bezoekadres and
                $currentGerelateerde/*:sub.verblijfBuitenland = $matchWithZdsRolGerelateerde/*:sub.verblijfBuitenland and
                ($currentGerelateerde/*:statutaireNaam/text() != '' or 
                $currentGerelateerde/*:inn.rechtsvorm/text() != '' or 
                string-length($currentGerelateerde/*:bezoekadres) gt 0 or 
                string-length($currentGerelateerde/*:sub.verblijfBuitenland) gt 0)
                ">
                <xsl:copy-of select="." />
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:template>

    <!-- NPS-zkn-kerngegevensKennisgeving -->
    <xsl:template match="*[*:gerelateerde/*/@*:entiteittype = 'NPS']">
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> gerelateerdeTemplateInput: [{serialize(., $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:variable name="matchWithZdsRolGerelateerde" select="$MatchWithZdsRol/*/*:gerelateerde/*" />
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> matchWithZdsRolGerelateerde: [{serialize($matchWithZdsRolGerelateerde, $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:variable name="currentGerelateerde" select="*:gerelateerde/*" />
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> currentGerelateerde: [{serialize($currentGerelateerde, $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:choose>
            <xsl:when test="
                $currentGerelateerde/*:inp.bsn/text() = $matchWithZdsRolGerelateerde/*:inp.bsn/text() and 
                $currentGerelateerde/*:inp.bsn/text() != ''
                ">
                <xsl:copy-of select="." />
            </xsl:when>
            <xsl:when test="
                $currentGerelateerde/*:anp.identificatie/text() = $matchWithZdsRolGerelateerde/*:anp.identificatie/text() and 
                $currentGerelateerde/*:anp.identificatie/text() != ''
                ">
                <xsl:copy-of select="." />
            </xsl:when>
            <!-- The test checks if all of the elements have the same value on both sides as a whole AND checks if atleast 1 of them is not empty.
                OR statements between () is to prevent positively matching on the absence of all elements on both sides. -->
            <xsl:when test="
                $currentGerelateerde/*:inp.a-nummer/text() = $matchWithZdsRolGerelateerde/*:inp.a-nummer/text() and
                $currentGerelateerde/*:geslachtsnaam/text() = $matchWithZdsRolGerelateerde/*:geslachtsnaam/text() and
                $currentGerelateerde/*:voorvoegselGeslachtsnaam/text() = $matchWithZdsRolGerelateerde/*:voorvoegselGeslachtsnaam/text() and
                $currentGerelateerde/*:voorletters/text() = $matchWithZdsRolGerelateerde/*:voorletters/text() and
                $currentGerelateerde/*:voornamen/text() = $matchWithZdsRolGerelateerde/*:voornamen/text() and
                $currentGerelateerde/*:geslachtsaanduiding/text() = $matchWithZdsRolGerelateerde/*:geslachtsaanduiding/text() and
                $currentGerelateerde/*:geboortedatum/text() = $matchWithZdsRolGerelateerde/*:geboortedatum/text() and
                $currentGerelateerde/*:verblijfsadres = $matchWithZdsRolGerelateerde/*:verblijfsadres and
                $currentGerelateerde/*:sub.verblijfBuitenland = $matchWithZdsRolGerelateerde/*:sub.verblijfBuitenland and 
                ($currentGerelateerde/*:inp.a-nummer/text() != '' or
                $currentGerelateerde/*:geslachtsnaam/text() != '' or 
                $currentGerelateerde/*:voorvoegselGeslachtsnaam/text() != '' or 
                $currentGerelateerde/*:voorletters/text() != '' or 
                $currentGerelateerde/*:voornamen/text() != '' or 
                $currentGerelateerde/*:geslachtsaanduiding/text() != '' or 
                $currentGerelateerde/*:geboortedatum/text() != '' or 
                string-length($currentGerelateerde/*:verblijfsadres) gt 0 or 
                string-length($currentGerelateerde/*:sub.verblijfBuitenland) gt 0)
                ">
                <xsl:copy-of select="." />
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:template>

    <!-- MDW-kerngegevensKennisgeving -->
    <xsl:template match="*[*:gerelateerde/*/@*:entiteittype = 'MDW']">
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> gerelateerdeTemplateInput: [{serialize(., $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:variable name="matchWithZdsRolGerelateerde" select="$MatchWithZdsRol/*/*:gerelateerde/*" />
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> matchWithZdsRolGerelateerde: [{serialize($matchWithZdsRolGerelateerde, $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:variable name="currentGerelateerde" select="*:gerelateerde/*" />
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> currentGerelateerde: [{serialize($currentGerelateerde, $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:choose>
            <xsl:when test="
                $currentGerelateerde/*:identificatie/text() = $matchWithZdsRolGerelateerde/*:identificatie/text() and 
                $currentGerelateerde/*:identificatie/text() != ''
                ">
                <xsl:copy-of select="." />
            </xsl:when>
            <!-- The test checks if all of the elements have the same value on both sides as a whole AND checks if atleast 1 of them is not empty.
                OR statements between () is to prevent positively matching on the absence of all elements on both sides. -->
            <xsl:when test="
                $currentGerelateerde/*:achternaam/text() = $matchWithZdsRolGerelateerde/*:achternaam/text() and
                $currentGerelateerde/*:voorletters/text() = $matchWithZdsRolGerelateerde/*:voorletters/text() and
                $currentGerelateerde/*:voorvoegselAchternaam/text() = $matchWithZdsRolGerelateerde/*:voorvoegselAchternaam/text() and
                ($currentGerelateerde/*:achternaam/text() != '' or 
                $currentGerelateerde/*:voorletters/text() != '' or 
                $currentGerelateerde/*:voorvoegselAchternaam/text() != '')
                ">
                <xsl:copy-of select="." />
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:template>

    <!-- OEH-kerngegevensKennisgeving -->
    <xsl:template match="*[*:gerelateerde/*/@*:entiteittype = 'OEH']">
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> gerelateerdeTemplateInput: [{serialize(., $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:variable name="matchWithZdsRolGerelateerde" select="$MatchWithZdsRol/*/*:gerelateerde/*" />
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> matchWithZdsRolGerelateerde: [{serialize($matchWithZdsRolGerelateerde, $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:variable name="currentGerelateerde" select="*:gerelateerde/*" />
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> currentGerelateerde: [{serialize($currentGerelateerde, $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:choose>
            <xsl:when test="
                $currentGerelateerde/*:vestigingsNummer/text() = $matchWithZdsRolGerelateerde/*:vestigingsNummer/text() and 
                $currentGerelateerde/*:vestigingsNummer/text() != ''
                ">
                <xsl:copy-of select="." />
            </xsl:when>
            <!-- The test checks if all of the elements have the same value on both sides as a whole AND checks if atleast 1 of them is not empty.
                OR statements between () is to prevent positively matching on the absence of all elements on both sides. -->
            <xsl:when test="
                $currentGerelateerde/*:naam/text() = $matchWithZdsRolGerelateerde/*:naam/text() and
                $currentGerelateerde/*:isGehuisvestIn = $matchWithZdsRolGerelateerde/*:isGehuisvestIn and
                ($currentGerelateerde/*:naam/text() != '' or
                string-length($currentGerelateerde/*:isGehuisvestIn) gt 0)
                ">
                <xsl:copy-of select="." />
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:template>

    <!-- VES-zkn-kerngegevensKennisgeving -->
    <xsl:template match="*[*:gerelateerde/*/@*:entiteittype = 'VES']">
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> gerelateerdeTemplateInput: [{serialize(., $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:variable name="matchWithZdsRolGerelateerde" select="$MatchWithZdsRol/*/*:gerelateerde/*" />
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> matchWithZdsRolGerelateerde: [{serialize($matchWithZdsRolGerelateerde, $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:variable name="currentGerelateerde" select="*:gerelateerde/*" />
        <xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> currentGerelateerde: [{serialize($currentGerelateerde, $debugSerializeParams)}] </xsl:comment></xsl:if>

        <xsl:choose>
            <xsl:when test="
                $currentGerelateerde/*:identificatie/text() = $matchWithZdsRolGerelateerde/*:identificatie/text() and 
                $currentGerelateerde/*:identificatie/text() != ''
                ">
                <xsl:copy-of select="." />
            </xsl:when>
            <!-- The test checks if all of the elements have the same value on both sides as a whole AND checks if atleast 1 of them is not empty.
                OR statements between () is to prevent positively matching on the absence of all elements on both sides. -->
            <xsl:when test="
                $currentGerelateerde/*:handelsnaam/text() = $matchWithZdsRolGerelateerde/*:handelsnaam/text() and
                $currentGerelateerde/*:verblijfsadres = $matchWithZdsRolGerelateerde/*:verblijfsadres and
                $currentGerelateerde/*:sub.verblijfBuitenland = $matchWithZdsRolGerelateerde/*:sub.verblijfBuitenland and
                ($currentGerelateerde/*:handelsnaam/text() != '' or
                string-length($currentGerelateerde/*:verblijfsadres) gt 0 or
                string-length($currentGerelateerde/*:sub.verblijfBuitenland) gt 0)
                ">
                <xsl:copy-of select="." />
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>