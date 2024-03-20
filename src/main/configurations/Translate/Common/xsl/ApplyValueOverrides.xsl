<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="true" exclude-result-prefixes="#all"/>
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

			<xsl:for-each select="$valueOverrides/root/*[starts-with(key, $valueOverrideKeyRoot)]">
				<xsl:variable name="relativeKey" select="substring-after(key, concat($valueOverrideKeyRoot, '.'))" />
				<xsl:variable name="valueForKeyOnRoot" as="xs:string"><xsl:value-of><xsl:evaluate xpath="replace($relativeKey, '\.', '/')" context-item="$postTransformRoot" /></xsl:value-of></xsl:variable>
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
		<xsl:variable name="overrideValue" select="key('valueOverrideKey', concat($element, '.', local-name()), $valueOverrides)/value" />

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
			<xsl:when test="string-length($overrideValue) gt 0 and current() = ''">
				<xsl:element name="{local-name()}"><xsl:value-of select="$overrideValue" /></xsl:element>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="."/>
			</xsl:otherwise>
		</xsl:choose>

		
	</xsl:template>

	<xsl:template name="unflatten">
		<xsl:param name="key" as="xs:string" />
		<xsl:param name="value" as="xs:string" />

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
	</xsl:template>
</xsl:stylesheet>


