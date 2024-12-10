<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

    <xsl:param name="AndereUrlToDelete"></xsl:param>
    <xsl:param name="AndereUrlsToDelete" as="node()"><urls><url/></urls></xsl:param>

     <xsl:template match="/">
        <container>
            <xsl:for-each select="/ZgwZaak/relevanteAndereZaken">
                <xsl:if test="not(url = $AndereUrlToDelete) and not($AndereUrlsToDelete//url = url)">
                    <relevanteAndereZaken>
                        <xsl:copy-of select="url" />
                        <aardRelatie>onderwerp</aardRelatie>
                    </relevanteAndereZaken>
                </xsl:if>
            </xsl:for-each>
        </container>
    </xsl:template>

</xsl:stylesheet>
