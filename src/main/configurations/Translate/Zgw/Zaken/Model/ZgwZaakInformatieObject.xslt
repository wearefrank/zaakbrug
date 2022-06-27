<xsl:stylesheet exclude-result-prefixes="xs xsl zgw" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="xsi"/>
    <xsl:include href="../../ZgwFunctionsBase.xslt" />

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