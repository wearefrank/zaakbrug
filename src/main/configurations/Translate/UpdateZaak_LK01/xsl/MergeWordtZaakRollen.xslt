<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  
  <!-- Template to match the root element "zakLk01" -->
  <xsl:template match="/zakLk01">

  <xsl:variable name="rollen">
    <rol>heeftAlsBelanghebbende</rol>
    <rol>heeftAlsInitiator</rol>
    <rol>heeftAlsUitvoerende</rol>
    <rol>heeftAlsVerantwoordelijke</rol>
    <rol>heeftAlsGemachtigde</rol>
    <rol>heeftAlsOverigBetrokkene</rol>
  </xsl:variable>
  
    <xsl:choose>
      <!-- When there is only one object -->
      <xsl:when test="count(object) = 1">
        <!-- Copy the single object -->
        <xsl:copy-of select="object"/>
      </xsl:when>
      <!-- When there are exactly two objects -->
      <xsl:when test="count(object) = 2">
        <xsl:variable name="firstObject" select="object[1]"/>
        <xsl:variable name="secondObject" select="object[2]"/>
        <object>
          <!-- Copy attributes from the second object -->
          <xsl:for-each select="$secondObject/@*">
            <xsl:attribute name="{name()}">
              <xsl:value-of select="."/>
            </xsl:attribute>
          </xsl:for-each>
          <xsl:for-each select="$secondObject/*">
              <!-- Stop copying when reaching "isvan" -->
              <xsl:if test="not(self::*[local-name() = $rollen/rol])">
                <xsl:copy-of select="."/>
              </xsl:if>
          </xsl:for-each>
          <xsl:for-each select="$rollen/rol">
            <xsl:for-each select="$firstObject/*[starts-with(local-name(), current())]">
                <xsl:variable name="currentInputBsn" select="gerelateerde/natuurlijkPersoon/inp.bsn"/>
                <xsl:variable name="currentAnpIdentificatie" select="gerelateerde/natuurlijkPersoon/anp.Identificatie"/>
                <xsl:variable name="currentInpA_nummer" select="gerelateerde/natuurlijkPersoon/inpA_nummer"/>
                <xsl:variable name="currentInnNnpId" select="gerelateerde/nietNatuurlijkPersoon/inn.nnpId"/>
                <xsl:variable name="currentAnnIdentificatie" select="gerelateerde/nietNatuurlijkPersoon/ann.identificatie"/>
                <xsl:variable name="currentVestigingsNummer" select="gerelateerde/vestiging/vestigingsNummer"/>
                <xsl:variable name="currentOEHidentificatie" select="gerelateerde/organisatorischeEenheid/identificatie"/>
                <xsl:variable name="currentMDWidentificatie" select="gerelateerde/medewerker/identificatie"/>
                
                <xsl:if test="not($secondObject/*[local-name() = local-name(current()) and @verwerkingssoort = current()/@verwerkingssoort]/gerelateerde/natuurlijkPersoon/inp.bsn = $currentInputBsn
                            or $secondObject/*[local-name() = local-name(current()) and @verwerkingssoort = current()/@verwerkingssoort]/gerelateerde/natuurlijkPersoon/anp.Identificatie = $currentAnpIdentificatie
                            or $secondObject/*[local-name() = local-name(current()) and @verwerkingssoort = current()/@verwerkingssoort]/gerelateerde/natuurlijkPersoon/inpA_nummer = $currentInpA_nummer
                            or $secondObject/*[local-name() = local-name(current()) and @verwerkingssoort = current()/@verwerkingssoort]/gerelateerde/nietNatuurlijkPersoon/inn.nnpId = $currentInnNnpId
                            or $secondObject/*[local-name() = local-name(current()) and @verwerkingssoort = current()/@verwerkingssoort]/gerelateerde/nietNatuurlijkPersoon/ann.identificatie = $currentAnnIdentificatie
                            or $secondObject/*[local-name() = local-name(current()) and @verwerkingssoort = current()/@verwerkingssoort]/gerelateerde/vestiging/vestigingsNummer = $currentVestigingsNummer
                            or $secondObject/*[local-name() = local-name(current()) and @verwerkingssoort = current()/@verwerkingssoort]/gerelateerde/organisatorischeEenheid/identificatie = $currentOEHidentificatie
                            or $secondObject/*[local-name() = local-name(current()) and @verwerkingssoort = current()/@verwerkingssoort]/gerelateerde/medewerker/identificatie = $currentMDWidentificatie)">
                      <xsl:copy-of select="."/>
                </xsl:if>
            </xsl:for-each>
            <xsl:copy-of select="$secondObject/*[starts-with(local-name(), current())]"/>
          </xsl:for-each>
        </object>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
