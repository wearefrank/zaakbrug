<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:include href="../../ZgwFunctionsBase.xslt" />
        <!-- Map -->
    <xsl:param name="ZdsBesluit" as="node()"><ZdsBesluit/></xsl:param>
    <xsl:param name="ZdsZaak" as="node()"><ZdsZaak/></xsl:param> 
    <!-- We can remove ZdsZaak since we do not use it because it only has Zaak Identificatie Which is not needed on Zgw part -->

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
                    '', 
                    '', 
                    ''))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('identificatie', 'empty', zgw:FromOrderedSource(
                    $Identificatie, 
                    $ZdsBesluit/identificatie,
                    '', 
                    ''))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('verantwoordelijkeOrganisatie', 'null', zgw:FromOrderedSource(
                    $VerantwoordelijkeOrganisatie, 
                    '', 
                    '', 
                    ''))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('besluittype', 'null', zgw:FromOrderedSource(
                    $Besluittype, 
                    '', 
                    '', 
                    ''))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('zaak', 'empty', zgw:FromOrderedSource(
                    $Zaak, 
                    '',
                    '', 
                    ''))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('datum', 'null', zgw:FromOrderedSource(
                    $Datum, 
                    $ZdsBesluit/datumBeslissing,
                    '', 
                    ''))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('toelichting', 'empty', zgw:FromOrderedSource(
                    $Toelichting, 
                    $ZdsBesluit/toelichting,
                    '', 
                    ''))"/>

                    <!-- There is no bestuursorgaan in ZDS side -->
            <xsl:copy-of select="zgw:WrapNullOrSkip('bestuursorgaan', 'empty', zgw:FromOrderedSource(
                    $Bestuursorgaan, 
                    '',
                    '', 
                    ''))"/>

            <xsl:copy-of select="zgw:WrapNullOrSkip('ingangsdatum', 'null', zgw:FromOrderedSource(
                $Ingangsdatum, 
                $ZdsBesluit/ingangsdatumWerking,
                '', 
                ''))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('vervaldatum', 'empty', zgw:FromOrderedSource(
                $Vervaldatum, 
                $ZdsBesluit/einddatumWerking,
                '', 
                ''))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('vervalreden', 'empty', zgw:FromOrderedSource(
                $Vervalreden, 
                $ZdsBesluit/vervalreden,
                '', 
                ''))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('publicatiedatum', 'empty', zgw:FromOrderedSource(
                $Publicatiedatum, 
                $ZdsBesluit/datumPublicatie,
                '', 
                ''))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('verzenddatum', 'empty', zgw:FromOrderedSource(
                $Verzenddatum, 
                $ZdsBesluit/datumVerzending,
                '', 
                ''))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('uiterlijkeReactiedatum', 'empty', zgw:FromOrderedSource(
                $UiterlijkeReactiedatum, 
                $ZdsBesluit/datumUiterlijkeReactie,
                '', 
                ''))"/>
        </ZgwBesluit>
    </xsl:template>
</xsl:stylesheet>