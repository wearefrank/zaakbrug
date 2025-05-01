<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="ZaakUrl"></xsl:param>

     <xsl:template match="/">
        <ZgwZaak>
            <xsl:for-each select="/ZgwZaak/relevanteAndereZaken">
                <xsl:if test="not(url = $ZaakUrl)">
                    <relevanteAndereZaken>
                        <xsl:copy-of select="url" />
                        <aardRelatie>onderwerp</aardRelatie>
                    </relevanteAndereZaken>
                </xsl:if>
            </xsl:for-each>
        </ZgwZaak>
    </xsl:template>
</xsl:stylesheet>
