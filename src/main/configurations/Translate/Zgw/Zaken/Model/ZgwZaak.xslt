<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:fn="http://www.w3.org/TR/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:zgw="http://google.com/zgw" exclude-result-prefixes="array fn map math xhtml xs err zgw" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:include href="../../ZgwFunctionsBase.xslt" />

    <!-- Map -->
    <xsl:param name="ZdsZaak" as="node()"><ZdsZaak/></xsl:param>

    <!-- Create/Enrich -->
    <xsl:param name="ZgwZaak" as="node()"><ZgwZaak/></xsl:param>

    <xsl:param name="Url" select="''" as="xs:string" />
    <xsl:param name="Uuid" select="''" as="xs:string" />
    <xsl:param name="Identificatie" select="''" as="xs:string" />
    <xsl:param name="Bronorganisatie" select="''" as="xs:string" />
    <xsl:param name="Omschrijving" select="''" as="xs:string" />
    <xsl:param name="Toelichting" select="''" as="xs:string" />
    <xsl:param name="Zaaktype" select="''" as="xs:string" />
    <xsl:param name="Registratiedatum" select="''" as="xs:string" />
    <xsl:param name="VerantwoordelijkeOrganisatie" select="''" as="xs:string" />
    <xsl:param name="Startdatum" select="''" as="xs:string" />
    <xsl:param name="Einddatum" select="''" as="xs:string" />
    <xsl:param name="EinddatumGepland" select="''" as="xs:string" />
    <xsl:param name="UiterlijkeEinddatumAfdoening" select="''" as="xs:string" />
    <xsl:param name="Publicatiedatum" select="''" as="xs:string" />
    <xsl:param name="Communicatiekanaal" select="''" as="xs:string" />
    <xsl:param name="ProductenOfDiensten" as="node()"><productenOfDiensten /></xsl:param>
    <xsl:param name="Vertrouwelijkheidaanduiding" select="''" as="xs:string" />
    <xsl:param name="Betalingsindicatie" select="''" as="xs:string" />
    <xsl:param name="BetalingsindicatieWeergave" select="''" as="xs:string" />
    <xsl:param name="LaatsteBetaaldatum" select="''" as="xs:string" />
    <xsl:param name="Zaakgeometrie" as="node()"><zaakgeometrie /></xsl:param>
    <xsl:param name="Verlenging" as="node()"><verlenging /></xsl:param>
    <xsl:param name="Opschorting" as="node()"><opschorting /></xsl:param>
    <xsl:param name="Selectielijstklasse" select="''" as="xs:string" />
    <xsl:param name="Hoofdzaak" select="''" as="xs:string" />
    <xsl:param name="Deelzaken" as="node()"><deelzaken /></xsl:param>
    <xsl:param name="RelevanteAndereZaken" as="node()"><relevanteAndereZaken /></xsl:param>
    <xsl:param name="Eigenschappen" as="node()"><eigenschappen /></xsl:param>
    <xsl:param name="Status" select="''" as="xs:string" />
    <xsl:param name="Kenmerken" as="node()"><kenmerken /></xsl:param>
    <xsl:param name="Archiefnominatie" select="''" as="xs:string" />
    <xsl:param name="Archiefstatus" select="''" as="xs:string" />
    <xsl:param name="Archiefactiedatum" select="''" as="xs:string" />
    <xsl:param name="Resultaat" select="''" as="xs:string" />
    <xsl:param name="OpdrachtgevendeOrganisatie" select="''" as="xs:string" />
    
	<xsl:template match="/">
		<ZgwZaak>
            <xsl:copy-of select="zgw:WrapNullOrSkip('url', 'skip', zgw:FromOrderedSource(
                $Url, 
                $ZgwZaak//url, 
                '', 
                //url))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('uuid', 'skip', zgw:FromOrderedSource(
                $Uuid, 
                $ZgwZaak//uuid, 
                '', 
                //uuid))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('identificatie', 'skip', zgw:FromOrderedSource(
                $Identificatie, 
                $ZgwZaak//identificatie, 
                $ZdsZaak//identificatie, 
                //identificatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('bronorganisatie', 'skip', zgw:FromOrderedSource(
                $Bronorganisatie, 
                $ZgwZaak//bronorganisatie, 
                '', 
                //bronorganisatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('omschrijving', 'skip', zgw:FromOrderedSource(
                $Omschrijving, 
                $ZgwZaak//omschrijving, 
                $ZdsZaak//omschrijving, 
                //omschrijving))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('toelichting', 'skip', zgw:FromOrderedSource(
                $Toelichting, 
                $ZgwZaak//toelichting, 
                $ZdsZaak//toelichting, 
                //toelichting))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('zaaktype', 'skip', zgw:FromOrderedSource(
                $Zaaktype, 
                $ZgwZaak//zaaktype, 
                '', 
                //zaaktype))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('registratiedatum', 'skip', zgw:FromOrderedSource(
                $Registratiedatum, 
                $ZgwZaak//registratiedatum, 
                zgw:toZgwDate($ZdsZaak//registratiedatum), 
                //registratiedatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('verantwoordelijkeOrganisatie', 'skip', zgw:FromOrderedSource(
                $VerantwoordelijkeOrganisatie, 
                $ZgwZaak//verantwoordelijkeOrganisatie, 
                '', 
                //verantwoordelijkeOrganisatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('startdatum', 'skip', zgw:FromOrderedSource(
                $Startdatum, 
                $ZgwZaak//startdatum, 
                zgw:toZgwDate($ZdsZaak//startdatum), 
                //startdatum))"/>
            <!-- Even though einddatum exists in ZdsZaak, it does not have the same meaning. ZGW einddatum should be sourced from the statusGezet field in ZgwStatus where eindstatus=true -->
            <xsl:copy-of select="zgw:WrapNullOrSkip('einddatum', 'null', zgw:FromOrderedSource(
                $Einddatum, 
                $ZgwZaak//einddatum, 
                $ZdsZaak//einddatum, 
                //einddatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('einddatumGepland', 'null', zgw:FromOrderedSource(
                $EinddatumGepland, 
                $ZgwZaak//einddatumGepland, 
                zgw:toZgwDate($ZdsZaak//einddatumGepland), 
                //einddatumGepland))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('uiterlijkeEinddatumAfdoening', 'null', zgw:FromOrderedSource(
                $UiterlijkeEinddatumAfdoening, 
                $ZgwZaak//uiterlijkeEinddatumAfdoening, 
                zgw:toZgwDate($ZdsZaak//uiterlijkeEinddatum), 
                //uiterlijkeEinddatumAfdoening))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('publicatiedatum', 'null', zgw:FromOrderedSource(
                $Publicatiedatum, 
                $ZgwZaak//publicatiedatum, 
                zgw:toZgwDate($ZdsZaak//publicatiedatum),
                //publicatiedatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('communicatiekanaal', 'empty', zgw:FromOrderedSource(
                $Communicatiekanaal, 
                $ZgwZaak//communicatiekanaal, 
                '', 
                //communicatiekanaal))"/>
            <xsl:variable name="productenOfDiensten">
                <xsl:apply-templates select="$ZdsZaak/productenOfDiensten"/>
            </xsl:variable>
            <xsl:for-each select="zgw:ObjectFromOrderedSource(
                $ProductenOfDiensten/productenOfDiensten, 
                $ZgwZaak/productenOfDiensten, 
                $productenOfDiensten, 
                //productenOfDiensten)">
                <xsl:copy-of select="zgw:WrapNullOrSkip('productenOfDiensten', 'skip', .)"/>
            </xsl:for-each>
            <xsl:copy-of select="zgw:WrapNullOrSkip('vertrouwelijkheidaanduiding', 'skip', zgw:FromOrderedSource(
                $Vertrouwelijkheidaanduiding, 
                $ZgwZaak//vertrouwelijkheidaanduiding, 
                '', 
                //vertrouwelijkheidaanduiding))"/>
            <xsl:variable name="betalingsindicatie" select="zgw:FromOrderedSource(
                $Betalingsindicatie, 
                $ZgwZaak//betalingsindicatie, 
                '', 
                //betalingsindicatie)"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('betalingsindicatie', 'skip', $betalingsindicatie)" />
            <xsl:copy-of select="zgw:WrapNullOrSkip('betalingsindicatieWeergave', 'skip', zgw:FromOrderedSource(
                $BetalingsindicatieWeergave, 
                $ZgwZaak//betalingsindicatieWeergave, 
                '', 
                //betalingsindicatieWeergave,
                zgw:createDefaultBetalingsindicatieWeergave($betalingsindicatie)))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('laatsteBetaaldatum', 'null', zgw:FromOrderedSource(
                $LaatsteBetaaldatum, 
                $ZgwZaak//laatsteBetaaldatum, 
                $ZdsZaak//laatsteBetaaldatum, 
                //laatsteBetaaldatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('zaakgeometrie', 'null', zgw:FromOrderedSource(
                $Zaakgeometrie/zaakgeometrie, 
                $ZgwZaak//zaakgeometrie, 
                '', 
                //zaakgeometrie))"/>
            <xsl:variable name="verlenging">
                <xsl:apply-templates select="$ZdsZaak/verlenging"/>
            </xsl:variable>
            <!-- Temp workaround -->
            <xsl:variable name="nullVerlenging">
                <verlenging xsi:nil="true" />
            </xsl:variable>
            <xsl:copy-of select="zgw:ObjectFromOrderedSource(
                $Verlenging/verlenging, 
                $ZgwZaak//verlenging, 
                $verlenging/verlenging, 
                //verlenging,
                $nullVerlenging)"/>
            <xsl:variable name="ZdsOpschorting">
                <xsl:apply-templates select="$ZdsZaak/opschorting"/>
            </xsl:variable>
            <xsl:variable name="DefaultOpschorting">
                <opschorting>
                    <indicatie><xsl:value-of select="false()"/></indicatie>
                    <reden />
                </opschorting>
            </xsl:variable>
            <xsl:copy-of select="zgw:ObjectFromOrderedSource(
                $Opschorting/opschorting, 
                $ZgwZaak//opschorting, 
                $ZdsOpschorting/opschorting, 
                //opschorting,
                $DefaultOpschorting)"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('selectielijstklasse', 'empty', zgw:FromOrderedSource(
                $Selectielijstklasse, 
                $ZgwZaak//selectielijstklasse, 
                '', 
                //selectielijstklasse))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('hoofdzaak', 'null', zgw:FromOrderedSource(
                $Hoofdzaak, 
                $ZgwZaak//hoofdzaak, 
                '', 
                //hoofdzaak))"/>
            <xsl:for-each select="zgw:ObjectFromOrderedSource(
                $Deelzaken/deelzaken, 
                $ZgwZaak/deelzaken, 
                '', 
                //deelzaken)">
                <xsl:copy-of select="zgw:WrapNullOrSkip('deelzaken', 'skip', .)"/>
            </xsl:for-each>
            <xsl:for-each select="zgw:ObjectFromOrderedSource(
                $RelevanteAndereZaken/relevanteAndereZaken, 
                $ZgwZaak/relevanteAndereZaken, 
                '', 
                //relevanteAndereZaken)">
                <xsl:copy-of select="zgw:WrapNullOrSkip('relevanteAndereZaken', 'skip', .)"/>
            </xsl:for-each>
            <xsl:for-each select="zgw:ObjectFromOrderedSource(
                $Eigenschappen/eigenschappen, 
                $ZgwZaak/eigenschappen, 
                '', 
                //eigenschappen)">
                <xsl:copy-of select="zgw:WrapNullOrSkip('eigenschappen', 'skip', .)"/>
            </xsl:for-each>
            <xsl:copy-of select="zgw:WrapNullOrSkip('status', 'null', zgw:FromOrderedSource(
                $Status, 
                $ZgwZaak//status, 
                '', 
                //status))"/>
            <xsl:variable name="kenmerken">
                <xsl:apply-templates select="$ZdsZaak/kenmerk"/>
            </xsl:variable>
            <xsl:for-each select="zgw:ObjectFromOrderedSource(
                $Kenmerken/kenmerken, 
                $ZgwZaak/kenmerken, 
                $kenmerken, 
                //kenmerken)">
                <xsl:copy-of select="zgw:WrapNullOrSkip('kenmerken', 'skip', .)"/>
            </xsl:for-each>
            <xsl:copy-of select="zgw:WrapNullOrSkip('archiefnominatie', 'null', zgw:FromOrderedSource(
                $Archiefnominatie, 
                $ZgwZaak//archiefnominatie, 
                zgw:convertZdsArchiefNominatieToZgwArchiefNominatie(string($ZdsZaak//archiefnominatie)), 
                //archiefnominatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('archiefstatus', 'skip', zgw:FromOrderedSource(
                $Archiefstatus, 
                $ZgwZaak//archiefstatus, 
                '', 
                //archiefstatus))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('archiefactiedatum', 'null', zgw:FromOrderedSource(
                $Archiefactiedatum, 
                $ZgwZaak//archiefactiedatum, 
                zgw:toZgwDate($ZdsZaak//datumVernietigingDossier), 
                //archiefactiedatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('resultaat', 'null', zgw:FromOrderedSource(
                $Resultaat, 
                $ZgwZaak//resultaat, 
                '', 
                //resultaat))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('opdrachtgevendeOrganisatie', 'empty', zgw:FromOrderedSource(
                $OpdrachtgevendeOrganisatie, 
                $ZgwZaak//opdrachtgevendeOrganisatie, 
                '', 
                //opdrachtgevendeOrganisatie))"/>
        </ZgwZaak>
	</xsl:template>

    <xsl:template match="verlenging">
        <verlenging>
            <reden><xsl:value-of select="."/></reden>
            <duur><xsl:value-of select="concat('P', concat(duur, 'D'))"/></duur> <!-- Vertaling? -->
        </verlenging>
    </xsl:template>

    <xsl:template match="opschorting">
        <opschorting>
            <indicatie><xsl:value-of select="zgw:convertZdsBooleanToZgwBoolean(.)"/></indicatie>
            <reden><xsl:value-of select="."/></reden>
        </opschorting>
    </xsl:template>

    <xsl:template match="kenmerk">
        <kenmerken>
            <kenmerk><xsl:value-of select="."/></kenmerk>
            <bron><xsl:value-of select="."/></bron>
        </kenmerken>
    </xsl:template>

    <xsl:template match="productenOfDiensten">
        <productenOfDiensten><xsl:value-of select="."/></productenOfDiensten>
    </xsl:template>
</xsl:stylesheet>