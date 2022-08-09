<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:zgw="http://google.com/zgw" exclude-result-prefixes="array fn map math xhtml xs err zgw" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="GetRsinResult"/>
    <xsl:param name="GetZaakTypeResult"/>
    <xsl:param name="communicatiekanaal" select="''" as="xs:string"/>
    <xsl:param name="productenOfDiensten" select="''" as="xs:string"/>
    <xsl:param name="GetResultaattypeResult"/>
    <xsl:param name="selectielijstklasse" select="''" as="xs:string"/>
    <xsl:param name="hoofdzaak" select="''" as="xs:string"/>
    <xsl:param name="relevanteAndereZaken" select="''" as="xs:string"/> 
    <xsl:param name="archiefstatus" select="''" as="xs:string"/>

    <xsl:template match="/">
        <xsl:apply-templates select="zakLk01/object[@entiteittype='ZAK']"/>
    </xsl:template>
    
	<xsl:template match="zakLk01/object[@entiteittype='ZAK']">
		<ZgwZaak>
            <identificatie><xsl:value-of select="identificatie"/></identificatie>
            <bronorganisatie><xsl:value-of select="$GetRsinResult/rsin"/></bronorganisatie>
            <omschrijving><xsl:value-of select="omschrijving"/></omschrijving>
            <toelichting><xsl:value-of select="toelichting"/></toelichting>
            <zaaktype><xsl:value-of select="$GetZaakTypeResult/ZgwZaakType/url"/></zaaktype>
            <xsl:if test="string-length(registratiedatum) > 0">
                <registratiedatum><xsl:value-of select="zgw:convertZdsDateToZgwDate(registratiedatum)"/></registratiedatum>
            </xsl:if>
            <verantwoordelijkeOrganisatie><xsl:value-of select="$GetRsinResult/rsin"/></verantwoordelijkeOrganisatie>
            <xsl:if test="string-length(startdatum) > 0">
                <startdatum><xsl:value-of select="zgw:convertZdsDateToZgwDate(startdatum)"/></startdatum>
            </xsl:if>
            <xsl:if test="string-length(einddatumGepland) > 0">
                <einddatumGepland><xsl:value-of select="zgw:convertZdsDateToZgwDate(einddatumGepland)"/></einddatumGepland>
            </xsl:if>
            <xsl:if test="string-length(uiterlijkeEinddatum) > 0">
                <uiterlijkeEinddatumAfdoening><xsl:value-of select="zgw:convertZdsDateToZgwDate(uiterlijkeEinddatum)"/></uiterlijkeEinddatumAfdoening>
            </xsl:if>
            <xsl:if test="string-length(publicatiedatum) > 0">
                <publicatiedatum><xsl:value-of select="zgw:convertZdsDateToZgwDate(publicatiedatum)"/></publicatiedatum>
            </xsl:if>
           <!-- <communicatiekanaal><xsl:value-of select="$communicatiekanaal"/></communicatiekanaal> --> <!-- where to get? unknown -->
            <xsl:apply-templates select="productenOfDiensten"/>
            <vertrouwelijkheidaanduiding><xsl:value-of select="$GetZaakTypeResult/ZgwZaakType/vertrouwelijkheidaanduiding"/></vertrouwelijkheidaanduiding> <!-- from zaaktype -->
            <betalingsindicatie><xsl:value-of select="betalingsindicatie"/></betalingsindicatie>
            <xsl:if test="string-length(laatsteBetaaldatum) > 0">
                <laatsteBetaaldatum><xsl:value-of select="zgw:convertZdsDatetimeToZgwDatetime(laatsteBetaaldatum)"/></laatsteBetaaldatum>
            </xsl:if>
        <!-- zaakgeometrie ? -->
            <xsl:apply-templates select="verlenging"/>
            <xsl:apply-templates select="opschorting"/>
            <!-- <selectielijstklasse><xsl:value-of select="$GetResultaattypeResult/results/selectielijstklasse"/></selectielijstklasse> --> <!-- from resultaattype -->
            <!-- <hoofdzaak><xsl:value-of select="$hoofdzaak"/></hoofdzaak> --> <!-- doesn't exist in zds -->
            <relevanteAndereZaken><xsl:value-of select="$relevanteAndereZaken"/></relevanteAndereZaken>
            <xsl:apply-templates select="object/kenmerk"/>
            <xsl:if test="string-length(archiefnominatie) > 0">
                <archiefnominatie><xsl:value-of select="zgw:convertZdsArchiefNominatieToZgwArchiefNominatie(archiefnominatie)"/></archiefnominatie>
            </xsl:if>
            <!--<archiefstatus><xsl:value-of select="$archiefstatus"/></archiefstatus> --> <!-- where to get ? unknown -->
            <xsl:if test="string-length(datumVernietigingDossier) > 0">
                <archiefactiedatum><xsl:value-of select="zgw:convertZdsDateToZgwDate(datumVernietigingDossier)"/></archiefactiedatum>
            </xsl:if>
            <opdrachtgevendeOrganisatie><xsl:value-of select="opdrachtgevendeOrganisatie"/></opdrachtgevendeOrganisatie>
        </ZgwZaak>
	</xsl:template>
    <xsl:template match="verlenging">
        <xsl:if test="string-length(reden) > 0">
            <verlenging>
                <reden><xsl:value-of select="reden"/></reden>
                <duur><xsl:value-of select="concat('P', duur, 'D')"/></duur> <!-- Vertaling? -->
            </verlenging>
        </xsl:if>
    </xsl:template>
    <xsl:template match="opschorting">
        <opschorting>
            <indicatie><xsl:value-of select="zgw:convertZdsBooleanToZgwBoolean(indicatie)"/></indicatie>
            <reden><xsl:value-of select="reden"/></reden>
        </opschorting>
    </xsl:template>
    <xsl:template match="object/kenmerk">
        <kenmerken>
            <kenmerk><xsl:value-of select="kenmerk"/></kenmerk>
            <bron><xsl:value-of select="bron"/></bron>
        </kenmerken>
    </xsl:template>
    <xsl:template match="productenOfDiensten">
        <productenOfDiensten><xsl:value-of select="."/></productenOfDiensten>
    </xsl:template>

    <xsl:function name="zgw:convertZdsArchiefNominatieToZgwArchiefNominatie" as="xs:string">
    	<xsl:param name="zgwArchiefNominatie" as="xs:string"/>
		<xsl:choose>
      		<xsl:when test="fn:upper-case($zgwArchiefNominatie)='J'">vernietigen</xsl:when>
      		<xsl:otherwise>blijvend_bewaren</xsl:otherwise>
    	</xsl:choose>
	</xsl:function>

    <xsl:function name="zgw:convertZdsDateToZgwDate" as="xs:date">
        <xsl:param name="dateStr" as="xs:string"/>
        <xsl:value-of select="concat(substring($dateStr,1,4), '-', substring($dateStr,5,2), '-', substring($dateStr,7,2))"/>
	</xsl:function>

    <xsl:function name="zgw:convertZdsDatetimeToZgwDatetime" as="xs:dateTime">
    	<xsl:param name="dateTimeStr" as="xs:string"/>
		<xsl:value-of select="concat(substring($dateTimeStr,1,4), '-', substring($dateTimeStr,5,2), '-', substring($dateTimeStr,7,2), 'T', substring($dateTimeStr,9,2), ':', substring($dateTimeStr,11,2), ':', substring($dateTimeStr,13,2), 'Z')"/>
	</xsl:function>

    <xsl:function name="zgw:convertZdsBooleanToZgwBoolean" as="xs:string">
    	<xsl:param name="zdsBoolean" as="xs:string"/>
		<xsl:choose>
      		<xsl:when test="fn:upper-case($zdsBoolean)='J'">true</xsl:when>
            <xsl:when test="fn:upper-case($zdsBoolean)='N'">false</xsl:when>
      		<xsl:otherwise>invalid character</xsl:otherwise>
    	</xsl:choose>
	</xsl:function>
</xsl:stylesheet>