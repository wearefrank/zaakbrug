<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>    
    <xsl:param name="ZdsWordtZaak"/>

	<xsl:template match="/root">
        <ZdsZaak>
            <xsl:if test="omschrijving = $ZdsWordtZaak/object/omschrijving">
                <omschrijving><xsl:value-of select="omschrijving"/></omschrijving>
            </xsl:if>
            <xsl:if test="toelichting = $ZdsWordtZaak/object/toelichting">
                <toelichting><xsl:value-of select="toelichting"/></toelichting>
            </xsl:if>
            <xsl:if test="kenmerk = $ZdsWordtZaak/object/kenmerk">
                <xsl:copy-of select="kenmerk"/>
            </xsl:if>
            <xsl:if test="anderZaakObject = $ZdsWordtZaak/object/anderZaakObject">
                <xsl:copy-of select="anderZaakObject"/>
            </xsl:if>
            <xsl:if test="resultaat = $ZdsWordtZaak/object/resultaat">
                <xsl:copy-of select="resultaat"/>
            </xsl:if>
            <xsl:if test="startdatum = $ZdsWordtZaak/object/startdatum">
                <startdatum><xsl:value-of select="startdatum"/></startdatum>
            </xsl:if>
            <xsl:if test="registratiedatum = $ZdsWordtZaak/object/registratiedatum">
                <registratiedatum><xsl:value-of select="registratiedatum"/></registratiedatum>
            </xsl:if>
            <xsl:if test="publicatiedatum = $ZdsWordtZaak/object/publicatiedatum">
                <publicatiedatum><xsl:value-of select="publicatiedatum"/></publicatiedatum>
            </xsl:if>
            <xsl:if test="einddatumGepland = $ZdsWordtZaak/object/einddatumGepland">
                <einddatumGepland><xsl:value-of select="einddatumGepland"/></einddatumGepland>
            </xsl:if>
            <xsl:if test="uiterlijkeEinddatum = $ZdsWordtZaak/object/uiterlijkeEinddatum">
                <uiterlijkeEinddatum><xsl:value-of select="uiterlijkeEinddatum"/></uiterlijkeEinddatum>
            </xsl:if>
            <xsl:if test="einddatum = $ZdsWordtZaak/object/einddatum">
                <einddatum><xsl:value-of select="einddatum"/></einddatum>
            </xsl:if>
            <xsl:if test="opschorting = $ZdsWordtZaak/object/opschorting">
                <xsl:copy-of select="opschorting"/>
            </xsl:if>
            <xsl:if test="verlenging = $ZdsWordtZaak/object/verlenging">
                <xsl:copy-of select="verlenging"/>
            </xsl:if>
            <xsl:if test="betalingsIndicatie = $ZdsWordtZaak/object/betalingsIndicatie">
                <betalingsIndicatie><xsl:value-of select="betalingsIndicatie"/></betalingsIndicatie>
            </xsl:if>
            <xsl:if test="laatsteBetaaldatum = $ZdsWordtZaak/object/laatsteBetaaldatum">
                <laatsteBetaaldatum><xsl:value-of select="laatsteBetaaldatum"/></laatsteBetaaldatum>
            </xsl:if>
            <xsl:if test="archiefnominatie = $ZdsWordtZaak/object/archiefnominatie">
                <archiefnominatie><xsl:value-of select="archiefnominatie"/></archiefnominatie>
            </xsl:if>
            <xsl:if test="datumVernietigingDossier = $ZdsWordtZaak/object/datumVernietigingDossier">
                <datumVernietigingDossier><xsl:value-of select="datumVernietigingDossier"/></datumVernietigingDossier>
            </xsl:if>
            <xsl:if test="zaakniveau = $ZdsWordtZaak/object/zaakniveau">
                <zaakniveau><xsl:value-of select="zaakniveau"/></zaakniveau>
            </xsl:if>
            <xsl:if test="deelzakenIdicatie = $ZdsWordtZaak/object/deelzakenIdicatie">
                <deelzakenIdicatie><xsl:value-of select="deelzakenIdicatie"/></deelzakenIdicatie>
            </xsl:if>
            <xsl:if test="isVan = $ZdsWordtZaak/object/isVan">
                <xsl:copy-of select="isVan"/>
            </xsl:if>
            <xsl:if test="heeftAlsDeelzaak = $ZdsWordtZaak/object/heeftAlsDeelzaak">
                <xsl:copy-of select="heeftAlsDeelzaak"/>
            </xsl:if>
            <xsl:if test="heeftAlsHoofdzaak = $ZdsWordtZaak/object/heeftAlsHoofdzaak">
                <xsl:copy-of select="heeftAlsHoofdzaak"/>
            </xsl:if>
            <xsl:if test="heeftBetrekkingOpAndere = $ZdsWordtZaak/object/heeftBetrekkingOpAndere">
                <xsl:copy-of select="heeftBetrekkingOpAndere"/>
            </xsl:if>
            <xsl:if test="heeft = $ZdsWordtZaak/object/heeft">
                <xsl:copy-of select="heeft"/>
            </xsl:if>
            <xsl:if test="heeftRelevant = $ZdsWordtZaak/object/heeftRelevant">
                <xsl:copy-of select="heeftRelevant"/>
            </xsl:if>
        </ZdsZaak>
	</xsl:template>
</xsl:stylesheet>