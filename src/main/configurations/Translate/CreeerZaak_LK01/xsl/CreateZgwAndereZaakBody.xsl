<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="ZaakUrl"/>

     <xsl:template match="/">
        <ZgwZaak>
            <xsl:apply-templates select="ZgwZaak/relevanteAndereZaken" />

            <xsl:if test="not(ZgwZaak/relevanteAndereZaken/url = $ZaakUrl)">
                <relevanteAndereZaken>
                    <url><xsl:value-of select="$ZaakUrl" /></url>
                    <aardRelatie>onderwerp</aardRelatie>
                </relevanteAndereZaken>
            </xsl:if>
        </ZgwZaak>
    </xsl:template>

    <xsl:template match="relevanteAndereZaken">
        <xsl:copy-of select="." />
    </xsl:template>
</xsl:stylesheet>
