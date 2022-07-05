<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="ZgwLock"/>

    <xsl:template match="/">
        <lock><xsl:value-of select="$ZgwLock/ZgwLock"/></lock>                
    </xsl:template>
</xsl:stylesheet>