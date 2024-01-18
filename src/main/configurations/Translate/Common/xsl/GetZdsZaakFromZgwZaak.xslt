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
        <object entiteittype="ZAK">
            <identificatie><xsl:value-of select="$ZgwZaak/ZgwZaak/identificatie"/></identificatie>
            <omschrijving><xsl:value-of select="$ZgwZaak/ZgwZaak/omschrijving"/></omschrijving>
            <toelichting><xsl:value-of select="$ZgwZaak/ZgwZaak/toelichting"/></toelichting>
            <startdatum><xsl:if test="$ZgwZaak/ZgwZaak/startdatum"><xsl:value-of select="zgw:convertZdsDateToZgwDate($ZgwZaak/ZgwZaak/startdatum)"/></xsl:if></startdatum>
            <registratiedatum><xsl:if test="$ZgwZaak/ZgwZaak/registratiedatum"><xsl:value-of select="zgw:convertZdsDateToZgwDate($ZgwZaak/ZgwZaak/registratiedatum)"/></xsl:if></registratiedatum>
            <xsl:choose>
                <xsl:when test="$ZgwZaak/ZgwZaak/archiefnominatie = 'vernietigen'"><archiefnominatie>J</archiefnominatie></xsl:when>
                <xsl:otherwise><archiefnominatie>N</archiefnominatie></xsl:otherwise>
            </xsl:choose>
            <!-- <zaakniveau>1</zaakniveau> -->
            <!-- <deelzakenIndicatie>N</deelzakenIndicatie> -->
            <publicatiedatum><xsl:if test="$ZgwZaak/ZgwZaak/publicatiedatum"><xsl:value-of select="zgw:convertZdsDateToZgwDate($ZgwZaak/ZgwZaak/publicatiedatum)"/></xsl:if></publicatiedatum> <!-- convert -->
            <einddatumGepland><xsl:if test="$ZgwZaak/ZgwZaak/einddatumGepland"><xsl:value-of select="zgw:convertZdsDateToZgwDate($ZgwZaak/ZgwZaak/einddatumGepland)"/></xsl:if></einddatumGepland> <!-- convert -->
            <uiterlijkeEinddatum><xsl:if test="$ZgwZaak/ZgwZaak/uiterlijkeEinddatumAfdoening"><xsl:value-of select="zgw:convertZdsDateToZgwDate($ZgwZaak/ZgwZaak/uiterlijkeEinddatumAfdoening)"/></xsl:if></uiterlijkeEinddatum> <!-- convert -->
            <betalingsIndicatie><xsl:value-of select="$ZgwZaak/ZgwZaak/betalingsindicatie"/></betalingsIndicatie>
            <laatsteBetaaldatum><xsl:value-of select="$ZgwZaak/ZgwZaak/laatsteBetaaldatum"/></laatsteBetaaldatum> <!-- convert -->
            <xsl:apply-templates select="$ZgwZaak/ZgwZaak/verlenging"/>
            <xsl:apply-templates select="$ZgwZaak/ZgwZaak/opschorting"/>
            <xsl:apply-templates select="$ZgwZaak/ZgwZaak/kenmerken"/>
        </object>
    </xsl:template>

    <xsl:template match="verlenging">
        <xsl:if test="string-length(reden) > 0 and duur != '0'">
            <verlenging>
                <reden><xsl:value-of select="reden"/></reden>
                <duur><xsl:value-of select="replace(replace(replace(replace(duur, 'D', ''), 'M', ''), 'Y', ''), 'P', '')"/></duur>
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