<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:param name="With"/>

    <xsl:template match="@*|node()">
        <root>
            <xsl:copy-of select="@*|node()"/>
            <xsl:copy-of select="$With/results/result/*"/>
        </root>
    </xsl:template>
    
	<xsl:template match="/">
		<xsl:apply-templates select="@*|node()"/>
	</xsl:template>
</xsl:stylesheet>