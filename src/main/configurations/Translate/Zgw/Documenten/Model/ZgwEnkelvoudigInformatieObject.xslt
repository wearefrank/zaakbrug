<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw"  version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <xsl:include href="../../ZgwFunctionsBase.xslt" />
        <!-- Map -->
    <xsl:param name="ZdsZaakDocumentInhoud" as="node()"><ZdsZaakDocumentInhoud/></xsl:param>
    <xsl:param name="ZgwInformatieObjectType" as="node()"><ZgwInformatieObjectType/></xsl:param>

        <!-- Create/Enrich -->
    <xsl:param name="ZgwEnkelvoudigInformatieObject" as="node()"><ZgwEnkelvoudigInformatieObject/></xsl:param>

    <xsl:param name="Url" select="''" as="xs:string" />
    <xsl:param name="Identificatie" select="''" as="xs:string" />
    <xsl:param name="Bronorganisatie" select="''" as="xs:string" />
    <xsl:param name="Creatiedatum" select="''" as="xs:string" />
    <xsl:param name="Titel" select="''" as="xs:string" />
    <xsl:param name="Vertrouwelijkheidaanduiding" select="''" as="xs:string" />
    <xsl:param name="Auteur" select="''" as="xs:string" />
    <xsl:param name="Formaat" select="''" as="xs:string" />
    <xsl:param name="Taal" select="''" as="xs:string" />
    <xsl:param name="Bestandsnaam" select="''" as="xs:string" />
    <xsl:param name="Bestandsomvang" select="0" as="xs:integer" />
    <xsl:param name="Link" select="''" as="xs:string" />
    <xsl:param name="Informatieobjecttype" select="''" as="xs:string" />
    <xsl:param name="Status" select="''" as="xs:string" />
    <xsl:param name="Versie" select="''" as="xs:string" />
    <xsl:param name="Ontvangstdatum" select="''" as="xs:string" />
    <xsl:param name="Verzenddatum" select="''" as="xs:string" />
    <xsl:param name="IndicatieGebruiksrecht" select="''" as="xs:string" />
    <xsl:param name="Ondertekening" as="node()"><Ondertekening/></xsl:param>
    <xsl:param name="Integriteit" as="node()"><Integriteit/></xsl:param>
    <xsl:param name="Bestandsdelen"  as="node()"><Bestandsdelen/></xsl:param>
    <xsl:param name="Beschrijving" select="''" as="xs:string" />
    <xsl:param name="Inhoud" select="''" as="xs:string" />
    <xsl:param name="Lock" select="''" as="xs:string" />
    <xsl:param name="Locked" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <ZgwEnkelvoudigInformatieObject>
            <xsl:copy-of select="zgw:WrapNullOrSkip('url', 'skip', zgw:FromOrderedSource(
                    $Url, 
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/url, 
                    $ZdsZaakDocumentInhoud/object/url, 
                    ZgwEnkelvoudigInformatieObject/url))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('identificatie', 'empty', zgw:FromOrderedSource(
                    $Identificatie, 
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/identificatie,
                    $ZdsZaakDocumentInhoud/object/identificatie, 
                    ZgwEnkelvoudigInformatieObject/identificatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('bronorganisatie', 'null', zgw:FromOrderedSource(
                    $Bronorganisatie,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/bronorganisatie,
                    zgw:toZgwDate($ZdsZaakDocumentInhoud/object/bronorganisatie), 
                    ZgwEnkelvoudigInformatieObject/bronorganisatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('creatiedatum', 'null', zgw:FromOrderedSource(
                    $Creatiedatum,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/creatiedatum,
                    zgw:toZgwDate($ZdsZaakDocumentInhoud/object/creatiedatum), 
                    ZgwEnkelvoudigInformatieObject/creatiedatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('titel', 'null', zgw:FromOrderedSource(
                    $Titel,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/titel,
                    $ZdsZaakDocumentInhoud/object/titel, 
                    ZgwEnkelvoudigInformatieObject/titel))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('vertrouwelijkheidaanduiding', 'skip', zgw:FromOrderedSource(
                    $Vertrouwelijkheidaanduiding,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/vertrouwelijkheidaanduiding,
                    lower-case($ZdsZaakDocumentInhoud/object/vertrouwelijkAanduiding), 
                    ZgwEnkelvoudigInformatieObject/vertrouwelijkheidaanduiding))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('auteur', 'null', zgw:FromOrderedSource(
                    $Auteur,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/auteur,
                    $ZdsZaakDocumentInhoud/object/auteur, 
                    ZgwEnkelvoudigInformatieObject/auteur))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('formaat', 'empty', zgw:FromOrderedSource(
                    $Formaat,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/formaat,
                    $ZdsZaakDocumentInhoud/object/formaat, 
                    ZgwEnkelvoudigInformatieObject/formaat))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('taal', 'null', zgw:FromOrderedSource(
                    $Taal,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/taal,
                    $ZdsZaakDocumentInhoud/object/taal, 
                    ZgwEnkelvoudigInformatieObject/taal))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('bestandsnaam', 'empty', zgw:FromOrderedSource(
                    $Bestandsnaam,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/bestandsnaam,
                    $ZdsZaakDocumentInhoud/object/bestandsnaam, 
                    ZgwEnkelvoudigInformatieObject/bestandsnaam))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('bestandsomvang', 'skip', zgw:FromOrderedSource(
                    $Bestandsomvang,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/bestandsomvang,
                    '', 
                    ZgwEnkelvoudigInformatieObject/bestandsomvang))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('link', 'empty', zgw:FromOrderedSource(
                    $Link,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/link,
                    '', 
                    ZgwEnkelvoudigInformatieObject/link))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('informatieobjecttype', 'null', zgw:FromOrderedSource(
                    $Informatieobjecttype,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/informatieobjecttype,
                    $ZgwInformatieObjectType/ZgwInformatieObjectType/url, 
                    ZgwEnkelvoudigInformatieObject/informatieobjecttype))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('status', 'skip', zgw:FromOrderedSource(
                    $Status,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/status,
                    zgw:toZgwDocumentStatus($ZdsZaakDocumentInhoud/object/status), 
                    ZgwEnkelvoudigInformatieObject/status))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('versie', 'skip', zgw:FromOrderedSource(
                    $Versie,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/versie,
                    $ZdsZaakDocumentInhoud/object/versie, 
                    ZgwEnkelvoudigInformatieObject/versie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('ontvangstdatum', 'null', zgw:FromOrderedSource(
                    $Ontvangstdatum,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/ontvangstdatum,
                    zgw:toZgwDate($ZdsZaakDocumentInhoud/object/ontvangstdatum), 
                    ZgwEnkelvoudigInformatieObject/ontvangstdatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('verzenddatum', 'null', zgw:FromOrderedSource(
                    $Verzenddatum,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/verzenddatum,
                    zgw:toZgwDate($ZdsZaakDocumentInhoud/object/verzenddatum), 
                    ZgwEnkelvoudigInformatieObject/verzenddatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('indicatieGebruiksrecht', 'null', zgw:FromOrderedSource(
                    $IndicatieGebruiksrecht,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/indicatieGebruiksrecht,
                    $ZdsZaakDocumentInhoud/object/indicatieGebruiksrecht, 
                    ZgwEnkelvoudigInformatieObject/indicatieGebruiksrecht))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('ondertekening', 'null', zgw:FromOrderedSource(
                    $Ondertekening,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/ondertekening,
                    '', 
                    ZgwEnkelvoudigInformatieObject/ondertekening))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('integriteit', 'null', zgw:FromOrderedSource(
                    $Integriteit,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/integriteit,
                    '', 
                    ZgwEnkelvoudigInformatieObject/integriteit))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('bestandsdelen', 'skip', zgw:FromOrderedSource(
                    $Bestandsdelen,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/bestandsdelen,
                    '', 
                    ZgwEnkelvoudigInformatieObject/bestandsdelen))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('beschrijving', 'empty', zgw:FromOrderedSource(
                    $Beschrijving,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/beschrijving,
                    $ZdsZaakDocumentInhoud/object/beschrijving, 
                    ZgwEnkelvoudigInformatieObject/beschrijving))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('inhoud', 'empty', zgw:FromOrderedSource(
                    $Inhoud,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/inhoud,
                    $ZdsZaakDocumentInhoud/object/inhoud, 
                    ZgwEnkelvoudigInformatieObject/inhoud))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('lock', 'skip', zgw:FromOrderedSource(
                    $Lock,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/lock,
                    $ZdsZaakDocumentInhoud/object/lock, 
                    ZgwEnkelvoudigInformatieObject/lock))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('locked', 'skip', zgw:FromOrderedSource(
                    $Locked,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/locked,
                    $ZdsZaakDocumentInhoud/object/locked, 
                    ZgwInformatieObject/locked))"/>               
        </ZgwEnkelvoudigInformatieObject>
    </xsl:template>
</xsl:stylesheet>