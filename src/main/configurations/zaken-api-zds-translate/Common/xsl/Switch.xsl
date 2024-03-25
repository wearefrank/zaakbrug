<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="text" version="1.0" encoding="UTF-8"
		indent="yes" />
	<xsl:param name="method" />
	<xsl:param name="url" />
	<xsl:param name="mode" />
	<xsl:param name="skip_next" />

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$mode='method'">
				<xsl:choose>
					<xsl:when test="$skip_next='true'">Exit</xsl:when>
					<xsl:when test="Method/@type='GET'">GET</xsl:when>
					<xsl:when test="Method/@type='POST'">POST</xsl:when>
					<xsl:when test="Method/@type='PUT'">PUT</xsl:when>
					<xsl:when test="Method/@type='PATCH'">PATCH</xsl:when>
					<xsl:when test="Method/@type='DELET'">DELETE</xsl:when>
					<xsl:otherwise>Exit</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="contains($url , 'http://localhost:8080/api/catalogi/api/v1/catalogussen')">catalogus_url</xsl:when>
					<!-- <xsl:when test="string-length(gerelateerde) > 0 and string-length($ZdsWordtZaakRol/role/gerelateerde) 
						= 0">Delete</xsl:when> <xsl:when test="gerelateerde != $ZdsWordtZaakRol/role/gerelateerde">Changed</xsl:when> -->
					<xsl:otherwise>Exit</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>


	</xsl:template>
</xsl:stylesheet>