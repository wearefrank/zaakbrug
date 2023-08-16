<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:include href="../../ZgwFunctionsBase.xslt" />
        <!-- Map -->
    <xsl:param name="ZdsBesluit" as="node()"><ZdsBesluit/></xsl:param>

      <!-- Create/Enrich -->
    <xsl:param name="ZgwBesluit" as="node()"><ZgwBesluit/></xsl:param>

    <xsl:param name="Url" select="''" as="xs:string" />
    <xsl:param name="Identificatie" select="''" as="xs:string" />
    <xsl:param name="VerantwoordelijkeOrganisatie" select="''" as="xs:string" />
    <xsl:param name="Besluittype" select="''" as="xs:string" />
    <xsl:param name="Zaak" select="''" as="xs:string" />
    <xsl:param name="Datum" select="''" as="xs:string" />
    <xsl:param name="Toelichting" select="''" as="xs:string" />
    <xsl:param name="Bestuursorgaan" select="''" as="xs:string" />
    <xsl:param name="Ingangsdatum" select="''" as="xs:string" />
    <xsl:param name="Vervaldatum" select="''" as="xs:string" />
    <xsl:param name="Vervalreden" select="''" as="xs:string" />
    <xsl:param name="VervalredenWeergave" select="''" as="xs:string" />
    <xsl:param name="Publicatiedatum" select="''" as="xs:string" />
    <xsl:param name="Verzenddatum" select="''" as="xs:string" />
    <xsl:param name="UiterlijkeReactiedatum" select="''" as="xs:string" />

    <xsl:template match="/">
        <ZgwBesluit>
            <xsl:copy-of select="zgw:WrapNullOrSkip('url', 'skip', zgw:FromOrderedSource(
                    $Url, 
                    $ZgwBesluit/ZgwBesluit/url, 
                    $ZdsBesluit/besluit/url, 
                    ZgwBesluit/url))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('identificatie', 'empty', zgw:FromOrderedSource(
                    $Identificatie,
                    $ZgwBesluit/ZgwBesluit/identificatie,
                    $ZdsBesluit/besluit/identificatie, 
                    ZgwBesluit/identificatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('verantwoordelijkeOrganisatie', 'null', zgw:FromOrderedSource(
                    $VerantwoordelijkeOrganisatie,
                    $ZgwBesluit/ZgwBesluit/verantwoordelijkeOrganisatie,
                    '', 
                    ZgwBesluit/verantwoordelijkeOrganisatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('besluittype', 'null', zgw:FromOrderedSource(
                    $Besluittype,
                    $ZgwBesluit/ZgwBesluit/besluittype,
                    $ZgwBesluitType/ZgwBesluitType/url, 
                    ZgwBesluit/besluittype))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('zaak', 'empty', zgw:FromOrderedSource(
                    $Zaak,
                    $ZgwBesluit/ZgwBesluit/zaak,
                    '', 
                    ZgwBesluit/zaak))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('datum', 'null', zgw:FromOrderedSource(
                    $Datum,
                    $ZgwBesluit/ZgwBesluit/datum,
                    zgw:toZgwDate($ZdsBesluit/besluit/datumBeslissing), 
                    ZgwBesluit/datum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('toelichting', 'empty', zgw:FromOrderedSource(
                    $Toelichting,
                    $ZgwBesluit/ZgwBesluit/toelichting,
                    $ZdsBesluit/besluit/toelichting, 
                    ZgwBesluit/toelichting))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('bestuursorgaan', 'skip', zgw:FromOrderedSource(
                    $Bestuursorgaan,
                    $ZgwBesluit/ZgwBesluit/bestuursorgaan,
                    '', 
                    ZgwBesluit/bestuursorgaan))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('ingangsdatum', 'null', zgw:FromOrderedSource(
                    $Ingangsdatum,
                    $ZgwBesluit/ZgwBesluit/ingangsdatum,
                    zgw:toZgwDate($ZdsBesluit/besluit/ingangsdatumWerking), 
                    ZgwBesluit/ingangsdatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('vervaldatum', 'empty', zgw:FromOrderedSource(
                    $Vervaldatum,
                    $ZgwBesluit/ZgwBesluit/vervaldatum,
                    zgw:toZgwDate($ZdsBesluit/besluit/einddatumWerking), 
                    ZgwBesluit/vervaldatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('vervalreden', 'empty', zgw:FromOrderedSource(
                    $Vervalreden,
                    $ZgwBesluit/ZgwBesluit/vervalreden,
                    $ZdsBesluit/besluit/vervalreden, 
                    ZgwBesluit/vervalreden))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('publicatiedatum', 'empty', zgw:FromOrderedSource(
                    $Publicatiedatum,
                    $ZgwBesluit/ZgwBesluit/publicatiedatum,
                    zgw:toZgwDate($ZdsBesluit/besluit/datumPublicatie), 
                    ZgwBesluit/publicatiedatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('verzenddatum', 'empty', zgw:FromOrderedSource(
                    $Verzenddatum, 
                    $ZgwBesluit/ZgwBesluit/verzenddatum,
                    zgw:toZgwDate($ZdsBesluit/besluit/datumVerzending),
                    ZgwBesluit/publicatiedatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('uiterlijkeReactiedatum', 'empty', zgw:FromOrderedSource(
                    $UiterlijkeReactiedatum, 
                    $ZgwBesluit/ZgwBesluit/uiterlijkeReactiedatum,
                    zgw:toZgwDate($ZdsBesluit/besluit/datumUiterlijkeReactie),
                    ZgwBesluit/publicatiedatum))"/>
        </ZgwBesluit>
    </xsl:template>
</xsl:stylesheet>