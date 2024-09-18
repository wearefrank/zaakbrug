<xsl:stylesheet version="3.0" exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:array="http://www.w3.org/2005/xpath-functions/array">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <xsl:strip-space elements="*"/>

    <xsl:param name="ExtraElementenContext" as="node()?"><xsl:document /></xsl:param>

    <xsl:param name="debug" as="xs:string" select="'false'" />
	<xsl:variable name="debugSerializeParams" as="map(xs:string, item()?)">
		<xsl:map>
			<xsl:map-entry key="'indent'" select="true()"/>
		</xsl:map>
	</xsl:variable>

	<xsl:key name="valueOverrideKey" match="valueOverrides" use="key" />

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="*[contains(text(), '${extraElementen:')]">
		<xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> matchOnSubstitutionSection: [{serialize(., $debugSerializeParams)}] </xsl:comment></xsl:if>
		
		<xsl:element name="{name()}">
			<xsl:for-each select="tokenize(., '\$\{extraElementen:')">
				<xsl:choose>
					<xsl:when test="contains(current(), '}')">
						<xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> matchOnSubstitutionSectionTokenized: [{serialize(current(), $debugSerializeParams)}] </xsl:comment></xsl:if>
						
						<xsl:variable name="substitutionAction" select="substring-before(current(), '}')" />
						<xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> substitutionAction: [{serialize($substitutionAction, $debugSerializeParams)}] </xsl:comment></xsl:if>

						<xsl:variable name="resolvedSubstitutionSection">
							<xsl:call-template name="resolveSubstitutionAction">
								<xsl:with-param name="action" as="xs:string" select="$substitutionAction" />
							</xsl:call-template>
						</xsl:variable>
						<xsl:value-of select="concat($resolvedSubstitutionSection, substring-after(current(), '}'))" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="xs:string(current())" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:element>
  	</xsl:template>

	<xsl:template name="resolveSubstitutionAction">
		<xsl:param name="action" as="xs:string" />

		<xsl:variable name="xpathExpression" as="xs:string" select="concat('//*:extraElementen/*:extraElement[@*:naam=''', $action, ''']')" />
		<xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> xpathExpression: [{serialize($xpathExpression, $debugSerializeParams)}] </xsl:comment></xsl:if>

		<xsl:variable name="xpathExpressionResult" as="xs:string"><xsl:value-of><xsl:evaluate xpath="$xpathExpression" context-item="$ExtraElementenContext" /></xsl:value-of></xsl:variable>
		<xsl:if test="$debug = 'true'"><xsl:comment expand-text="yes"> xpathExpressionnResult: [{serialize($xpathExpressionResult, $debugSerializeParams)}] </xsl:comment></xsl:if>

		<xsl:value-of select="$xpathExpressionResult" />
	</xsl:template>

</xsl:stylesheet>
