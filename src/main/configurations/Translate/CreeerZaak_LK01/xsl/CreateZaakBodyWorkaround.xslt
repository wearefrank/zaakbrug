<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:zgw="http://www.wearefrank.nl/zgw" exclude-result-prefixes="array fn map math xhtml xs err zgw" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:include href="../../Zgw/ZgwFunctionsBase.xslt" />

    <xsl:param name="ZgwZaak"/>
    <xsl:param name="VerantwoordelijkeOrganisatie" select="''" as="xs:string" />

	<xsl:template match="/">
        <ZgwZaak>
            <xsl:choose>
                <xsl:when test="string-length(object/identificatie) > 0"><identificatie><xsl:value-of select="object/identificatie"/></identificatie></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/identificatie) > 0"><identificatie><xsl:value-of select="$ZgwZaak/ZgwZaak/identificatie"/></identificatie></xsl:when>
            </xsl:choose>
            <xsl:if test="string-length($ZgwZaak/ZgwZaak/bronorganisatie) > 0"><bronorganisatie><xsl:value-of select="$ZgwZaak/ZgwZaak/bronorganisatie"/></bronorganisatie></xsl:if>
            <xsl:if test="string-length($ZgwZaak/ZgwZaak/omschrijving) > 0"><omschrijving><xsl:value-of select="$ZgwZaak/ZgwZaak/omschrijving"/></omschrijving></xsl:if>
            <xsl:choose>
                <xsl:when test="string-length(object/toelichting) > 0"><toelichting><xsl:value-of select="object/toelichting"/></toelichting></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/toelichting) > 0"><toelichting><xsl:value-of select="$ZgwZaak/ZgwZaak/toelichting"/></toelichting></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/zaaktype) > 0"><zaaktype><xsl:value-of select="object/zaaktype"/></zaaktype></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/zaaktype) > 0"><zaaktype><xsl:value-of select="$ZgwZaak/ZgwZaak/zaaktype"/></zaaktype></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/registratiedatum) > 0"><registratiedatum><xsl:value-of select="zgw:toZgwDate(object/registratiedatum)"/></registratiedatum></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/registratiedatum) > 0"><registratiedatum><xsl:value-of select="$ZgwZaak/ZgwZaak/registratiedatum"/></registratiedatum></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/verantwoordelijkeOrganisatie) > 0"><verantwoordelijkeOrganisatie><xsl:value-of select="object/verantwoordelijkeOrganisatie"/></verantwoordelijkeOrganisatie></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/verantwoordelijkeOrganisatie) > 0"><verantwoordelijkeOrganisatie><xsl:value-of select="$ZgwZaak/ZgwZaak/verantwoordelijkeOrganisatie"/></verantwoordelijkeOrganisatie></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/startdatum) > 0"><startdatum><xsl:value-of select="zgw:toZgwDate(object/startdatum)"/></startdatum></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/startdatum) > 0"><startdatum><xsl:value-of select="$ZgwZaak/ZgwZaak/startdatum"/></startdatum></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/einddatumGepland) > 0"><einddatumGepland><xsl:value-of select="zgw:toZgwDate(object/einddatumGepland)"/></einddatumGepland></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/einddatumGepland) > 0"><einddatumGepland><xsl:value-of select="$ZgwZaak/ZgwZaak/einddatumGepland"/></einddatumGepland></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/uiterlijkeEinddatumAfdoening) > 0"><uiterlijkeEinddatumAfdoening><xsl:value-of select="zgw:toZgwDate(object/uiterlijkeEinddatumAfdoening)"/></uiterlijkeEinddatumAfdoening></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/uiterlijkeEinddatumAfdoening) > 0"><uiterlijkeEinddatumAfdoening><xsl:value-of select="$ZgwZaak/ZgwZaak/uiterlijkeEinddatumAfdoening"/></uiterlijkeEinddatumAfdoening></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/publicatiedatum) > 0"><publicatiedatum><xsl:value-of select="zgw:toZgwDate(object/publicatiedatum)"/></publicatiedatum></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/publicatiedatum) > 0"><publicatiedatum><xsl:value-of select="$ZgwZaak/ZgwZaak/publicatiedatum"/></publicatiedatum></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/communicatiekanaal) > 0"><communicatiekanaal><xsl:value-of select="object/communicatiekanaal"/></communicatiekanaal></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/communicatiekanaal) > 0"><communicatiekanaal><xsl:value-of select="$ZgwZaak/ZgwZaak/communicatiekanaal"/></communicatiekanaal></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/productenOfDiensten/*"><productenOfDiensten><xsl:value-of select="object/productenOfDiensten"/></productenOfDiensten></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/productenOfDiensten/*"><productenOfDiensten><xsl:value-of select="$ZgwZaak/ZgwZaak/productenOfDiensten"/></productenOfDiensten></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/vertrouwelijkheidaanduiding) > 0"><vertrouwelijkheidaanduiding><xsl:value-of select="object/vertrouwelijkheidaanduiding"/></vertrouwelijkheidaanduiding></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/vertrouwelijkheidaanduiding) > 0"><vertrouwelijkheidaanduiding><xsl:value-of select="$ZgwZaak/ZgwZaak/vertrouwelijkheidaanduiding"/></vertrouwelijkheidaanduiding></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/betalingsIndicatie) > 0">
                    <betalingsindicatie><xsl:value-of select="zgw:convertZdsBetalingsIndicatieToZgwBetalingsIndicatie(/object/betalingsIndicatie)"/></betalingsindicatie>
                </xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/betalingsindicatie) > 0">
                    <betalingsindicatie><xsl:value-of select="$ZgwZaak/ZgwZaak/betalingsindicatie"/></betalingsindicatie>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/zaakgeometrie) > 0"><xsl:copy-of select="object/zaakgeometrie"/></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/zaakgeometrie) > 0"><xsl:copy-of select="$ZgwZaak/ZgwZaak/zaakgeometrie"/></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/verlenging/reden) > 0 and object/verlenging/duur != '0'">
                    <verlenging>
                        <reden><xsl:value-of select="object/verlenging/reden"/></reden>
                        <duur><xsl:value-of select="concat('P', object/verlenging/duur, 'D')"/></duur>
                    </verlenging>
                </xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/verlenging) > 0"><xsl:copy-of select="$ZgwZaak/ZgwZaak/verlenging"/></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/opschorting) > 0">
                    <opschorting>
                        <indicatie><xsl:value-of select="zgw:convertZdsBooleanToZgwBoolean(object/opschorting/indicatie)"/></indicatie>
                        <xsl:choose>
                            <xsl:when test="string-length(object/opschorting/reden) > 0"><reden><xsl:value-of select="object/opschorting/reden"/></reden></xsl:when>
                            <xsl:otherwise><reden/></xsl:otherwise>
                        </xsl:choose>
                    </opschorting>
                </xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/opschorting) > 0">
                    <opschorting>
                        <indicatie><xsl:value-of select="$ZgwZaak/ZgwZaak/opschorting/indicatie"/></indicatie>
                        <xsl:choose>
                            <xsl:when test="string-length($ZgwZaak/ZgwZaak/opschorting/reden) > 0"><reden><xsl:value-of select="$ZgwZaak/ZgwZaak/opschorting/reden"/></reden></xsl:when>
                            <xsl:otherwise><reden/></xsl:otherwise>
                        </xsl:choose>
                    </opschorting>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/selectielijstklasse) > 0"><selectielijstklasse><xsl:value-of select="object/selectielijstklasse"/></selectielijstklasse></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/selectielijstklasse) > 0"><selectielijstklasse><xsl:value-of select="$ZgwZaak/ZgwZaak/selectielijstklasse"/></selectielijstklasse></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/hoofdzaak) > 0"><hoofdzaak><xsl:value-of select="object/hoofdzaak"/></hoofdzaak></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/hoofdzaak) > 0"><hoofdzaak><xsl:value-of select="$ZgwZaak/ZgwZaak/hoofdzaak"/></hoofdzaak></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/relevanteAndereZaken/*"><xsl:copy-of select="object/relevanteAndereZaken"/></xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/relevanteAndereZaken/*"><xsl:copy-of select="$ZgwZaak/ZgwZaak/relevanteAndereZaken"/></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="object/kenmerk/*">
                    <xsl:apply-templates select="object/kenmerk" />
                </xsl:when>
                <xsl:when test="$ZgwZaak/ZgwZaak/kenmerken/*"><xsl:copy-of select="$ZgwZaak/ZgwZaak/kenmerken"/></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/archiefnominatie) > 0"><archiefnominatie><xsl:value-of select="zgw:convertZdsArchiefNominatieToZgwArchiefNominatie(object/archiefnominatie)"/></archiefnominatie></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/archiefnominatie) > 0"><archiefnominatie><xsl:value-of select="$ZgwZaak/ZgwZaak/archiefnominatie"/></archiefnominatie></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/archiefstatus) > 0"><archiefstatus><xsl:value-of select="object/archiefstatus"/></archiefstatus></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/archiefstatus) > 0"><archiefstatus><xsl:value-of select="$ZgwZaak/ZgwZaak/archiefstatus"/></archiefstatus></xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="string-length(object/archiefactiedatum) > 0"><archiefactiedatum><xsl:value-of select="zgw:toZgwDate(object/archiefactiedatum)"/></archiefactiedatum></xsl:when>
                <xsl:when test="string-length($ZgwZaak/ZgwZaak/archiefactiedatum) > 0"><archiefactiedatum><xsl:value-of select="$ZgwZaak/ZgwZaak/archiefactiedatum"/></archiefactiedatum></xsl:when>
            </xsl:choose>
        </ZgwZaak>
	</xsl:template>

    <xsl:template match="object/kenmerk">
        <xsl:if test="string-length(kenmerk) > 0 and string-length(bron) > 0">
            <kenmerken>
                <kenmerk><xsl:value-of select="kenmerk"/></kenmerk>
                <bron><xsl:value-of select="bron"/></bron>
            </kenmerken>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>