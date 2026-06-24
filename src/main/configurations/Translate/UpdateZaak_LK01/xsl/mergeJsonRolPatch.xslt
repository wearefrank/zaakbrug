<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <xsl:template match="/results">
        <result>
            <xsl:text>[</xsl:text>

            <xsl:for-each select="result">
                <!-- <xsl:text>{</xsl:text> -->

                <!-- <xsl:variable name="idx" select="position() - 1"/> -->
                <xsl:variable name="content"
                    select="substring(., 3, string-length(.) - 4)"/>

                <!-- Replace ALL path occurrences -->
                <xsl:value-of select="$content"/>
                <!-- <xsl:text>}</xsl:text> -->

                <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>

            <xsl:text>]</xsl:text>
        </result>
  </xsl:template>

</xsl:stylesheet>