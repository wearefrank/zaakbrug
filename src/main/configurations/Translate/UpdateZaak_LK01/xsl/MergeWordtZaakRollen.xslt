<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  
  <!-- Template to match the root element "zakLk01" -->
  <xsl:template match="/zakLk01">
    <xsl:choose>
      <!-- When there is only one object -->
      <xsl:when test="count(object) = 1">
        <!-- Copy the single object -->
        <xsl:copy-of select="object"/>
      </xsl:when>
      <!-- When there are exactly two objects -->
      <xsl:when test="count(object) = 2">
        <!-- Select the second object -->
        <xsl:variable name="secondObject" select="object[2]"/>
        <!-- Create a new object -->
        <object>
          <!-- Copy attributes from the second object -->
          <xsl:for-each select="$secondObject/@*">
            <xsl:attribute name="{name()}">
              <xsl:value-of select="."/>
            </xsl:attribute>
          </xsl:for-each>
          <!-- Copy child elements from the first object -->
          <xsl:for-each select="object[1]/*">
            <!-- Check if the current element matches one of the specified conditions -->
            <xsl:if test="self::heeftAlsBelanghebbende or self::heeftAlsInitiator or self::heeftAlsUitvoerende 
                          or self::heeftAlsVerantwoordelijke or self::heeftAlsGemachtigde or self::heeftAlsOverigBetrokkene">
                <!-- Your logic for handling these specific child elements -->
            <!-- Check if inp.bsn is different -->
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
            </xsl:if>
          </xsl:for-each>
          <!-- Copy all child elements from the second object -->
          <xsl:copy-of select="$secondObject/*"/>
        </object>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
