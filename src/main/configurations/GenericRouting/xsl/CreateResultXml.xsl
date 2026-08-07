<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="adapterName" select="''" as="xs:string" />
    <xsl:param name="stopOnError" select="''" as="xs:string" />

    <xsl:template match="/">
        <!-- Check for profile with matching zaakTypeIdentificatie, otherwise, take the default -->
        <result>
            <adapterName><xsl:value-of select="$adapterName"/></adapterName>
            <stopOnError><xsl:value-of select="$stopOnError"/></stopOnError>
        </result>
    </xsl:template>
</xsl:stylesheet>