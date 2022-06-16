<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>

        <!-- Map -->
    <xsl:param name="ZgwEnkelvoudigInformatieObject" as="node()"><ZgwEnkelvoudigInformatieObject/></xsl:param>

        <!-- Create/Enrich -->
    <xsl:param name="ZgwZaakInformatieObject" as="node()"><ZgwEnkelvoudigInformatieObject/></xsl:param>

    <xsl:param name="Url" select="''" as="xs:string" />
    <xsl:param name="Uuid" select="''" as="xs:string" />
    <xsl:param name="Informatieobject" select="''" as="xs:string" />
    <xsl:param name="Zaak" select="''" as="xs:string" />
    <xsl:param name="AardRelatieWeergave" select="''" as="xs:string" />
    <xsl:param name="Titel" select="''" as="xs:string" />
    <xsl:param name="Beschrijving" select="''" as="xs:string" />
    <xsl:param name="Registratiedatum" select="''" as="xs:string" />
    
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
        <xsl:param name="zgwObject"/>
        <xsl:param name="zdsObject"/>
        <xsl:param name="self"/>
        <xsl:choose>
            <xsl:when test="$param">
                <xsl:value-of select="$param"/>
            </xsl:when>
            <xsl:when test="$zgwObject">
                <xsl:value-of select="$zgwObject"/>
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
        <xsl:param name="elementName" as="xs:string"/>
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
        <ZgwZaakInformatieObject>
            <xsl:copy-of select="zgw:WrapNullOrSkip('url', 'skip', zgw:FromOrderedSource(
                    $Url, 
                    $ZgwZaakInformatieObject/ZgwZaakInformatieObject/url, 
                    '', 
                    ZgwZaakInformatieObject/url))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('uuid', 'skip', zgw:FromOrderedSource(
                    $Uuid, 
                    $ZgwZaakInformatieObject/ZgwZaakInformatieObject/uuid,
                    '', 
                    ZgwZaakInformatieObject/uuid))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('informatieobject', 'skip', zgw:FromOrderedSource(
                    $Informatieobject,
                    $ZgwZaakInformatieObject/ZgwZaakInformatieObject/informatieobject,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/url, 
                    ZgwZaakInformatieObject/informatieobject))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('zaak', 'skip', zgw:FromOrderedSource(
                    $Zaak,
                    $ZgwZaakInformatieObject/ZgwZaakInformatieObject/zaak,
                    '', 
                    ZgwZaakInformatieObject/zaak))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('aardRelatieWeergave', 'skip', zgw:FromOrderedSource(
                    $AardRelatieWeergave,
                    $ZgwZaakInformatieObject/ZgwZaakInformatieObject/aardRelatieWeergave,
                    '', 
                    ZgwZaakInformatieObject/aardRelatieWeergave))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('titel', 'empty', zgw:FromOrderedSource(
                    $Titel,
                    $ZgwZaakInformatieObject/ZgwZaakInformatieObject/titel,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/titel, 
                    ZgwZaakInformatieObject/titel))"/>
            <xsl:copy-of select="zgw:WrapNullOrSkip('beschrijving', 'empty', zgw:FromOrderedSource(
                    $Beschrijving,
                    $ZgwZaakInformatieObject/ZgwZaakInformatieObject/beschrijving,
                    $ZgwEnkelvoudigInformatieObject/ZgwEnkelvoudigInformatieObject/beschrijving, 
                    ZgwZaakInformatieObject/beschrijving))"/>               
            <xsl:copy-of select="zgw:WrapNullOrSkip('registratiedatum', 'skip', zgw:FromOrderedSource(
                    $Registratiedatum,
                    $ZgwZaakInformatieObject/ZgwZaakInformatieObject/registratiedatum,
                    '', 
                    ZgwZaakInformatieObject/registratiedatum))"/>               
        </ZgwZaakInformatieObject>
    </xsl:template>
</xsl:stylesheet>