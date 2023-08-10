<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZDS="http://www.stufstandaarden.nl/koppelvlak/zds0120" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" xmlns:zgw="http://google.com/zgw" version="2.0">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:include href="../../ZgwFunctionsBase.xslt" />
    <xsl:include href="../ZgwBesluitenFunctionBase.xslt" />
    <xsl:param name="ZgwBesluitType"/>

    <xsl:template match="/">
        <leidtTot>
            <gerelateerde>
                <xsl:copy-of select="zgw:WrapNullOrSkip('ZKN:identificatie', zgw:IsNullOrEmpty(ZgwBesluit/identificatie), ZgwBesluit/identificatie/text())"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('ZKN:bst.omschrijving', zgw:IsNullOrEmpty($ZgwBesluitType/ZgwBesluitType/omschrijving), $ZgwBesluitType/ZgwBesluitType/omschrijving/text())"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('ZKN:datumBeslissing', zgw:IsNullOrEmpty(ZgwBesluit/datum), zgw:toZdsDate(ZgwBesluit/datum/text()))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('ZKN:toelichting', zgw:IsNullOrEmpty(ZgwBesluit/toelichting), ZgwBesluit/toelichting/text())"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('ZKN:ingangsdatumWerking', zgw:IsNullOrEmpty(ZgwBesluit/ingangsdatum), zgw:toZdsDate(ZgwBesluit/ingangsdatum/text()))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('ZKN:einddatumWerking', zgw:IsNullOrEmpty(ZgwBesluit/vervaldatum), zgw:toZdsDate(ZgwBesluit/vervaldatum/text()))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('ZKN:vervalreden', 'null', zgw:mapVervalreden(ZgwBesluit/vervalreden/text()))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('ZKN:datumPublicatie', zgw:IsNullOrEmpty(ZgwBesluit/publicatiedatum), zgw:toZdsDate(ZgwBesluit/publicatiedatum/text()))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('ZKN:datumVerzending', zgw:IsNullOrEmpty(ZgwBesluit/verzenddatum), zgw:toZdsDate(ZgwBesluit/verzenddatum/text()))"/>
                <xsl:copy-of select="zgw:WrapNullOrSkip('ZKN:datumUiterlijkeReactie', zgw:IsNullOrEmpty(ZgwBesluit/uiterlijkeReactiedatum), zgw:toZdsDate(ZgwBesluit/uiterlijkeReactiedatum/text()))"/>
                <StUF:tijdvakGeldigheid>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('StUF:beginGeldigheid', zgw:IsNullOrEmpty($ZgwBesluitType/ZgwBesluitType/beginGeldigheid), zgw:toZdsDate($ZgwBesluitType/ZgwBesluitType/beginGeldigheid/text()))"/>
                    <xsl:copy-of select="zgw:WrapNullOrSkip('StUF:eindGeldigheid', zgw:IsNullOrEmpty($ZgwBesluitType/ZgwBesluitType/eindeGeldigheid), zgw:toZdsDate($ZgwBesluitType/ZgwBesluitType/eindeGeldigheid/text()))"/>
                </StUF:tijdvakGeldigheid>
                <StUF:tijdstipRegistratie>
                    <xsl:value-of select="format-dateTime(adjust-dateTime-to-timezone(current-dateTime(), xs:dayTimeDuration('PT1H')), '[Y0001][M01][D01]')" />
                </StUF:tijdstipRegistratie>
            </gerelateerde>
        </leidtTot>
    </xsl:template>
</xsl:stylesheet>