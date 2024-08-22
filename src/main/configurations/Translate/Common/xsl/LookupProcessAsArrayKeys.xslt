<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
	<xsl:strip-space elements="*" />

	<xsl:param name="ValueOverrideKeyRoot" select="''" as="xs:string" />

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$ValueOverrideKeyRoot = 'zgw.zaken-api.zaken.zaak'">
				ZgwZaak.productenOfDiensten,
				ZgwZaak.zaakgeometrie.coordinates,
				ZgwZaak.relevanteAndereZaken,
				ZgwZaak.kenmerken,
				ZgwZaak.deelzaken,
				ZgwZaak.eigenschappen,
				ZgwZaak.rollen,
				ZgwZaak.zaakinformatieobjecten,
				ZgwZaak.zaakobjecten
			</xsl:when>
			<xsl:when test="$ValueOverrideKeyRoot = 'zgw.zaken-api.rollen.rol'">
				zgwRol.statussen
				zgwRol.betrokkeneIdentificatie.handelsnaam
			</xsl:when>
			<xsl:otherwise />
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>