<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <ZgwZaaks>
        	<xsl:copy-of select="//ZgwZaak"/>
        </ZgwZaaks>
	</xsl:template>
</xsl:stylesheet>