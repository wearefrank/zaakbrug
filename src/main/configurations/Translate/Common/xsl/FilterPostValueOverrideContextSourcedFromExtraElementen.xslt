<xsl:stylesheet version="3.0" exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:StUF="http://www.egem.nl/StUF/StUF0301">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <xsl:strip-space elements="*"/>

	<xsl:mode on-no-match="shallow-skip" />

    <xsl:param name="PreValueOverridesContext" as="node()?"><xsl:document /></xsl:param>

    <xsl:param name="debug" as="xs:string" select="'false'" />
	<xsl:variable name="debugSerializeParams" as="map(xs:string, item()?)">
		<xsl:map>
			<xsl:map-entry key="'indent'" select="true()"/>
		</xsl:map>
	</xsl:variable>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="*[starts-with(text(), '${extraElementen:') and ends-with(text(), '}')]" />

</xsl:stylesheet>
