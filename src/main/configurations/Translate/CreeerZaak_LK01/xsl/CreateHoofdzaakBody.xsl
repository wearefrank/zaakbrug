<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="HoofdzaakUrl"/>

    <xsl:template match="/">
        <ZgwZaak>
            <hoofdzaak><xsl:value-of select="$HoofdzaakUrl"/></hoofdzaak>
        </ZgwZaak>
    </xsl:template>
</xsl:stylesheet>
