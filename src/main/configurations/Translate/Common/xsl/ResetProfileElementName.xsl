<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="profile[not(zaakTypeIdentificatie)]">
    <profileDefaults>
      <xsl:apply-templates select="@*|node()"/>
    </profileDefaults>
  </xsl:template>

</xsl:stylesheet>
