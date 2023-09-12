<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:param name="VerwerkingsSoort"/>
    <xsl:param name="AndereUrl"/>
    <xsl:param name="AndereUrls" select="parse-xml('&lt;urls&gt;&lt;url/&gt;&lt;/urls&gt;')" />

    <xsl:template match="/">
        <container>
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
            <xsl:if test="$VerwerkingsSoort != 'W'">
                <xsl:apply-templates select="ZgwZaak/relevanteAndereZaken" />
            </xsl:if>
        </container>
    </xsl:template>

    <xsl:template match="relevanteAndereZaken">
        <xsl:if test="not(preceding::relevanteAndereZaken/url = url or $AndereUrl = url or //$AndereUrls/urls/url = url )">
            <xsl:copy-of select="." />
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
