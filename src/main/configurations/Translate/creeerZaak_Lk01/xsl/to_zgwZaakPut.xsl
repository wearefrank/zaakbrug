<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:zgw="http://google.com/zgw" exclude-result-prefixes="array fn map math xhtml xs err zgw" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:function name="zgw:convertZgwArchiefNominatieToZdsArchiefNominatie" as="xs:string">
    	<xsl:param name="zgwArchiefNominatie" as="xs:string"/>
		<xsl:choose>
      		<xsl:when test="fn:upper-case($zgwArchiefNominatie)='VERWIJDEREN'">Y</xsl:when>
      		<xsl:otherwise>N</xsl:otherwise>
    	</xsl:choose>
	</xsl:function>

    <xsl:function name="zgw:convertZdsDatumToZgwDatetime" as="xs:string">
    	<xsl:param name="zdsDatum" as="xs:string"/>
		<xsl:value-of select="$zdsDatum"/>
	</xsl:function>

    <xsl:param name="rsin" as="xs:string"/>
    <xsl:param name="zaakTypeUrl" as="xs:string"/>
    <xsl:param name="communicatiekanaal" as="xs:string"/>

	<xsl:template match="object[@entiteittype='ZAK']">
		<root>
		    <xsl:if test="/root/identificatie"><identificatie><xsl:value-of select="root/identificatie"/></identificatie></xsl:if>
            <bronorganisatie><xsl:value-of select="$rsin"/></bronorganisatie>
            <xsl:if test="/root/omschrijving"><omschrijving><xsl:value-of select="root/omschrijving"/></omschrijving></xsl:if>
            <xsl:if test="/root/toelichting"><toelichting><xsl:value-of select="root/toelichting"/></toelichting></xsl:if>
            <zaaktype><xsl:value-of select="$zaakTypeUrl"/></zaaktype>
            <xsl:if test="/root/registratiedatum"><registratiedatum><xsl:value-of select="zgw:convertZdsDatumToZgwDatetime(root/registratiedatum)"/></registratiedatum></xsl:if>
            <verantwoordelijkeOrganisatie><xsl:value-of select="$rsin"/></verantwoordelijkeOrganisatie>
			<startdatum><xsl:value-of select="zgw:convertZdsDatumToZgwDatetime(root/startdatum)"/></startdatum>
			<einddatumGepland><xsl:value-of select="zgw:convertZdsDatumToZgwDatetime(root/einddatumGepland)"/></einddatumGepland>
			<xsl:if test="root/uiterlijkeEinddatum"><uiterlijkeEinddatumAfdoening><xsl:value-of select="zgw:convertZdsDatumToZgwDatetime(root/uiterlijkeEinddatum)"/></uiterlijkeEinddatumAfdoening></xsl:if>
			<xsl:if test="root/publicatiedatum"><publicatiedatum><xsl:value-of select="zgw:convertZdsDatumToZgwDatetime(root/publicatiedatum)"/></publicatiedatum></xsl:if>
            <xsl:if test="$communicatiekanaal"><communicatiekanaal><xsl:value-of select="$communicatiekanaal"/></communicatiekanaal></xsl:if>
            <productenOfDiensten>
                <xsl:for-each select="tokenize(current(), ',')">
                <xs:list itemType="xs:string"><xsl:value-of select="."/></xs:list>
                </xsl:for-each>
            </productenOfDiensten>

			<einddatum><xsl:value-of select="zgw:convertZdsDatumToZgwDatetime(root/einddatum)"/></einddatum>
			<datumVernietigingDossier><xsl:value-of select="root/archiefactiedatum"/></datumVernietigingDossier> <!-- Archiving options dont translate 1:1. -->
	        <archiefnominatie><xsl:value-of select="zgw:convertZgwArchiefNominatieToZdsArchiefNominatie('verwijderen')"/></archiefnominatie>
		</root>

	</xsl:template>

</xsl:stylesheet>