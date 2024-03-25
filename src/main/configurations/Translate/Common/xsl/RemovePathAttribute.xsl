<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Identity template: copy all nodes and attributes unchanged -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Template to remove a specific attribute -->
  <xsl:template match="@path">
    <!-- Do nothing, effectively removing the attribute -->
  </xsl:template>

</xsl:stylesheet>
