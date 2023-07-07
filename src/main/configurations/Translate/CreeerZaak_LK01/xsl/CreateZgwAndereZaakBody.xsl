<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="Url"/>

    <xsl:template match="/">
        <!-- This element will not appear in the JSON, because array elements do not get a key -->
        <container>
            <relevanteAndereZaken>
                <url><xsl:value-of select="$Url"/></url>
                <aardRelatie>onderwerp</aardRelatie>
            </relevanteAndereZaken>
        </container>
    </xsl:template>
</xsl:stylesheet>