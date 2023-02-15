<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="zaak-identificatie-template" />
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
    <xsl:template match="/">
        <xsl:variable name="test"><xsl:value-of
                select="$zaak-identificatie-template" /></xsl:variable>
    <xsl:variable
            name="patternArray" select="tokenize($test,'-')" />
            <xsl:variable
            name="identificatie" select="/result/rowset/row/field" />
            <xsl:for-each
            select="$patternArray">
            <xsl:choose>
                <xsl:when test="contains(current(), 'datetime')">
                    <xsl:value-of select="substring-before(current(),'{')" />
                        <xsl:variable
                        name="date"
                        select="substring-before(substring-after(current(),':'), '}')" />
                        <xsl:value-of
                        select="concat(format-dateTime(current-dateTime(), $date),'-')" />
                </xsl:when>
                <xsl:when test="contains(current(), 'id')">
                    <xsl:variable name="id"><xsl:value-of
                            select="substring-before(substring-after(current(),'id:D'), '}')" /></xsl:variable>
                            <xsl:variable
                        name="count">
                        <xsl:for-each select="1 to $id">0</xsl:for-each></xsl:variable>
                        <xsl:value-of
                        select="format-number($identificatie, $count)" />
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>