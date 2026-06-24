<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:zgw="http://www.wearefrank.nl/zgw" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="array fn map math xhtml xs err zgw" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:include href="../../Zgw/ZgwFunctionsBase.xslt" />

    <xsl:param name="ZgwZaak"/>
    <xsl:param name="Bronorganisatie" select="''" as="xs:string" />
    <xsl:param name="VerantwoordelijkeOrganisatie" select="''" as="xs:string" />

	<xsl:template match="/">
        <ZgwZaak>
            <xsl:if test="object/identificatie != ''"><identificatie><xsl:value-of select="object/identificatie"/></identificatie></xsl:if>
            <bronorganisatie><xsl:value-of select="$Bronorganisatie"/></bronorganisatie>
            <omschrijving><xsl:value-of select="object/omschrijving"/></omschrijving>
            <xsl:if test="object/toelichting != ''"><toelichting><xsl:value-of select="object/toelichting"/></toelichting></xsl:if>
            <xsl:if test="object/zaaktype != ''"><zaaktype><xsl:value-of select="object/zaaktype"/></zaaktype></xsl:if>
            <xsl:if test="object/registratiedatum != ''"><registratiedatum><xsl:value-of select="zgw:toZgwDate(object/registratiedatum)"/></registratiedatum></xsl:if>
            <xsl:if test="object/verantwoordelijkeOrganisatie != ''"><verantwoordelijkeOrganisatie><xsl:value-of select="object/verantwoordelijkeOrganisatie"/></verantwoordelijkeOrganisatie></xsl:if>
            <xsl:if test="object/startdatum != ''"><startdatum><xsl:value-of select="zgw:toZgwDate(object/startdatum)"/></startdatum></xsl:if>
            <xsl:if test="object/einddatumGepland != ''"><einddatumGepland><xsl:value-of select="zgw:toZgwDate(object/einddatumGepland)"/></einddatumGepland></xsl:if>
            <xsl:if test="object/uiterlijkeEinddatumAfdoening != ''"><uiterlijkeEinddatumAfdoening><xsl:value-of select="zgw:toZgwDate(object/uiterlijkeEinddatumAfdoening)"/></uiterlijkeEinddatumAfdoening></xsl:if>
            <xsl:if test="object/publicatiedatum != ''"><publicatiedatum><xsl:value-of select="zgw:toZgwDate(object/publicatiedatum)"/></publicatiedatum></xsl:if>
            <xsl:if test="object/communicatiekanaal != ''"><communicatiekanaal><xsl:value-of select="object/communicatiekanaal"/></communicatiekanaal></xsl:if>
            <xsl:if test="object/productenOfDiensten/*"><productenOfDiensten><xsl:value-of select="object/productenOfDiensten"/></productenOfDiensten></xsl:if>
            <xsl:if test="object/vertrouwelijkheidaanduiding != ''"><vertrouwelijkheidaanduiding><xsl:value-of select="object/vertrouwelijkheidaanduiding"/></vertrouwelijkheidaanduiding></xsl:if>
            <xsl:if test="object/betalingsIndicatie != ''">
                <betalingsindicatie><xsl:value-of select="zgw:convertZdsBetalingsIndicatieToZgwBetalingsIndicatie(/object/betalingsIndicatie)"/></betalingsindicatie>
            </xsl:if>
            <xsl:if test="string-length(object/zaakgeometrie) gt 0"><xsl:copy-of select="object/zaakgeometrie"/></xsl:if>
            <xsl:if test="object/verlenging/reden != '' and object/verlenging/duur != '0'">
                <verlenging>
                    <reden><xsl:value-of select="object/verlenging/reden"/></reden>
                    <duur><xsl:value-of select="concat('P', object/verlenging/duur, 'D')"/></duur>
                </verlenging>
            </xsl:if>
            <xsl:if test="string-length(*:object/*:opschorting/*:indicatie) gt 0 and string-length(*:object/*:opschorting/*:reden) gt 0">
                <opschorting>
                    <indicatie><xsl:value-of select="zgw:convertZdsBooleanToZgwBoolean(*:object/*:opschorting/*:indicatie)"/></indicatie>
                    <reden><xsl:value-of select="*:object/*:opschorting/*:reden"/></reden>
                </opschorting>
            </xsl:if>
            <xsl:if test="object/selectielijstklasse != ''"><selectielijstklasse><xsl:value-of select="object/selectielijstklasse"/></selectielijstklasse></xsl:if>
            <xsl:if test="object/hoofdzaak != ''"><hoofdzaak><xsl:value-of select="object/hoofdzaak"/></hoofdzaak></xsl:if>
            <xsl:if test="object/kenmerk/*">
                <xsl:apply-templates select="object/kenmerk" />
            </xsl:if>
            <xsl:if test="object/archiefnominatie != ''"><archiefnominatie><xsl:value-of select="zgw:convertZdsArchiefNominatieToZgwArchiefNominatie(object/archiefnominatie)"/></archiefnominatie></xsl:if>
            <xsl:if test="object/archiefstatus != ''"><archiefstatus><xsl:value-of select="object/archiefstatus"/></archiefstatus></xsl:if>
            <xsl:if test="object/archiefactiedatum != ''"><archiefactiedatum><xsl:value-of select="zgw:toZgwDate(object/archiefactiedatum)"/></archiefactiedatum></xsl:if>
        </ZgwZaak>
	</xsl:template>

    <xsl:template match="object/kenmerk">
        <xsl:if test="kenmerk != '' and bron != ''">
            <kenmerken>
                <kenmerk><xsl:value-of select="kenmerk"/></kenmerk>
                <bron><xsl:value-of select="bron"/></bron>
            </kenmerken>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>