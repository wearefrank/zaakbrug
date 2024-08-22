<xsl:stylesheet version="3.0" exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:array="http://www.w3.org/2005/xpath-functions/array">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="#all" />
    <xsl:strip-space elements="*"/>

    <xsl:param name="valueOverrideKeyRoot" select="''" as="xs:string" />

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="/">
		<xsl:apply-templates />
  	</xsl:template>

	<xsl:template match="valueOverrides[starts-with(key, $valueOverrideKeyRoot)]">
		<valueOverrides>
			<xsl:apply-templates />
		</valueOverrides>
  	</xsl:template>

	<xsl:template match="key">
		<xsl:variable name="rootElementName" select="tokenize($valueOverrideKeyRoot, '\.')[last()]" />
		<xsl:variable name="valueOverrideKeyBeforeRoot" select="substring-before($valueOverrideKeyRoot, concat('.', $rootElementName))" />

		<key><xsl:value-of select="substring-after(current(), concat($valueOverrideKeyBeforeRoot, '.'))" /></key>
  	</xsl:template>

	<xsl:template match="valueOverrides" />
</xsl:stylesheet>
