<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <heeftRelevant>
            <xsl:for-each select="ZgwBesluiten/ZgwBesluit">
                <gerelateerde>
                    <url><xsl:value-of select="url"/></url>
                    <identificatie><xsl:value-of select="identificatie"/></identificatie>
                    <verantwoordelijkeOrganisatie><xsl:value-of select="verantwoordelijkeOrganisatie"/></verantwoordelijkeOrganisatie>
                    <besluittype><xsl:value-of select="besluittype"/></besluittype>
                    <zaak><xsl:value-of select="zaak"/></zaak>
                    <datum><xsl:value-of select="datum"/></datum>
                    <toelichting><xsl:value-of select="toelichting"/></toelichting>
                    <bestuursorgaan><xsl:value-of select="bestuursorgaan"/></bestuursorgaan>
                    <ingangsdatum><xsl:value-of select="ingangsdatum"/></ingangsdatum>
                    <vervaldatum><xsl:value-of select="vervaldatum"/></vervaldatum>
                    <vervalreden><xsl:value-of select="vervalreden"/></vervalreden>
                    <vervalredenWeergave><xsl:value-of select="vervalredenWeergave"/></vervalredenWeergave>
                    <publicatiedatum><xsl:value-of select="publicatiedatum"/></publicatiedatum>
                    <verzenddatum><xsl:value-of select="verzenddatum"/></verzenddatum>
                    <uiterlijkeReactiedatum><xsl:value-of select="uiterlijkeReactiedatum"/></uiterlijkeReactiedatum>
                </gerelateerde>
            </xsl:for-each>
            <!-- <titel><xsl:value-of select="$ZgwBesluiten/ZgwBesluittitel"/></titel>
            <beschrijving><xsl:value-of select="$ZgwBesluiten/ZgwBesluitbeschrijving"/></beschrijving>
            <registratiedatum><xsl:value-of select="$ZgwBesluiten/ZgwBesluitregistratiedatum"/></registratiedatum> -->
        </heeftRelevant>
    </xsl:template>
</xsl:stylesheet>
