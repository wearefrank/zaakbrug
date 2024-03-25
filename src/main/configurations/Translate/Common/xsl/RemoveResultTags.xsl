<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output indent='yes' />

  <xsl:template match="/">
    <root>
      <xsl:copy-of select="//profile" />
    </root>
  </xsl:template>

</xsl:stylesheet>