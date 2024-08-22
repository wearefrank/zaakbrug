<xsl:stylesheet version="3.0" exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:array="http://www.w3.org/2005/xpath-functions/array">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="#all" />
    <xsl:strip-space elements="*"/>

    <xsl:param name="valueOverrides" as="node()?" />

	<xsl:key name="valueOverrideKey" match="valueOverrides" use="key" />

	<xsl:template match="/">
		<xsl:variable name="tokenizedKeys">
			<xsl:for-each select="$valueOverrides//valueOverrides">
				<key>
					<xsl:for-each select="tokenize(key, '\.')">
						<segment><xsl:value-of select="." /></segment>
					</xsl:for-each>
				</key>
			</xsl:for-each>
		</xsl:variable>
		<!-- <tokenizedKeys><xsl:copy-of select="$tokenizedKeys" /></tokenizedKeys> -->
		<xsl:call-template name="depthFirstUnflatten">
			<xsl:with-param name="tokenizedKeys" select="$tokenizedKeys" />
			<xsl:with-param name="key" select="''"/>
		</xsl:call-template>
  	</xsl:template>

	<xsl:template name="depthFirstUnflatten">
		<xsl:param name="tokenizedKeys"/>
		<xsl:param name="key" as="xs:string" />
		<!-- <tokenizedKeys><xsl:value-of select="$tokenizedKeys" /></tokenizedKeys> -->
		<!-- <distinctKeys><xsl:value-of select="distinct-values($tokenizedKeys/key/segment[position() = 1])" /></distinctKeys> -->
		<xsl:for-each select="distinct-values($tokenizedKeys/key/segment[position() = 1])">
			<xsl:variable name="ElementName" select="current()" />
			<!-- <elementName><xsl:value-of select="$ElementName" /></elementName> -->
			<xsl:variable name="overrideKey" select="if ($key != '') then concat($key, '.', $ElementName) else $ElementName" />
			<!-- <overrideKey><xsl:value-of select="$overrideKey" /></overrideKey> -->
			<!-- <segmentCount><xsl:value-of select="count($tokenizedKeys/key[segment[1] = $ElementName]/segment)" /></segmentCount> -->
			<xsl:element name="{current()}"> 
				<xsl:choose>
					<xsl:when test="count($tokenizedKeys/key[segment[1] = $ElementName]/segment) gt 1">
						<xsl:variable name="tokenizedKeys2">
							<xsl:for-each select="$tokenizedKeys/key[segment[1] = $ElementName]">
								<key>
									<xsl:for-each select="segment[position() gt 1]">
										<xsl:copy-of select="." />
									</xsl:for-each>
								</key>
							</xsl:for-each>
						</xsl:variable>
						<!-- <tokenizedKeys2><xsl:copy-of select="$tokenizedKeys2" /></tokenizedKeys2> -->
						<xsl:call-template name="depthFirstUnflatten">
							<xsl:with-param name="tokenizedKeys" select="$tokenizedKeys2"/>
							<xsl:with-param name="key" select="$overrideKey"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="overrideValue" select="key('valueOverrideKey', $overrideKey, $valueOverrides)/value" />
						<xsl:value-of select="$overrideValue" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
