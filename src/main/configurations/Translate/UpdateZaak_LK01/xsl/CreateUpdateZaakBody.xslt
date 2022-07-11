<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:zgw="http://google.com/zgw" exclude-result-prefixes="array fn map math xhtml xs err zgw" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:include href="../../Zgw/ZgwFunctionsBase.xslt" />

    <xsl:param name="ZgwZaak"/>

    <xsl:param name="Identificatie" select="''" as="xs:string" />
    <xsl:param name="Rsin"/>
    <xsl:param name="Toelichting" select="''" as="xs:string" />
    <xsl:param name="Zaaktype" select="''" as="xs:string" />
    <xsl:param name="Registratiedatum" select="''" as="xs:string" />
    <xsl:param name="VerantwoordelijkeOrganisatie" select="''" as="xs:string" />
    <xsl:param name="Startdatum" select="''" as="xs:string" />
    <xsl:param name="EinddatumGepland" select="''" as="xs:string" />
    <xsl:param name="UiterlijkeEinddatumAfdoening" select="0" as="xs:integer" />
    <xsl:param name="Publicatiedatum" select="''" as="xs:string" />
    <xsl:param name="Communicatiekanaal" select="''" as="xs:string" />
    <xsl:param name="ProductenOfDiensten" select="''" as="xs:string" />
    <xsl:param name="Vertrouwelijkheidaanduiding" select="''" as="xs:string" />
    <xsl:param name="Betalingsindicatie" select="''" as="xs:string" />
    <xsl:param name="Zaakgeometrie" as="node()"><Zaakgeometrie/></xsl:param>
    <xsl:param name="Verlenging" as="node()"><Verlenging/></xsl:param>
    <xsl:param name="Opschorting" as="node()"><Opschorting/></xsl:param>
    <xsl:param name="Selectielijstklasse" select="''" as="xs:string" />
    <xsl:param name="Hoofdzaak" select="''" as="xs:string" />
    <xsl:param name="RelevanteAndereZaken" as="node()"><RelevanteAndereZaken/></xsl:param>
    <xsl:param name="Kenmerk" as="node()"><Kenmerk/></xsl:param>
    <xsl:param name="Archiefnominatie" select="''" as="xs:string" />
    <xsl:param name="Archiefstatus" select="''" as="xs:string" />
    <xsl:param name="Archiefactiedatum" select="''" as="xs:string" />

	<xsl:template match="/">
        <ZgwZaakPut>
            <xsl:copy-of select="zgw:WrapNullOrSkip('identificatie', 'skip', zgw:FromOrderedSource(
                $Identificatie, 
                object/identificatie,
                '',
                $ZgwZaak/ZgwZaak/identificatie))"/>
            <bronorganisatie><xsl:value-of select="$Rsin/rsin"/></bronorganisatie>
            <omschrijving><xsl:value-of select="object/omschrijving"/></omschrijving>
            <xsl:copy-of select="zgw:WrapNullOrSkip('toelichting', 'skip', zgw:FromOrderedSource(
                $Toelichting, 
                object/toelichting,
                '',
                $ZgwZaak/ZgwZaak/toelichting))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('zaaktype', 'skip', zgw:FromOrderedSource(
                $Zaaktype, 
                object/zaaktype,
                '',
                $ZgwZaak/ZgwZaak/zaaktype))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('registratiedatum', 'skip', zgw:FromOrderedSource(
                $Registratiedatum, 
                zgw:toZgwDate(object/registratiedatum),
                '',
                $ZgwZaak/ZgwZaak/registratiedatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('verantwoordelijkeOrganisatie', 'skip', zgw:FromOrderedSource(
                $VerantwoordelijkeOrganisatie, 
                object/verantwoordelijkeOrganisatie,
                '',
                $ZgwZaak/ZgwZaak/verantwoordelijkeOrganisatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('startdatum', 'skip', zgw:FromOrderedSource(
                $Startdatum, 
                zgw:toZgwDate(object/startdatum),
                '',
                $ZgwZaak/ZgwZaak/startdatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('einddatumGepland', 'skip', zgw:FromOrderedSource(
                $EinddatumGepland, 
                zgw:toZgwDate(object/einddatumGepland),
                '',
                $ZgwZaak/ZgwZaak/einddatumGepland))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('uiterlijkeEinddatumAfdoening', 'skip', zgw:FromOrderedSource(
                $UiterlijkeEinddatumAfdoening, 
                zgw:toZgwDate(object/uiterlijkeEinddatumAfdoening),
                '',
                $ZgwZaak/ZgwZaak/uiterlijkeEinddatumAfdoening))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('publicatiedatum', 'skip', zgw:FromOrderedSource(
                $Publicatiedatum, 
                zgw:toZgwDate(object/publicatiedatum),
                '',
                $ZgwZaak/ZgwZaak/publicatiedatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('communicatiekanaal', 'skip', zgw:FromOrderedSource(
                $Communicatiekanaal, 
                object/communicatiekanaal,
                '',
                $ZgwZaak/ZgwZaak/communicatiekanaal))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('productenOfDiensten', 'skip', zgw:FromOrderedSource(
                $ProductenOfDiensten, 
                object/productenOfDiensten,
                '',
                $ZgwZaak/ZgwZaak/productenOfDiensten))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('vertrouwelijkheidaanduiding', 'skip', zgw:FromOrderedSource(
                $Vertrouwelijkheidaanduiding, 
                object/vertrouwelijkheidaanduiding,
                '',
                $ZgwZaak/ZgwZaak/vertrouwelijkheidaanduiding))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('betalingsindicatie', 'skip', zgw:FromOrderedSource(
                $Betalingsindicatie, 
                object/betalingsindicatie,
                '',
                $ZgwZaak/ZgwZaak/betalingsindicatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('zaakgeometrie', 'skip', zgw:FromOrderedSource(
                $Zaakgeometrie, 
                object/zaakgeometrie,
                '',
                $ZgwZaak/ZgwZaak/zaakgeometrie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('verlenging', 'skip', zgw:FromOrderedSource(
                $Verlenging, 
                object/verlenging,
                '',
                $ZgwZaak/ZgwZaak/verlenging))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('opschorting', 'skip', zgw:FromOrderedSource(
                $Opschorting, 
                object/opschorting,
                '',
                $ZgwZaak/ZgwZaak/opschorting))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('selectielijstklasse', 'skip', zgw:FromOrderedSource(
                $Selectielijstklasse, 
                object/selectielijstklasse,
                '',
                $ZgwZaak/ZgwZaak/selectielijstklasse))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('hoofdzaak', 'skip', zgw:FromOrderedSource(
                $Hoofdzaak, 
                object/hoofdzaak,
                '',
                $ZgwZaak/ZgwZaak/hoofdzaak))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('relevanteAndereZaken', 'skip', zgw:FromOrderedSource(
                $RelevanteAndereZaken, 
                object/relevanteAndereZaken,
                '',
                $ZgwZaak/ZgwZaak/relevanteAndereZaken))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('kenmerk', 'skip', zgw:FromOrderedSource(
                $Kenmerk, 
                object/kenmerk,
                '',
                $ZgwZaak/ZgwZaak/kenmerk))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('archiefnominatie', 'skip', zgw:FromOrderedSource(
                $Archiefnominatie, 
                object/archiefnominatie,
                '',
                $ZgwZaak/ZgwZaak/archiefnominatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('archiefstatus', 'skip', zgw:FromOrderedSource(
                $Archiefstatus, 
                object/archiefstatus,
                '',
                $ZgwZaak/ZgwZaak/archiefstatus))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('archiefactiedatum', 'skip', zgw:FromOrderedSource(
                $Archiefactiedatum, 
                zgw:toZgwDate(object/archiefactiedatum),
                '',
                $ZgwZaak/ZgwZaak/archiefactiedatum))"/>
        </ZgwZaakPut>
	</xsl:template>
</xsl:stylesheet>