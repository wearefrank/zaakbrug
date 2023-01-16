<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="no" omit-xml-declaration="yes" />

	<xsl:param name="identificatie"/>
	<xsl:param name="einddatum"/>
	<xsl:param name="einddatumGepland"/>
	<xsl:param name="omschrijving"/>
	<xsl:param name="afzenderLastname"/>
	<xsl:param name="afzenderLetters"/>
	<xsl:param name="documentNames"/>
	<xsl:param name="zaakUrl"/>
	<xsl:param name="informatieObjectTypen"/>

	<xsl:template match="/">
		<Zaak>
			<zaakId><xsl:value-of select="$zaakId"/></zaakId>
			<zaakTypeId><xsl:value-of select="$zaakTypeId"/></zaakTypeId>
			<zaakOmschrijving><xsl:value-of select="$zaakOmschrijving"/></zaakOmschrijving>
			<zaakTypeOmschrijving><xsl:value-of select="$zaakTypeOmschrijving"/></zaakTypeOmschrijving>
			<afzender><xsl:value-of select="$afzenderLetters"/>. <xsl:value-of select="$afzenderLastname"/></afzender>
			<documents><xsl:value-of select="$documentNames"/></documents>
			<zaakUrl><xsl:value-of select="$zaakUrl"/></zaakUrl>
			<informatieObjectTypen><xsl:value-of select="$informatieObjectTypen"/></informatieObjectTypen>
		</Zaak>
	</xsl:template>

</xsl:stylesheet>