<xsl:stylesheet exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <!-- Appends the system fields of the original ZGW resource that do not survive a ZGW -> ZDS -> ZGW round trip. -->
    <xsl:param name="Url" />
    <xsl:param name="Uuid" />
    <xsl:param name="ExpectedRootName" select="'zgwRol'" />

    <xsl:template match="/*[local-name() = $ExpectedRootName]" priority="1">
        <xsl:copy>
            <xsl:copy-of select="@*|node()" />
            <xsl:if test="string-length($Url) gt 0"><url><xsl:value-of select="$Url" /></url></xsl:if>
            <xsl:if test="string-length($Uuid) gt 0"><uuid><xsl:value-of select="$Uuid" /></uuid></xsl:if>
        </xsl:copy>
    </xsl:template>

    <!-- Anything else (e.g. the result of a role that could not be translated) can never be matched. -->
    <xsl:template match="/*">
        <dummy />
    </xsl:template>
</xsl:stylesheet>
