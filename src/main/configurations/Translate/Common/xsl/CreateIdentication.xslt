<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="NewIdDigit" />
    <xsl:output method="text" />
    <xsl:template match="/">
        <xsl:value-of select="format-number(/result/rowset/row/field, $NewIdDigit)" />
        <!-- <xsl:value-of select="concat(year-from-date(current-date()),
        format-number(/result/rowset/row/field, $NewIdDigit))"/> -->
    </xsl:template>
</xsl:stylesheet>