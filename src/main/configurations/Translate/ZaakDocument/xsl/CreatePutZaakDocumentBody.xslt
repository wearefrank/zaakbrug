<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://www.wearefrank.nl/zgw"  version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <xsl:include href="../../Zgw/ZgwFunctionsBase.xslt" />
        <!-- Map -->
    <xsl:param name="DecodeInhoudResult"/>
    <xsl:param name="ZgwInformatieObjectType" as="node()"><ZgwInformatieObjectType/></xsl:param>

        <!-- Create/Enrich -->
    <xsl:param name="ZgwEnkelvoudigInformatieObject" as="node()"><ZgwEnkelvoudigInformatieObject/></xsl:param>

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
    <xsl:param name="Beschrijving" select="''" as="xs:string" />
    <xsl:param name="Inhoud" select="''" as="xs:string" />
    <xsl:param name="Lock" select="''" as="xs:string" />
    
    <xsl:template match="/">
        <ZgwEnkelvoudigInformatieObject>
                <xsl:copy-of select="zgw:WrapNullOrSkip('identificatie', 'skip', zgw:FromOrderedSource(
                    $Identificatie, 
                    '',
                    '', 
                    object/identificatie))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('bronorganisatie', 'empty', zgw:FromOrderedSource(
                    $Bronorganisatie,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/bronorganisatie,
                    '', 
                    ''))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('creatiedatum', 'empty', zgw:FromOrderedSource(
                    $Creatiedatum,
                    '',
                    '', 
                    zgw:toZgwDate(object/creatiedatum)))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('titel', 'empty', zgw:FromOrderedSource(
                    $Titel,
                    '',
                    '', 
                    object/titel))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('vertrouwelijkheidaanduiding', 'skip', zgw:FromOrderedSource(
                    $Vertrouwelijkheidaanduiding,
                    '',
                    '', 
                    lower-case(object/vertrouwelijkAanduiding)))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('auteur', 'empty', zgw:FromOrderedSource(
                    $Auteur,
                    '',
                    '', 
                    object/auteur))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('formaat', 'skip', zgw:FromOrderedSource(
                    $Formaat,
                    '',
                    object/inhoud/@contentType, 
                    concat('application/', object/formaat)))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('taal', 'empty', zgw:FromOrderedSource(
                    $Taal,
                    '',
                    '', 
                    lower-case(object/taal)))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('bestandsnaam', 'skip', zgw:FromOrderedSource(
                    $Bestandsnaam,
                    '',
                    '', 
                    object/inhoud/@bestandsnaam))"/>
                <!-- <xsl:copy-of select="zgw:WrapNullOrSkip('bestandsomvang', 'skip', zgw:FromOrderedSource(
                    string-length($DecodeInhoudResult),
                    '',
                    '', 
                    ''))"/> -->
                <xsl:copy-of select="zgw:WrapNullOrSkip('link', 'skip', zgw:FromOrderedSource(
                    $Link,
                    '',
                    '', 
                    object/link))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('informatieobjecttype', 'empty', zgw:FromOrderedSource(
                    $Informatieobjecttype,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/informatieobjecttype,
                    '', 
                    ''))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('status', 'skip', zgw:FromOrderedSource(
                    $Status,
                    '',
                    '', 
                    zgw:toZgwDocumentStatus(object/status)))"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('versie', 'skip', zgw:FromOrderedSource(
                    $Versie,
                    '',
                    '', 
                    object/versie))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('ontvangstdatum', 'null', zgw:FromOrderedSource(
                    $Ontvangstdatum,
                    '',
                    '', 
                    zgw:toZgwDate(object/ontvangstdatum)))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('verzenddatum', 'null', zgw:FromOrderedSource(
                    $Verzenddatum,
                    '',
                    '', 
                    zgw:toZgwDate(object/verzenddatum)))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('indicatieGebruiksrecht', 'null', zgw:FromOrderedSource(
                    $IndicatieGebruiksrecht,
                    '',
                    '', 
                    object/indicatieGebruiksrecht))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('ondertekening', 'skip', zgw:FromOrderedSource(
                    $Ondertekening,
                    '',
                    '', 
                    object/ondertekening))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('integriteit', 'skip', zgw:FromOrderedSource(
                    $Integriteit,
                    '',
                    '', 
                    object/integriteit))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('beschrijving', 'skip', zgw:FromOrderedSource(
                    $Beschrijving,
                    '',
                    '', 
                    object/beschrijving))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('inhoud', 'null', zgw:FromOrderedSource(
                    $Inhoud,
                    '',
                    '', 
                    object/inhoud))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('lock', 'skip', zgw:FromOrderedSource(
                    $Lock,
                    '',
                    '', 
                    object/lock))"/>            
        </ZgwEnkelvoudigInformatieObject>
    </xsl:template>
</xsl:stylesheet>