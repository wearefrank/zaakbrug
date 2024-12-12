<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="VerwerkingsSoort"/>
    <xsl:param name="AndereUrl"/>
    <xsl:param name="AndereUrls" as="node()"><urls><url/></urls></xsl:param>

    <xsl:template match="/">
        <ZgwZaak>
            <xsl:choose>
                <xsl:when test="$AndereUrl">
                    <relevanteAndereZaken>
                        <url><xsl:value-of select="$AndereUrl" /></url>
                        <aardRelatie>onderwerp</aardRelatie>
                    </relevanteAndereZaken>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="$AndereUrls">
                        <xsl:for-each select="$AndereUrls/urls/url">
                            <relevanteAndereZaken>
                                <url><xsl:value-of select="." /></url>
                                <aardRelatie>onderwerp</aardRelatie>
                            </relevanteAndereZaken>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="ZgwZaak/relevanteAndereZaken" />
        </ZgwZaak>
    </xsl:template>

    <xsl:template match="relevanteAndereZaken">
        <xsl:if test="not(preceding::relevanteAndereZaken/url = url or $AndereUrl = url or //$AndereUrls/urls/url = url )">
            <xsl:copy-of select="." />
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
