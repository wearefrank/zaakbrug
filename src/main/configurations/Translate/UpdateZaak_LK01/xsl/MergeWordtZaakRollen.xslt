<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  
  <!-- Template to match the root element -->
  <xsl:template match="/zakLk01">
      <xsl:choose>
        <!-- When there is only one object -->
        <xsl:when test="count(object) = 1">
          <xsl:copy-of select="object"/>
        </xsl:when>
        <!-- When there are exactly two objects -->
        <xsl:when test="count(object) = 2">
            <xsl:variable name="secondObject" select="object[2]"/>
            <object>
              <!-- Copy attributes from the second object -->
              <xsl:for-each select="$secondObject/@*">
                <xsl:attribute name="{name()}">
                  <xsl:value-of select="."/>
                </xsl:attribute>
              </xsl:for-each>
            <xsl:copy-of select="object[1]/*[self::heeftAlsBelanghebbende or self::heeftAlsInitiator or self::heeftAlsUitvoerende 
                                or self::heeftAlsVerantwoordelijke or self::heeftAlsGemachtigde or self::heeftAlsOverigBetrokkene]"/>
            <xsl:copy-of select="object[2]/*"/>
          </object>
        </xsl:when>
      </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
