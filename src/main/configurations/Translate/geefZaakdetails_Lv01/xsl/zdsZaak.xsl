<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:zgw="http://www.wearefrank.nl/zgw" exclude-result-prefixes="array fn map math xhtml xs err zgw" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:function name="zgw:convertZgwArchiefNominatieToZdsArchiefNominatie" as="xs:string">
    	<xsl:param name="zgwArchiefNominatie" as="xs:string"/>
		<xsl:choose>
      		<xsl:when test="fn:upper-case($zgwArchiefNominatie)='VERWIJDEREN'">J</xsl:when>
      		<xsl:otherwise>N</xsl:otherwise>
    	</xsl:choose>
	</xsl:function>

	<xsl:template match="/">
		<object>
			 <identificatie><xsl:value-of select="root/identificatie"/></identificatie>
			 <omschrijving><xsl:value-of select="root/omschrijving"/></omschrijving>
			 <toelichting><xsl:value-of select="root/toelichting"/></toelichting>
			 <startdatum><xsl:value-of select="root/startdatum"/></startdatum> <!-- Translate YYYY-MM-dd to YYYYMMDD-->
			 <registratiedatum><xsl:value-of select="root/registratiedatum"/></registratiedatum> <!-- Translate YYYY-MM-dd to YYYYMMDD-->
			 <publicatiedatum><xsl:value-of select="root/publicatiedatum"/></publicatiedatum> <!-- Translate YYYY-MM-dd to YYYYMMDD-->
			 <einddatumGepland><xsl:value-of select="root/einddatumGepland"/></einddatumGepland> <!-- Translate YYYY-MM-dd to YYYYMMDD-->
			 <uiterlijkeEinddatum><xsl:value-of select="root/uiterlijkeEinddatum"/></uiterlijkeEinddatum> <!-- Translate YYYY-MM-dd to YYYYMMDD-->
			 <einddatum><xsl:value-of select="root/einddatum"/></einddatum> <!-- Translate YYYY-MM-dd to YYYYMMDD-->
			 <datumVernietigingDossier><xsl:value-of select="root/archiefactiedatum"/></datumVernietigingDossier> <!-- Archiving options dont translate 1:1. -->
			 <archiefnominatie><xsl:value-of select="zgw:convertZgwArchiefNominatieToZdsArchiefNominatie('verwijderen')"/></archiefnominatie>
		</object>

	</xsl:template>

</xsl:stylesheet>
