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
    <xsl:param name="Informatieobjecttype" select="''" as="xs:string" />
    <xsl:param name="Status" select="''" as="xs:string" />
    <xsl:param name="Versie" select="''" as="xs:string" />
    <xsl:param name="Ontvangstdatum" select="''" as="xs:string" />
    <xsl:param name="Verzenddatum" select="''" as="xs:string" />
    <xsl:param name="IndicatieGebruiksrecht" select="''" as="xs:string" />
    <xsl:param name="Beschrijving" select="''" as="xs:string" />
    <xsl:param name="Inhoud" select="''" as="xs:string" />
    <xsl:param name="Lock" select="''" as="xs:string" />
    <xsl:param name="Locked" select="''" as="xs:string" />
    
    <xsl:function name="zgw:convertZdsDateToZgwDate">
        <xsl:param name="dateStr"/>
        <xsl:if test="$dateStr">
            <xsl:value-of select="concat(substring($dateStr,1,4), '-', substring($dateStr,5,2), '-', substring($dateStr,7,2))"/>
        </xsl:if>
    </xsl:function>
    
    <xsl:function name="zgw:convertZgwBooleanToZdsBoolean">
        <xsl:param name="zgwBoolean"/>
        <xsl:if test="$zgwBoolean">
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
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="zgw:WrapNullOrSkip">
        <xsl:param name="elementName" as="xs:string" />
        <xsl:param name="nullable" as="xs:boolean" />
        <xsl:param name="value" />
        <xsl:choose>
            <xsl:when test="$value">
                <xsl:element name="{$elementName}"><xsl:value-of select="$value" /></xsl:element>
            </xsl:when>
            <xsl:when test="$nullable">
                <xsl:element name="{$elementName}"><xsl:attribute name="xsi:nil" select="true()"/></xsl:element>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:function>
    
    <xsl:template match="/">
        <ZgwInformatieObject>
            <xsl:copy-of select="zgw:WrapNullOrSkip('url', true(), zgw:FromOrderedSource(
                    $Url, 
                    $ZdsZaakDocumentInhoud/object/url, 
                    ZgwInformatieObject/url))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('identificatie', true(), zgw:FromOrderedSource(
                    $Identificatie, 
                    $ZdsZaakDocumentInhoud/object/identificatie, 
                    ZgwInformatieObject/identificatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('bronorganisatie', true(), zgw:FromOrderedSource(
                    $Bronorganisatie, 
                    zgw:convertZdsDateToZgwDate($ZdsZaakDocumentInhoud/object/bronorganisatie), 
                    ZgwInformatieObject/bronorganisatie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('creatiedatum', true(), zgw:FromOrderedSource(
                    $Creatiedatum, 
                    zgw:convertZdsDateToZgwDate($ZdsZaakDocumentInhoud/object/creatiedatum), 
                    ZgwInformatieObject/creatiedatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('titel', true(), zgw:FromOrderedSource(
                    $Titel, 
                    $ZdsZaakDocumentInhoud/object/titel, 
                    ZgwInformatieObject/titel))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('vertrouwelijkheidaanduiding', true(), zgw:FromOrderedSource(
                    $Vertrouwelijkheidaanduiding, 
                    lower-case($ZdsZaakDocumentInhoud/object/vertrouwelijkAanduiding), 
                    ZgwInformatieObject/vertrouwelijkheidaanduiding))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('auteur', true(), zgw:FromOrderedSource(
                    $Auteur, 
                    $ZdsZaakDocumentInhoud/object/auteur, 
                    ZgwInformatieObject/auteur))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('formaat', true(), zgw:FromOrderedSource(
                    $Formaat, 
                    $ZdsZaakDocumentInhoud/object/formaat, 
                    ZgwInformatieObject/formaat))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('taal', true(), zgw:FromOrderedSource(
                    $Taal, 
                    $ZdsZaakDocumentInhoud/object/taal, 
                    ZgwInformatieObject/taal))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('bestandsnaam', true(), zgw:FromOrderedSource(
                    $Bestandsnaam, 
                    $ZdsZaakDocumentInhoud/object/bestandsnaam, 
                    ZgwInformatieObject/bestandsnaam))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('informatieobjecttype', true(), zgw:FromOrderedSource(
                    $Informatieobjecttype, 
                    $ZgwInformatieObjectType/ZgwInformatieObjectType/url, 
                    ZgwInformatieObject/informatieobjecttype))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('status', true(), zgw:FromOrderedSource(
                    $Status, 
                    $ZdsZaakDocumentInhoud/object/status, 
                    ZgwInformatieObject/status))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('versie', true(), zgw:FromOrderedSource(
                    $Versie, 
                    $ZdsZaakDocumentInhoud/object/versie, 
                    ZgwInformatieObject/versie))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('ontvangstdatum', true(), zgw:FromOrderedSource(
                    $Ontvangstdatum, 
                    zgw:convertZdsDateToZgwDate($ZdsZaakDocumentInhoud/object/ontvangstdatum), 
                    ZgwInformatieObject/ontvangstdatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('verzenddatum', true(), zgw:FromOrderedSource(
                    $Verzenddatum, 
                    zgw:convertZdsDateToZgwDate($ZdsZaakDocumentInhoud/object/verzenddatum), 
                    ZgwInformatieObject/verzenddatum))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('indicatieGebruiksrecht', true(), zgw:FromOrderedSource(
                    $IndicatieGebruiksrecht, 
                    $ZdsZaakDocumentInhoud/object/indicatieGebruiksrecht, 
                    ZgwInformatieObject/indicatieGebruiksrecht))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('beschrijving', true(), zgw:FromOrderedSource(
                    $Beschrijving, 
                    $ZdsZaakDocumentInhoud/object/beschrijving, 
                    ZgwInformatieObject/beschrijving))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('inhoud', true(), zgw:FromOrderedSource(
                    $Inhoud, 
                    $ZdsZaakDocumentInhoud/object/inhoud, 
                    ZgwInformatieObject/inhoud))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('lock', true(), zgw:FromOrderedSource(
                    $Lock, 
                    $ZdsZaakDocumentInhoud/object/lock, 
                    ZgwInformatieObject/lock))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('locked', true(), zgw:FromOrderedSource(
                    $Locked, 
                    $ZdsZaakDocumentInhoud/object/locked, 
                    ZgwInformatieObject/locked))"/>               
        </ZgwInformatieObject>
    </xsl:template>
</xsl:stylesheet>