<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />

    <xsl:param name="With" as="node()?" />

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
    
	<xsl:template match="/">
        <xsl:copy select="/*">
            <xsl:variable name="temp">
                <tempParent>
                    <xsl:apply-templates select="@*|node()" />
                    <xsl:apply-templates select="$With/*" />
                </tempParent>
            </xsl:variable>
            <xsl:copy-of select="@*" />
		    <xsl:copy-of select="$temp//namespace-node()" />
		    <xsl:copy-of select="$temp/tempParent/*" copy-namespaces="false" />
        </xsl:copy>
	</xsl:template>
</xsl:stylesheet>