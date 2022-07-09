<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="ZgwLock" select="''" as="xs:string"/>

    <xsl:template match="/">
        <ZgwLock>
            <lock><xsl:value-of select="$ZgwLock"/></lock> 
        </ZgwLock>               
    </xsl:template>
</xsl:stylesheet>