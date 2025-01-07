<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:zgw="http://www.wearefrank.nl/zgw" exclude-result-prefixes="array fn map math xhtml xs err zgw" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:function name="zgw:convertZdsArchiefNominatieToZgwArchiefNominatie" as="xs:string">
    	<xsl:param name="zgwArchiefNominatie" as="xs:string"/>
		<xsl:choose>
      		<xsl:when test="fn:upper-case($zgwArchiefNominatie)='J'">vernietigen</xsl:when>
      		<xsl:otherwise>blijvend_bewaren</xsl:otherwise>
    	</xsl:choose>
	</xsl:function>

    <xsl:function name="zgw:convertZdsDateToZgwDate" as="xs:string">
    	<xsl:param name="zdsDate" as="xs:string"/>
		<xsl:value-of select="format-date($zdsDate, '[Y0001]-[M01]-[D01]')"/>
	</xsl:function>

    <xsl:function name="zgw:convertZdsDatetimeToZgwDatetime" as="xs:string">
    	<xsl:param name="zdsDate" as="xs:string"/>
		<xsl:value-of select="format-dateTime($zdsDate, '[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01]Z')"/>
	</xsl:function>

    <xsl:function name="zgw:convertZdsBooleanToZgwBoolean" as="xs:string">
    	<xsl:param name="zdsBoolean" as="xs:string"/>
		<xsl:choose>
      		<xsl:when test="fn:upper-case($zdsBoolean)='J'">true</xsl:when>
            <xsl:when test="fn:upper-case($zdsBoolean)='N'">false</xsl:when>
      		<xsl:otherwise>invalid character</xsl:otherwise>
    	</xsl:choose>
	</xsl:function>

    <xsl:function name="zgw:convertZdsBetalingsIndicatieToZgwBetalingsIndicatie">
        <xsl:param name="zdsBetalingsIndicatie" />
        <xsl:choose>
            <xsl:when test="$zdsBetalingsIndicatie='N.v.t.'">nvt</xsl:when>
            <xsl:when test="$zdsBetalingsIndicatie='(Nog) niet'">nog_niet</xsl:when>
            <xsl:when test="$zdsBetalingsIndicatie='Gedeeltelijk'">gedeeltelijk</xsl:when>
            <xsl:when test="$zdsBetalingsIndicatie='Geheel'">geheel</xsl:when>
        </xsl:choose>
    </xsl:function>

    <xsl:param name="rsin" select="''" as="xs:string"/>
    <xsl:param name="zaaktypeUrl" select="''" as="xs:string"/>
    <xsl:param name="communicatiekanaal" select="''" as="xs:string"/>
    <xsl:param name="productenOfDiensten" select="''" as="xs:string"/>
    <xsl:param name="vertrouwelijkheidaanduiding" select="''" as="xs:string"/>
    <xsl:param name="selectielijstklasse" select="''" as="xs:string"/>
    <xsl:param name="hoofdzaak" select="''" as="xs:string"/>
    <xsl:param name="relevanteAndereZaken" select="''" as="xs:string"/> 
    <xsl:param name="archiefstatus" select="''" as="xs:string"/>
    
	<xsl:template match="object[@entiteittype='MDW']">
		<ZgwZaakPut>
		    <xsl:if test="/object/identificatie">
                <identificatie><xsl:value-of select="/object/identificatie"/></identificatie>
            </xsl:if>
            <xsl:if test="$rsin">
                <bronorganisatie><xsl:value-of select="$rsin"/></bronorganisatie>
            </xsl:if>
            <xsl:if test="$rsin">
                <verantwoordelijkeOrganisatie><xsl:value-of select="$rsin"/></verantwoordelijkeOrganisatie>
            </xsl:if>
            <xsl:if test="/object/omschrijving">
                <omschrijving><xsl:value-of select="/object/omschrijving"/></omschrijving>
            </xsl:if>
            <xsl:if test="/object/toelichting">
                <toelichting><xsl:value-of select="/object/toelichting"/></toelichting>
            </xsl:if>
            <xsl:if test="$zaaktypeUrl">
                <zaaktype><xsl:value-of select="$zaaktypeUrl"/></zaaktype>
            </xsl:if>
            <xsl:if test="/object/registratiedatum">
                <registratiedatum><xsl:value-of select="zgw:convertZdsDateToZgwDate(/object/registratiedatum)"/></registratiedatum>
            </xsl:if>
			<xsl:if test="/object/startdatum">
                <startdatum><xsl:value-of select="zgw:convertZdsDateToZgwDate(/object/startdatum)"/></startdatum>
            </xsl:if>
			<xsl:if test="/object/einddatumGepland">
                <einddatumGepland><xsl:value-of select="zgw:convertZdsDateToZgwDate(/object/einddatumGepland)"/></einddatumGepland>
            </xsl:if>
			<xsl:if test="/object/uiterlijkeEinddatum">
                <uiterlijkeEinddatumAfdoening><xsl:value-of select="zgw:convertZdsDateToZgwDate(/object/uiterlijkeEinddatum)"/></uiterlijkeEinddatumAfdoening>
            </xsl:if>
			<xsl:if test="/object/publicatiedatum">
                <publicatiedatum><xsl:value-of select="zgw:convertZdsDateToZgwDate(/object/publicatiedatum)"/></publicatiedatum>
            </xsl:if>
            <xsl:if test="$communicatiekanaal">
                <communicatiekanaal><xsl:value-of select="$communicatiekanaal"/></communicatiekanaal>
            </xsl:if>
            <xsl:if test="$productenOfDiensten">
                <xsl:apply-templates select="productenOfDiensten"/>
            </xsl:if>
            <xsl:if test="$vertrouwelijkheidaanduiding">
                <vertrouwelijkheidaanduiding><xsl:value-of select="$vertrouwelijkheidaanduiding"/></vertrouwelijkheidaanduiding>
            </xsl:if>
            <xsl:if test="string-length(/object/betalingsindicatie) > 0">
                <betalingsindicatie><xsl:value-of select="zgw:convertZdsBetalingsIndicatieToZgwBetalingsIndicatie(/object/betalingsindicatie)"/></betalingsindicatie>
            </xsl:if>
			<xsl:if test="/object/laatsteBetaaldatum">
                <laatsteBetaaldatum><xsl:value-of select="zgw:convertZdsDatetimeToZgwDatetime(/object/laatsteBetaaldatum)"/></laatsteBetaaldatum>
            </xsl:if>
            <!-- zaakgeometrie -->
            <xsl:if test="/object/verlenging">
                <xsl:apply-templates select="verlenging"/>
            </xsl:if>
            <xsl:if test="/object/opschorting">
                <xsl:apply-templates select="opschorting"/>
            </xsl:if>
            <xsl:if test="$selectielijstklasse">
                <selectielijstklasse><xsl:value-of select="$selectielijstklasse"/></selectielijstklasse>
            </xsl:if>
            <xsl:if test="$hoofdzaak">
                <hoofdzaak><xsl:value-of select="$hoofdzaak"/></hoofdzaak>
            </xsl:if>
            <xsl:if test="$relevanteAndereZaken">
                <relevanteAndereZaken><xsl:value-of select="$relevanteAndereZaken"/></relevanteAndereZaken>
            </xsl:if>
            <xsl:if test="/object/kenmerk">
                <xsl:apply-templates select="kenmerken"/>
            </xsl:if>
            <xsl:if test="/object/archiefnominatie">
                <archiefnominatie><xsl:value-of select="zgw:convertZdsArchiefNominatieToZgwArchiefNominatie(/object/archiefnominatie)"/></archiefnominatie>
            </xsl:if>
            <xsl:if test="$archiefstatus">
                <archiefstatus><xsl:value-of select="$archiefstatus"/></archiefstatus>
            </xsl:if>
			<xsl:if test="/object/datumVernietigingDossier">
                <archiefactiedatum><xsl:value-of select="zgw:convertZdsDateToZgwDate(/object/datumVernietigingDossier)"/></archiefactiedatum>
            </xsl:if>
        </ZgwZaakPut>
	</xsl:template>
    <xsl:template match="verlenging">
        <verlenging>
            <reden><xsl:value-of select="."/></reden>
            <duur><xsl:value-of select="concat('P', concat(duur, 'D'))"/></duur> <!-- Vertaling? -->
        </verlenging>
    </xsl:template>
    <xsl:template match="opschorting">
        <opschorting>
            <indicatie><xsl:value-of select="zgw:convertZdsBooleanToZgwBoolean(.)"/></indicatie>
            <reden><xsl:value-of select="."/></reden>
        </opschorting>
    </xsl:template>
    <xsl:template match="kenmerken">
        <kenmerken>
            <kenmerk><xsl:value-of select="."/></kenmerk>
            <bron><xsl:value-of select="."/></bron>
        </kenmerken>
    </xsl:template>
    <xsl:template match="productenOfDiensten">
        <productenOfDiensten><xsl:value-of select="."/></productenOfDiensten>
    </xsl:template>

</xsl:stylesheet>