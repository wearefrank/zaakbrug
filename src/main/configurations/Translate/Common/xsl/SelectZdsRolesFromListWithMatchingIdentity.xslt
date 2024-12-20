<xsl:stylesheet exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="3.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

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
            <xsl:when test="$currentGerelateerde/*:inn.nnpId/text() != '' and $matchWithZdsRolGerelateerde/*:inn.nnpId/text() != ''">
                <xsl:if test="$currentGerelateerde/*:inn.nnpId/text() = $matchWithZdsRolGerelateerde/*:inn.nnpId/text()">
                    <xsl:copy-of select="." />
                </xsl:if>
            </xsl:when>
            <xsl:when test="$currentGerelateerde/*:ann.identificatie/text() != '' and $matchWithZdsRolGerelateerde/*:ann.identificatie/text() != ''">
                <xsl:if test="$currentGerelateerde/*:ann.identificatie/text() = $matchWithZdsRolGerelateerde/*:ann.identificatie/text()">
                    <xsl:copy-of select="." />
                </xsl:if>
            </xsl:when>
            <!-- The test checks if all of the elements have the same value on both sides as a whole AND checks if atleast 1 of them is not empty.
                OR statements between () is to prevent positively matching on the absence of all elements on both sides. -->
            <xsl:when test="
                ($currentGerelateerde/*:statutaireNaam/text() = $matchWithZdsRolGerelateerde/*:statutaireNaam/text() or 
                (not(exists($currentGerelateerde/*:statutaireNaam)) and not(exists($matchWithZdsRolGerelateerde/*:statutaireNaam)))) and
                ($currentGerelateerde/*:inn.rechtsvorm/text() = $matchWithZdsRolGerelateerde/*:inn.rechtsvorm/text() or 
                (not(exists($currentGerelateerde/*:inn.rechtsvorm)) and not(exists($matchWithZdsRolGerelateerde/*:inn.rechtsvorm)))) and
                ($currentGerelateerde/*:statutaireNaam/text() != '' or 
                $currentGerelateerde/*:inn.rechtsvorm/text() != '')
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
            <xsl:when test="$currentGerelateerde/*:inp.bsn/text() != '' and $matchWithZdsRolGerelateerde/*:inp.bsn/text() != ''">
                <xsl:if test="$currentGerelateerde/*:inp.bsn/text() = $matchWithZdsRolGerelateerde/*:inp.bsn/text()">
                    <xsl:copy-of select="." />
                </xsl:if>
            </xsl:when>
            <xsl:when test="$currentGerelateerde/*:anp.identificatie/text() != '' and $matchWithZdsRolGerelateerde/*:anp.identificatie/text() != ''">
                <xsl:if test="$currentGerelateerde/*:anp.identificatie/text() = $matchWithZdsRolGerelateerde/*:anp.identificatie/text()">
                    <xsl:copy-of select="." />
                </xsl:if>
            </xsl:when>
            <!-- The test checks if all of the elements have the same value on both sides as a whole AND checks if atleast 1 of them is not empty.
                OR statements between () is to prevent positively matching on the absence of all elements on both sides. -->
            <xsl:when test="
                ($currentGerelateerde/*:inp.a-nummer/text() = $matchWithZdsRolGerelateerde/*:inp.a-nummer/text() or 
                (not(exists($currentGerelateerde/*:inp.a-nummer)) and not(exists($matchWithZdsRolGerelateerde/*:inp.a-nummer)))) and
                ($currentGerelateerde/*:geslachtsnaam/text() = $matchWithZdsRolGerelateerde/*:geslachtsnaam/text() or 
                (not(exists($currentGerelateerde/*:geslachtsnaam)) and not(exists($matchWithZdsRolGerelateerde/*:geslachtsnaam)))) and
                ($currentGerelateerde/*:voorvoegselGeslachtsnaam/text() = $matchWithZdsRolGerelateerde/*:voorvoegselGeslachtsnaam/text() or 
                (not(exists($currentGerelateerde/*:voorvoegselGeslachtsnaam)) and not(exists($matchWithZdsRolGerelateerde/*:voorvoegselGeslachtsnaam)))) and
                ($currentGerelateerde/*:voorletters/text() = $matchWithZdsRolGerelateerde/*:voorletters/text() or 
                (not(exists($currentGerelateerde/*:voorletters)) and not(exists($matchWithZdsRolGerelateerde/*:voorletters)))) and
                ($currentGerelateerde/*:voornamen/text() = $matchWithZdsRolGerelateerde/*:voornamen/text() or 
                (not(exists($currentGerelateerde/*:voornamen)) and not(exists($matchWithZdsRolGerelateerde/*:voornamen)))) and
                ($currentGerelateerde/*:geslachtsaanduiding/text() = $matchWithZdsRolGerelateerde/*:geslachtsaanduiding/text() or 
                (not(exists($currentGerelateerde/*:geslachtsaanduiding)) and not(exists($matchWithZdsRolGerelateerde/*:geslachtsaanduiding)))) and
                ($currentGerelateerde/*:geboortedatum/text() = $matchWithZdsRolGerelateerde/*:geboortedatum/text() or 
                (not(exists($currentGerelateerde/*:geboortedatum)) and not(exists($matchWithZdsRolGerelateerde/*:geboortedatum)))) and
                ($currentGerelateerde/*:inp.a-nummer/text() != '' or
                $currentGerelateerde/*:geslachtsnaam/text() != '' or 
                $currentGerelateerde/*:voorvoegselGeslachtsnaam/text() != '' or 
                $currentGerelateerde/*:voorletters/text() != '' or 
                $currentGerelateerde/*:voornamen/text() != '' or 
                $currentGerelateerde/*:geslachtsaanduiding/text() != '' or 
                $currentGerelateerde/*:geboortedatum/text() != '')
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
            <xsl:when test="$currentGerelateerde/*:identificatie/text() != '' and $matchWithZdsRolGerelateerde/*:identificatie/text() != ''">
                <xsl:if test="$currentGerelateerde/*:identificatie/text() = $matchWithZdsRolGerelateerde/*:identificatie/text()">
                    <xsl:copy-of select="." />
                </xsl:if>
            </xsl:when>
            <!-- The test checks if all of the elements have the same value on both sides as a whole AND checks if atleast 1 of them is not empty.
                OR statements between () is to prevent positively matching on the absence of all elements on both sides. -->
            <xsl:when test="
                ($currentGerelateerde/*:achternaam/text() = $matchWithZdsRolGerelateerde/*:achternaam/text() or 
                (not(exists($currentGerelateerde/*:achternaam)) and not(exists($matchWithZdsRolGerelateerde/*:achternaam)))) and
                ($currentGerelateerde/*:voorletters/text() = $matchWithZdsRolGerelateerde/*:voorletters/text() or 
                (not(exists($currentGerelateerde/*:voorletters)) and not(exists($matchWithZdsRolGerelateerde/*:voorletters)))) and
                ($currentGerelateerde/*:voorvoegselAchternaam/text() = $matchWithZdsRolGerelateerde/*:voorvoegselAchternaam/text() or 
                (not(exists($currentGerelateerde/*:voorvoegselAchternaam)) and not(exists($matchWithZdsRolGerelateerde/*:voorvoegselAchternaam)))) and
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
            <xsl:when test="$currentGerelateerde/*:identificatie/text() != '' and $matchWithZdsRolGerelateerde/*:identificatie/text() != ''">
                <xsl:if test="$currentGerelateerde/*:identificatie/text() = $matchWithZdsRolGerelateerde/*:identificatie/text()">
                    <xsl:copy-of select="." />
                </xsl:if>
            </xsl:when>
            <!-- The test checks if all of the elements have the same value on both sides as a whole AND checks if atleast 1 of them is not empty.
                OR statements between () is to prevent positively matching on the absence of all elements on both sides. -->
            <xsl:when test="
                ($currentGerelateerde/*:naam/text() = $matchWithZdsRolGerelateerde/*:naam/text() or 
                (not(exists($currentGerelateerde/*:naam)) and not(exists($matchWithZdsRolGerelateerde/*:naam)))) and
                ($currentGerelateerde/*:isGehuisvestIn = $matchWithZdsRolGerelateerde/*:isGehuisvestIn or 
                (not(exists($currentGerelateerde/*:isGehuisvestIn)) and not(exists($matchWithZdsRolGerelateerde/*:isGehuisvestIn)))) and
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
            <xsl:when test="$currentGerelateerde/*:vestigingsNummer/text() != '' and $matchWithZdsRolGerelateerde/*:vestigingsNummer/text() != ''">
                <xsl:if test="$currentGerelateerde/*:vestigingsNummer/text() = $matchWithZdsRolGerelateerde/*:vestigingsNummer/text()">
                    <xsl:copy-of select="." />
                </xsl:if>
            </xsl:when>
            <!-- The test checks if all of the elements have the same value on both sides as a whole AND checks if atleast 1 of them is not empty.
                OR statements between () is to prevent positively matching on the absence of all elements on both sides. -->
            <xsl:when test="
                ($currentGerelateerde/*:handelsnaam/text() = $matchWithZdsRolGerelateerde/*:handelsnaam/text() or 
                (not(exists($currentGerelateerde/*:handelsnaam)) and not(exists($matchWithZdsRolGerelateerde/*:handelsnaam)))) and
                $currentGerelateerde/*:handelsnaam/text() != ''
                ">
                <xsl:copy-of select="." />
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>