<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="MainZaakUrl"/>
    <xsl:param name="AndereZaakUrl"/>

    <xsl:template match="/">
        <ZgwZaak>
            <xsl:choose>
                <xsl:when test="$MainZaakUrl">
                    <relevanteAndereZaken>
                        <url><xsl:value-of select="$MainZaakUrl" /></url>
                        <aardRelatie>onderwerp</aardRelatie>
                    </relevanteAndereZaken>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="$AndereZaakUrl">
                        <relevanteAndereZaken>
                            <url><xsl:value-of select="$AndereZaakUrl" /></url>
                            <aardRelatie>onderwerp</aardRelatie>
                        </relevanteAndereZaken>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="ZgwZaak/relevanteAndereZaken" />
        </ZgwZaak>
    </xsl:template>

    <xsl:template match="relevanteAndereZaken">
        <xsl:if test="not(preceding::relevanteAndereZaken/url = url or $MainZaakUrl = url or $AndereZaakUrl = url )">
            <xsl:copy-of select="." />
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
