<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="ZgwBesluitType"/>

    <xsl:template match="/">
        <leidtTot>
            <gerelateerde>
                <identificatie><xsl:value-of select="ZgwBesluit/identificatie"/></identificatie>
                <datumBeslissing><xsl:value-of select="ZgwBesluit/datum"/></datumBeslissing>
                <omschrijving><xsl:value-of select="$ZgwBesluitType/ZgwBesluitType/omschrijving"/></omschrijving>
                <toelichting><xsl:value-of select="ZgwBesluit/toelichting"/></toelichting>
                <ingangsdatumWerking><xsl:value-of select="ZgwBesluit/ingangsdatum"/></ingangsdatumWerking>
                <einddatumWerking><xsl:value-of select="ZgwBesluit/vervaldatum"/></einddatumWerking>
                <vervalreden><xsl:value-of select="ZgwBesluit/vervalreden"/></vervalreden>
                <datumPublicatie><xsl:value-of select="ZgwBesluit/publicatiedatum"/></datumPublicatie>
                <datumVerzending><xsl:value-of select="ZgwBesluit/verzenddatum"/></datumVerzending>
                <datumUiterlijkeReactie><xsl:value-of select="ZgwBesluit/uiterlijkeReactiedatum"/></datumUiterlijkeReactie>
                <beginGeldigheid><xsl:value-of select="$ZgwBesluitType/ZgwBesluitType/beginGeldigheid"/></beginGeldigheid>
                <eindGeldigheid><xsl:value-of select="$ZgwBesluitType/ZgwBesluitType/eindeGeldigheid"/></eindGeldigheid>
                <tijdstipRegistratie><xsl:value-of select="$ZgwBesluitType/ZgwBesluitType/uiterlijkeReactiedatum"/></tijdstipRegistratie>
            </gerelateerde>
        </leidtTot>
    </xsl:template>
</xsl:stylesheet>
