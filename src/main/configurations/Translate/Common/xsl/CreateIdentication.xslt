<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
                version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:param name="IdentificatieType" />
    <xsl:param name="zaak-identificatie-template" />
    <xsl:param name="document-identificatie-template" />
    <xsl:template match="/">
        <xsl:variable name="formatFromProperties">
            <!-- Identificatie type control -->
            <xsl:choose>
                <xsl:when test="$IdentificatieType='ZaakIdentificatie'">
                    <xsl:value-of select="$zaak-identificatie-template"></xsl:value-of>
                </xsl:when>
                <xsl:when test="$IdentificatieType='DocumentIdentificatie'">
                    <xsl:value-of select="$document-identificatie-template"></xsl:value-of>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable
            name="regexToMatchFormattingInCurlyBraces">\{([^{]*?)\}</xsl:variable>
        <xsl:variable
            name="identificatie" select="/result/rowset/row/field" />
        <!--  find curly braces matching and non matching text  -->
        <xsl:analyze-string
            select="$formatFromProperties" regex="{$regexToMatchFormattingInCurlyBraces}">
            <xsl:matching-substring>
                <xsl:choose>
                    <!--  format datetime  -->
                    <xsl:when test="contains(current(), 'datetime')">
                        <xsl:choose>
                            <xsl:when test="contains(current(), ':')">
                                <xsl:variable
                                    name="date"
                                    select="substring-before(substring-after(current(),':'), '}')" />
                                <xsl:value-of
                                    select="format-dateTime(current-dateTime(), $date)" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="current-dateTime()" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!--  format id  -->
                    <xsl:when test="contains(current(), 'id')">
                        <xsl:choose>
                            <xsl:when test="contains(current(), ':')">
                                <xsl:if test="contains(current(), 'D')">
                                    <xsl:variable name="id">
                                        <xsl:value-of
                                            select="substring-before(substring-after(current(),'D'), '}')" />
                                    </xsl:variable>
                                    <xsl:variable
                                        name="count">
                                        <xsl:for-each select="1 to $id">0</xsl:for-each>
                                    </xsl:variable>
                                    <xsl:value-of
                                        select="format-number($identificatie, $count)" />
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$identificatie" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!--  any other formatting can be in a new case -->
                </xsl:choose>
            </xsl:matching-substring>
            <!--  just add the non matching text in the output  -->
            <xsl:non-matching-substring>
                <xsl:value-of select="." />
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
</xsl:stylesheet>