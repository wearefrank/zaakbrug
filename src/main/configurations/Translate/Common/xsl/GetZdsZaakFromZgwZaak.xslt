<xsl:stylesheet exclude-result-prefixes="xs zgw" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="ZgwZaak"/>

    <xsl:function name="zgw:convertZdsDateToZgwDate" as="xs:string">
        <xsl:param name="dateStr" as="xs:string"/>
        <xsl:value-of select="concat(substring($dateStr,1,4), substring($dateStr,6,2), substring($dateStr,9,2))"/>
	</xsl:function>

    <xsl:function name="zgw:convertZgwBooleanToZdsBoolean" as="xs:string">
    	<xsl:param name="zgwBoolean" as="xs:string"/>
		<xsl:choose>
      		<xsl:when test="lower-case($zgwBoolean)='true'">J</xsl:when>
            <xsl:when test="lower-case($zgwBoolean)='false'">N</xsl:when>
      		<xsl:otherwise>invalid character</xsl:otherwise>
    	</xsl:choose>
	</xsl:function>

    <xsl:template match="/">
        <root>
            <identificatie><xsl:value-of select="$ZgwZaak/root/identificatie"/></identificatie>
            <omschrijving><xsl:value-of select="$ZgwZaak/root/omschrijving"/></omschrijving>
            <toelichting><xsl:value-of select="$ZgwZaak/root/toelichting"/></toelichting>
            <startdatum><xsl:if test="$ZgwZaak/root/startdatum"><xsl:value-of select="zgw:convertZdsDateToZgwDate($ZgwZaak/root/startdatum)"/></xsl:if></startdatum>
            <registratiedatum><xsl:if test="$ZgwZaak/root/registratiedatum"><xsl:value-of select="zgw:convertZdsDateToZgwDate($ZgwZaak/root/registratiedatum)"/></xsl:if></registratiedatum>
            <archiefnominatie><xsl:value-of select="$ZgwZaak/root/archiefnominatie"/></archiefnominatie> <!-- convert -->
            <!-- <zaakniveau>1</zaakniveau> -->
            <!-- <deelzakenIndicatie>N</deelzakenIndicatie> -->
            <publicatiedatum><xsl:if test="$ZgwZaak/root/publicatiedatum"><xsl:value-of select="zgw:convertZdsDateToZgwDate($ZgwZaak/root/publicatiedatum)"/></xsl:if></publicatiedatum> <!-- convert -->
            <einddatumGepland><xsl:if test="$ZgwZaak/root/einddatumGepland"><xsl:value-of select="zgw:convertZdsDateToZgwDate($ZgwZaak/root/einddatumGepland)"/></xsl:if></einddatumGepland> <!-- convert -->
            <uiterlijkeEinddatum><xsl:if test="$ZgwZaak/root/uiterlijkeEinddatumAfdoening"><xsl:value-of select="zgw:convertZdsDateToZgwDate($ZgwZaak/root/uiterlijkeEinddatumAfdoening)"/></xsl:if></uiterlijkeEinddatum> <!-- convert -->
            <betalingsIndicatie><xsl:value-of select="$ZgwZaak/root/betalingsindicatie"/></betalingsIndicatie>
            <laatsteBetaaldatum><xsl:value-of select="$ZgwZaak/root/laatsteBetaaldatum"/></laatsteBetaaldatum> <!-- convert -->
            <xsl:apply-templates select="$ZgwZaak/root/verlenging"/>
            <xsl:apply-templates select="$ZgwZaak/root/opschorting"/>
            <xsl:apply-templates select="$ZgwZaak/root/kenmerken"/>
        </root>
    </xsl:template>

    <xsl:template match="verlenging">
        <xsl:if test="string-length(reden) > 0">
            <verlenging>
                <reden><xsl:value-of select="reden"/></reden>
                <duur><xsl:value-of select="replace(replace(replace(replace(reden, 'D', ''), 'M', ''), 'Y', ''), 'P', '')"/></duur>
            </verlenging>
        </xsl:if>
    </xsl:template>
    <xsl:template match="opschorting">
        <opschorting>
            <indicatie><xsl:value-of select="zgw:convertZgwBooleanToZdsBoolean(indicatie)"/></indicatie>
            <reden><xsl:value-of select="reden"/></reden>
        </opschorting>
    </xsl:template>
    <xsl:template match="kenmerken">
        <kenmerk><xsl:value-of select="kenmerk"/></kenmerk>
        <bron><xsl:value-of select="bron"/></bron>
    </xsl:template>
</xsl:stylesheet>