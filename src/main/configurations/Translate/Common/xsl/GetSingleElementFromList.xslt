<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="nth" select="1" as="xs:integer"/>

    <xsl:template match="/">
        <xsl:copy-of select="(//*/*)[$nth]"/>
    </xsl:template>
    
</xsl:stylesheet>