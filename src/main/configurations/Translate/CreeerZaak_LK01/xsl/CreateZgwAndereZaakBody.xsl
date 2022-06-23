<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="Url"/>

    <xsl:template match="/">
        <relevanteAndereZaken>
            <url><xsl:value-of select="Url"/></url>
            <aardRelatie>onderwerp</aardRelatie>
        </relevanteAndereZaken>
    </xsl:template>
</xsl:stylesheet>