<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" xmlns:xsi="http://w3.org/2001/XMLSchema-instance" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>

    <xsl:param name="ZdsZaakDocumentInhoud" select="node()"/>
    <xsl:param name="ZgwInformatieObjectType" select="node()"/>

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
    <xsl:param name="Bestandsomvang" select="''" as="xs:string" />
    <xsl:param name="Link" select="''" as="xs:string" />
    <xsl:param name="Informatieobjecttype" select="''" as="xs:string" />
    <xsl:param name="Status" select="''" as="xs:string" />
    <xsl:param name="Versie" select="''" as="xs:string" />
    <xsl:param name="Ontvangstdatum" select="''" as="xs:string" />
    <xsl:param name="Verzenddatum" select="''" as="xs:string" />
    <xsl:param name="IndicatieGebruiksrecht" select="''" as="xs:string" />
    <xsl:param name="Ondertekening" select="node()" as="node()" />
    <xsl:param name="Integriteit" select="node()" as="node()" />
    <xsl:param name="Bestandsdelen" select="node()" as="node()" />
    <xsl:param name="Beschrijving" select="''" as="xs:string" />
    <xsl:param name="Inhoud" select="''" as="xs:string" />
    <xsl:param name="Lock" select="''" as="xs:string" />
    <xsl:param name="Locked" select="''" as="xs:string" />
    
    <xsl:function name="zgw:convertZdsDateToZgwDate">
        <xsl:param name="dateStr"/>
        <xsl:if test="string-length($dateStr) > 0">
            <xsl:value-of select="concat(substring($dateStr,1,4), '-', substring($dateStr,5,2), '-', substring($dateStr,7,2))"/>
        </xsl:if>
    </xsl:function>

    <xsl:function name="zgw:toZgwDocumentStatus">
        <xsl:param name="status"/>
        <xsl:if test="string-length($status) > 0">
            <xsl:variable name="transformed" as="xs:string" select="lower-case(replace($status, ' ', '_'))"/>    
            <xsl:choose>
                <xsl:when test="$transformed = 'in_bewerking' or $transformed = 'ter_vaststelling' or $transformed = 'definitief' or $transformed = 'gearchiveerd'">
                    <xsl:value-of select="$transformed"/>
                </xsl:when>
                <xsl:otherwise />
            </xsl:choose>
        </xsl:if>
    </xsl:function>
    
    <xsl:function name="zgw:convertZgwBooleanToZdsBoolean">
        <xsl:param name="zgwBoolean"/>
        <xsl:if test="string-length($zgwBoolean) > 0">
            <xsl:choose>
                <xsl:when test="lower-case($zgwBoolean)='true'">J</xsl:when>
                <xsl:when test="lower-case($zgwBoolean)='false'">N</xsl:when>
                <xsl:otherwise>invalid character</xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>
    
    <xsl:function name="zgw:FromOrderedSource">
        <xsl:param name="param"/>
        <xsl:param name="zdsObject"/>
        <xsl:param name="self"/>
        <xsl:choose>
            <xsl:when test="$param">
                <xsl:value-of select="$param"/>
            </xsl:when>
            <xsl:when test="$zdsObject">
                <xsl:value-of select="$zdsObject"/>
            </xsl:when>
            <xsl:when test="$self">
                <xsl:value-of select="$self"/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="zgw:WrapNullOrSkip" as="node()*">
        <xsl:param name="elementName" as="xs:string" />
        <xsl:param name="mode" as="xs:string" />
        <xsl:param name="value" />
        <xsl:choose>
            <xsl:when test="string-length($value) > 0">
                <xsl:element name="{$elementName}"><xsl:copy-of select="$value" /></xsl:element>
            </xsl:when>
            <xsl:when test="$mode = 'null'">
                <xsl:element name="{$elementName}"><xsl:attribute name="xsi:nil" select="true()"/></xsl:element>
            </xsl:when>
            <xsl:when test="$mode = 'empty'">
                <xsl:element name="{$elementName}" />
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:function>
    
    <xsl:template match="/">
        <ZgwEnkelvoudigInformatieObject>
            <xsl:copy-of select="zgw:WrapNullOrSkip('url', 'null', zgw:FromOrderedSource(
                    $Url, 
                    $ZdsZaakDocumentInhoud/object/url, 
                    ZgwEnkelvoudigInformatieObject/url))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('identificatie', 'empty', zgw:FromOrderedSource(
                    $Identificatie, 
                    $ZdsZaakDocumentInhoud/object/identificatie, 
                    ZgwEnkelvoudigInformatieObject/identificatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('bronorganisatie', 'null', zgw:FromOrderedSource(
                    $Bronorganisatie, 
                    zgw:convertZdsDateToZgwDate($ZdsZaakDocumentInhoud/object/bronorganisatie), 
                    ZgwEnkelvoudigInformatieObject/bronorganisatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('creatiedatum', 'null', zgw:FromOrderedSource(
                    $Creatiedatum, 
                    zgw:convertZdsDateToZgwDate($ZdsZaakDocumentInhoud/object/creatiedatum), 
                    ZgwEnkelvoudigInformatieObject/creatiedatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('titel', 'null', zgw:FromOrderedSource(
                    $Titel, 
                    $ZdsZaakDocumentInhoud/object/titel, 
                    ZgwEnkelvoudigInformatieObject/titel))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('vertrouwelijkheidaanduiding', 'skip', zgw:FromOrderedSource(
                    $Vertrouwelijkheidaanduiding, 
                    lower-case($ZdsZaakDocumentInhoud/object/vertrouwelijkAanduiding), 
                    ZgwEnkelvoudigInformatieObject/vertrouwelijkheidaanduiding))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('auteur', 'null', zgw:FromOrderedSource(
                    $Auteur, 
                    $ZdsZaakDocumentInhoud/object/auteur, 
                    ZgwEnkelvoudigInformatieObject/auteur))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('formaat', 'empty', zgw:FromOrderedSource(
                    $Formaat, 
                    $ZdsZaakDocumentInhoud/object/formaat, 
                    ZgwEnkelvoudigInformatieObject/formaat))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('taal', 'null', zgw:FromOrderedSource(
                    $Taal, 
                    $ZdsZaakDocumentInhoud/object/taal, 
                    ZgwEnkelvoudigInformatieObject/taal))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('bestandsnaam', 'empty', zgw:FromOrderedSource(
                    $Bestandsnaam, 
                    $ZdsZaakDocumentInhoud/object/bestandsnaam, 
                    ZgwEnkelvoudigInformatieObject/bestandsnaam))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('bestandsomvang', 'null', zgw:FromOrderedSource(
                    $Bestandsomvang, 
                    '', 
                    ZgwEnkelvoudigInformatieObject/bestandsomvang))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('link', 'empty', zgw:FromOrderedSource(
                    $Link, 
                    '', 
                    ZgwEnkelvoudigInformatieObject/link))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('informatieobjecttype', 'null', zgw:FromOrderedSource(
                    $Informatieobjecttype, 
                    $ZgwInformatieObjectType/ZgwInformatieObjectType/url, 
                    ZgwEnkelvoudigInformatieObject/informatieobjecttype))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('status', 'null', zgw:FromOrderedSource(
                    $Status, 
                    zgw:toZgwDocumentStatus($ZdsZaakDocumentInhoud/object/status), 
                    ZgwEnkelvoudigInformatieObject/status))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('versie', 'null', zgw:FromOrderedSource(
                    $Versie, 
                    $ZdsZaakDocumentInhoud/object/versie, 
                    ZgwEnkelvoudigInformatieObject/versie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('ontvangstdatum', 'null', zgw:FromOrderedSource(
                    $Ontvangstdatum, 
                    zgw:convertZdsDateToZgwDate($ZdsZaakDocumentInhoud/object/ontvangstdatum), 
                    ZgwEnkelvoudigInformatieObject/ontvangstdatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('verzenddatum', 'null', zgw:FromOrderedSource(
                    $Verzenddatum, 
                    zgw:convertZdsDateToZgwDate($ZdsZaakDocumentInhoud/object/verzenddatum), 
                    ZgwEnkelvoudigInformatieObject/verzenddatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('indicatieGebruiksrecht', 'null', zgw:FromOrderedSource(
                    $IndicatieGebruiksrecht, 
                    $ZdsZaakDocumentInhoud/object/indicatieGebruiksrecht, 
                    ZgwEnkelvoudigInformatieObject/indicatieGebruiksrecht))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('ondertekening', 'null', zgw:FromOrderedSource(
                    $Ondertekening, 
                    '', 
                    ZgwEnkelvoudigInformatieObject/ondertekening))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('integriteit', 'null', zgw:FromOrderedSource(
                    $Integriteit, 
                    '', 
                    ZgwEnkelvoudigInformatieObject/integriteit))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('bestandsdelen', 'skip', zgw:FromOrderedSource(
                    $Bestandsdelen, 
                    '', 
                    ZgwEnkelvoudigInformatieObject/bestandsdelen))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('beschrijving', 'null', zgw:FromOrderedSource(
                    $Beschrijving, 
                    $ZdsZaakDocumentInhoud/object/beschrijving, 
                    ZgwEnkelvoudigInformatieObject/beschrijving))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('inhoud', 'empty', zgw:FromOrderedSource(
                    $Inhoud, 
                    $ZdsZaakDocumentInhoud/object/inhoud, 
                    ZgwEnkelvoudigInformatieObject/inhoud))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('lock', 'skip', zgw:FromOrderedSource(
                    $Lock, 
                    $ZdsZaakDocumentInhoud/object/lock, 
                    ZgwEnkelvoudigInformatieObject/lock))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('locked', 'skip', zgw:FromOrderedSource(
                    $Locked, 
                    $ZdsZaakDocumentInhoud/object/locked, 
                    ZgwInformatieObject/locked))"/>               
        </ZgwEnkelvoudigInformatieObject>
    </xsl:template>
</xsl:stylesheet>