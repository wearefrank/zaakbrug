<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="ZgwZaakInformatieObject"/>
    <xsl:param name="ZgwInformatieObjectType"/>

    <xsl:template match="/">
        <heeftRelevant>
            <gerelateerde>
                <identificatie><xsl:value-of select="ZgwEnkelvoudigInformatieObject/identificatie"/></identificatie>
                <omschrijving><xsl:value-of select="$ZgwInformatieObjectType/ZgwInformatieObjectType/omschrijving"/></omschrijving>
                <creatiedatum><xsl:value-of select="ZgwEnkelvoudigInformatieObject/creatiedatum"/></creatiedatum>
                <ontvangstdatum><xsl:value-of select="ZgwEnkelvoudigInformatieObject/ontvangstdatum"/></ontvangstdatum>
                <titel><xsl:value-of select="ZgwEnkelvoudigInformatieObject/titel"/></titel>
                <beschrijving><xsl:value-of select="ZgwEnkelvoudigInformatieObject/beschrijving"/></beschrijving>
                <formaat><xsl:value-of select="ZgwEnkelvoudigInformatieObject/formaat"/></formaat>
                <taal><xsl:value-of select="ZgwEnkelvoudigInformatieObject/taal"/></taal>
                <versie><xsl:value-of select="ZgwEnkelvoudigInformatieObject/versie"/></versie>
                <status><xsl:value-of select="$statusMap(ZgwEnkelvoudigInformatieObject/status)"/></status>
                <xsl:if test="ZgwEnkelvoudigInformatieObject/verzenddatum != ''">
                    <verzenddatum><xsl:value-of select="format-date(ZgwEnkelvoudigInformatieObject/verzenddatum, '[Y0001][M01][D01]')"/></verzenddatum>
                </xsl:if>
                <vertrouwelijkAanduiding><xsl:value-of select="ZgwEnkelvoudigInformatieObject/vertrouwelijkheidaanduiding"/></vertrouwelijkAanduiding>
                <auteur><xsl:value-of select="ZgwEnkelvoudigInformatieObject/auteur"/></auteur>
                <link><xsl:value-of select="ZgwEnkelvoudigInformatieObject/link"/></link>
            </gerelateerde>
            <titel><xsl:value-of select="$ZgwZaakInformatieObject/ZgwZaakInformatieObject/titel"/></titel>
            <beschrijving><xsl:value-of select="$ZgwZaakInformatieObject/ZgwZaakInformatieObject/beschrijving"/></beschrijving>
            <xsl:if test="$ZgwZaakInformatieObject/ZgwZaakInformatieObject/registratiedatum != ''">
                <registratiedatum><xsl:value-of select="format-dateTime($ZgwZaakInformatieObject/ZgwZaakInformatieObject/registratiedatum, '[Y0001][M01][D01]')"/></registratiedatum>
            </xsl:if>

        </heeftRelevant>
    </xsl:template>
    
    <xsl:variable name="statusMap" as="map(*)">
        <xsl:map>
          <xsl:map-entry key="'in_bewerking'" select="'In bewerking'" />
          <xsl:map-entry key="'ter_vaststelling'" select="'Ter vaststelling'" />
          <xsl:map-entry key="'definitief'" select="'Definitief'" />
          <xsl:map-entry key="'gearchiveerd'" select="'Gearchiveerd'" />
        </xsl:map>
      </xsl:variable>
</xsl:stylesheet>
