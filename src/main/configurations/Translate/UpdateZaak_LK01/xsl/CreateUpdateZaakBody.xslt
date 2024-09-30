<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:zgw="http://google.com/zgw" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="array fn map math xhtml xs err zgw" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:include href="../../Zgw/ZgwFunctionsBase.xslt" />

    <xsl:param name="ZgwZaak"/>
    <xsl:param name="Bronorganisatie" select="''" as="xs:string" />
    <xsl:param name="VerantwoordelijkeOrganisatie" select="''" as="xs:string" />

	<xsl:template match="/">
        <ZgwZaak>
            <xsl:choose>
                <xsl:when test="object/identificatie != ''"><identificatie><xsl:value-of select="object/identificatie"/></identificatie></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/identificatie != ''"><identificatie><xsl:value-of select="$ZgwZaak/ZgwZaak/identificatie"/></identificatie></xsl:when>
            </xsl:choose>
            <bronorganisatie><xsl:value-of select="$Bronorganisatie"/></bronorganisatie>
            <omschrijving><xsl:value-of select="object/omschrijving"/></omschrijving>
            <xsl:choose>
                <xsl:when test="object/toelichting != ''"><toelichting><xsl:value-of select="object/toelichting"/></toelichting></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/toelichting != ''"><toelichting><xsl:value-of select="$ZgwZaak/ZgwZaak/toelichting"/></toelichting></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/zaaktype != ''"><zaaktype><xsl:value-of select="object/zaaktype"/></zaaktype></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/zaaktype != ''"><zaaktype><xsl:value-of select="$ZgwZaak/ZgwZaak/zaaktype"/></zaaktype></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/registratiedatum != ''"><registratiedatum><xsl:value-of select="zgw:toZgwDate(object/registratiedatum)"/></registratiedatum></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/registratiedatum != ''"><registratiedatum><xsl:value-of select="$ZgwZaak/ZgwZaak/registratiedatum"/></registratiedatum></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/verantwoordelijkeOrganisatie != ''"><verantwoordelijkeOrganisatie><xsl:value-of select="object/verantwoordelijkeOrganisatie"/></verantwoordelijkeOrganisatie></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/verantwoordelijkeOrganisatie != ''"><verantwoordelijkeOrganisatie><xsl:value-of select="$ZgwZaak/ZgwZaak/verantwoordelijkeOrganisatie"/></verantwoordelijkeOrganisatie></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/startdatum != ''"><startdatum><xsl:value-of select="zgw:toZgwDate(object/startdatum)"/></startdatum></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/startdatum != ''"><startdatum><xsl:value-of select="$ZgwZaak/ZgwZaak/startdatum"/></startdatum></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/einddatumGepland != ''"><einddatumGepland><xsl:value-of select="zgw:toZgwDate(object/einddatumGepland)"/></einddatumGepland></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/einddatumGepland != ''"><einddatumGepland><xsl:value-of select="$ZgwZaak/ZgwZaak/einddatumGepland"/></einddatumGepland></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/uiterlijkeEinddatumAfdoening != ''"><uiterlijkeEinddatumAfdoening><xsl:value-of select="zgw:toZgwDate(object/uiterlijkeEinddatumAfdoening)"/></uiterlijkeEinddatumAfdoening></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/uiterlijkeEinddatumAfdoening != ''"><uiterlijkeEinddatumAfdoening><xsl:value-of select="$ZgwZaak/ZgwZaak/uiterlijkeEinddatumAfdoening"/></uiterlijkeEinddatumAfdoening></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/publicatiedatum != ''"><publicatiedatum><xsl:value-of select="zgw:toZgwDate(object/publicatiedatum)"/></publicatiedatum></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/publicatiedatum != ''"><publicatiedatum><xsl:value-of select="$ZgwZaak/ZgwZaak/publicatiedatum"/></publicatiedatum></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/communicatiekanaal != ''"><communicatiekanaal><xsl:value-of select="object/communicatiekanaal"/></communicatiekanaal></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/communicatiekanaal != ''"><communicatiekanaal><xsl:value-of select="$ZgwZaak/ZgwZaak/communicatiekanaal"/></communicatiekanaal></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/productenOfDiensten/*"><productenOfDiensten><xsl:value-of select="object/productenOfDiensten"/></productenOfDiensten></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/productenOfDiensten/*"><productenOfDiensten><xsl:value-of select="$ZgwZaak/ZgwZaak/productenOfDiensten"/></productenOfDiensten></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/vertrouwelijkheidaanduiding != ''"><vertrouwelijkheidaanduiding><xsl:value-of select="object/vertrouwelijkheidaanduiding"/></vertrouwelijkheidaanduiding></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/vertrouwelijkheidaanduiding != ''"><vertrouwelijkheidaanduiding><xsl:value-of select="$ZgwZaak/ZgwZaak/vertrouwelijkheidaanduiding"/></vertrouwelijkheidaanduiding></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/betalingsIndicatie != ''">
                    <betalingsindicatie><xsl:value-of select="zgw:convertZdsBetalingsIndicatieToZgwBetalingsIndicatie(/object/betalingsIndicatie)"/></betalingsindicatie>
                </xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/betalingsindicatie != ''">
                    <betalingsindicatie><xsl:value-of select="$ZgwZaak/ZgwZaak/betalingsindicatie"/></betalingsindicatie>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/zaakgeometrie) gt 0"><xsl:copy-of select="object/zaakgeometrie"/></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/zaakgeometrie) gt 0"><xsl:copy-of select="$ZgwZaak/ZgwZaak/zaakgeometrie"/></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/verlenging/reden != '' and object/verlenging/duur != '0'">
                    <verlenging>
                        <reden><xsl:value-of select="object/verlenging/reden"/></reden>
                        <duur><xsl:value-of select="concat('P', object/verlenging/duur, 'D')"/></duur>
                    </verlenging>
                </xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/verlenging) gt 0"><xsl:copy-of select="$ZgwZaak/ZgwZaak/verlenging"/></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(*:object/*:opschorting/*:indicatie) gt 0 and string-length(*:object/*:opschorting/*:reden) gt 0">
                    <opschorting>
                        <indicatie><xsl:value-of select="zgw:convertZdsBooleanToZgwBoolean(*:object/*:opschorting/*:indicatie)"/></indicatie>
                        <reden><xsl:value-of select="*:object/*:opschorting/*:reden"/></reden>
                    </opschorting>
                </xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/opschorting/indicatie) gt 0 and string-length($ZgwZaak/ZgwZaak/opschorting/reden) gt 0">
                    <opschorting>
                        <indicatie><xsl:value-of select="$ZgwZaak/ZgwZaak/opschorting/indicatie"/></indicatie>
                        <reden><xsl:value-of select="$ZgwZaak/ZgwZaak/opschorting/reden"/></reden>
                    </opschorting>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/selectielijstklasse != ''"><selectielijstklasse><xsl:value-of select="object/selectielijstklasse"/></selectielijstklasse></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/selectielijstklasse != ''"><selectielijstklasse><xsl:value-of select="$ZgwZaak/ZgwZaak/selectielijstklasse"/></selectielijstklasse></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/hoofdzaak != ''"><hoofdzaak><xsl:value-of select="object/hoofdzaak"/></hoofdzaak></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/hoofdzaak != ''"><hoofdzaak><xsl:value-of select="$ZgwZaak/ZgwZaak/hoofdzaak"/></hoofdzaak></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/relevanteAndereZaken) gt 0"><xsl:copy-of select="object/relevanteAndereZaken"/></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/relevanteAndereZaken) gt 0"><xsl:copy-of select="$ZgwZaak/ZgwZaak/relevanteAndereZaken"/></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/kenmerk/*">
                    <xsl:apply-templates select="object/kenmerk" />
                </xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/kenmerken"><xsl:copy-of select="$ZgwZaak/ZgwZaak/kenmerken"/></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/archiefnominatie != ''"><archiefnominatie><xsl:value-of select="zgw:convertZdsArchiefNominatieToZgwArchiefNominatie(object/archiefnominatie)"/></archiefnominatie></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/archiefnominatie != ''"><archiefnominatie><xsl:value-of select="$ZgwZaak/ZgwZaak/archiefnominatie"/></archiefnominatie></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/archiefstatus != ''"><archiefstatus><xsl:value-of select="object/archiefstatus"/></archiefstatus></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/archiefstatus != ''"><archiefstatus><xsl:value-of select="$ZgwZaak/ZgwZaak/archiefstatus"/></archiefstatus></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/archiefactiedatum != ''"><archiefactiedatum><xsl:value-of select="zgw:toZgwDate(object/archiefactiedatum)"/></archiefactiedatum></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/archiefactiedatum != ''"><archiefactiedatum><xsl:value-of select="$ZgwZaak/ZgwZaak/archiefactiedatum"/></archiefactiedatum></xsl:when>
            </xsl:choose>
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