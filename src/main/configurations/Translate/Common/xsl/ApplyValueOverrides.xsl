<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" exclude-result-prefixes="#all"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="valueOverrides" as="node()?" />
    <xsl:param name="valueOverrideKeyRoot" select="''" as="xs:string" />

	<xsl:key name="valueOverrideKey" match="valueOverrides" use="key"/>
	<xsl:variable name="root" select="/"/>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="/*[local-name() = tokenize($valueOverrideKeyRoot, '\.')[last()]]">
		<xsl:element name="{local-name()}">
			<xsl:variable name="postTransformRoot">
				<xsl:for-each select="*">
					<xsl:call-template name="applyValueOverrides">
						<xsl:with-param name="element" select="$valueOverrideKeyRoot"/>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:variable>
			<xsl:copy-of select="$postTransformRoot" />
			<xsl:variable name="tokenizedKeys">
				<xsl:for-each select="$valueOverrides/root/*[starts-with(key, $valueOverrideKeyRoot)]">
					<xsl:variable name="relativeKey" select="substring-after(key, concat($valueOverrideKeyRoot, '.'))" />
					<xsl:sequence select="tokenize($relativeKey, '\.')" />
				</xsl:for-each>
			</xsl:variable>
			<xsl:call-template name="depthFirstUnflatten">
				<xsl:with-param name="tokenizedKeys" select="$tokenizedKeys"/>
				<xsl:with-param name="key" select="$valueOverrideKeyRoot"/>
				<!-- <xsl:with-param name="value" select="value"/> -->
			</xsl:call-template>
			<xsl:for-each select="$valueOverrides/root/*[starts-with(key, $valueOverrideKeyRoot)]">
				<xsl:variable name="relativeKey" select="substring-after(key, concat($valueOverrideKeyRoot, '.'))" />
				<xsl:variable name="valueForKeyOnRoot" as="xs:string"><xsl:value-of><xsl:evaluate xpath="replace($relativeKey, '\.', '/')" context-item="$postTransformRoot" /></xsl:value-of></xsl:variable> evaluate(/betrokkeneIdentificatie/annIdentificatie)
				<xsl:if test="$valueForKeyOnRoot = ''">
					<xsl:call-template name="unflatten">
						<xsl:with-param name="key" select="$relativeKey"/>
						<xsl:with-param name="value" select="value"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
		</xsl:element>
  </xsl:template>

	<xsl:template name="applyValueOverrides">
		<xsl:param name="element" as="xs:string" />
		<xsl:variable name="overrideValue" select="key('valueOverrideKey', concat($element, '.', local-name()), $valueOverrides)" />
		<xsl:variable name="matches" as="xs:string"><xsl:value-of><xsl:evaluate xpath="$overrideValue/condition" context-item="." /></xsl:value-of></xsl:variable>
		<xsl:choose>
			<xsl:when test="*">
				<xsl:element name="{local-name()}">
					<xsl:variable name="parentLocalName" select="local-name()" />
					<xsl:for-each select="*">
						<xsl:call-template name="applyValueOverrides">
							<xsl:with-param name="element" select="concat($element, '.', $parentLocalName)"/>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:element>
			</xsl:when>
			<xsl:when test="string-length($overrideValue/value) gt 0 and $matches = 'true'">
				<xsl:element name="{local-name()}"><xsl:value-of select="$overrideValue/value" /></xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="depthFirstUnflatten">
		<xsl:param name="tokenizedKeys"/>
		<xsl:param name="key" as="xs:string" />
		
		<xsl:for-each select="distinct-values($tokenizedKeys/*[position() = 1])">
			<xsl:variable name="ElementName" select="current()" />
			<xsl:variable name="overrideKey" select="concat($key, '.', $ElementName)" />
			<xsl:element name="{current()}"> 
				<xsl:choose>
					<xsl:when test="count($tokenizedKeys/*[position() = 1 and . = $ElementName]) gt 1">
						<xsl:variable name="tokenizedKeys2">
							<xsl:for-each select="$tokenizedKeys">
								<xsl:if test="*[position() = 1 and . = $ElementName]">
									<xsl:sequence select="*[position() gt 1]" />
								</xsl:if>
							</xsl:for-each>
						</xsl:variable>
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

	<xsl:template name="unflatten">
		<xsl:param name="key" as="xs:string" />
		<xsl:param name="value" as="xs:string" />
		<xsl:for-each select="$valueOverrides">
			<xsl:choose>
				<xsl:when test="contains($key, '.')">
					<xsl:element name="{substring-before($key, '.')}">
						<xsl:call-template name="unflatten">
							<xsl:with-param name="key" select="substring-after($key, '.')"/>
							<xsl:with-param name="value" select="$value"/>
						</xsl:call-template>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="{$key}"><xsl:value-of select="$value" /></xsl:element>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
