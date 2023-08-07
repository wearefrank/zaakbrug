<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" xmlns:BG="http://www.egem.nl/StUF/StUF0301" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="UnwrapMessageResult" as="node()?" />
   
	<xsl:template match="/">
        <ZKN:geefLijstBesluiten_ZakLa01 xmlns:ZKN="http://www.stufstandaarden.nl/koppelvlak/zds0120">
            <ZKN:stuurgegevens xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310">
                <StUF:berichtcode>La01</StUF:berichtcode>
                <StUF:zender>
                    <StUF:organisatie><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/ontvanger/organisatie"/></StUF:organisatie>
                    <StUF:applicatie><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/ontvanger/applicatie"/></StUF:applicatie>
                </StUF:zender>
                <StUF:ontvanger>
                    <StUF:organisatie><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/zender/organisatie"/></StUF:organisatie>
                    <StUF:applicatie><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/zender/applicatie"/></StUF:applicatie>
                    <StUF:gebruiker><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/zender/gebruiker"/></StUF:gebruiker>
                </StUF:ontvanger>
                <StUF:referentienummer><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/referentienummer"/></StUF:referentienummer>
                <StUF:tijdstipBericht><xsl:value-of select="format-dateTime(current-dateTime(), '[Y0001][M01][D01][H01][m01][s01]')"/></StUF:tijdstipBericht>
                <StUF:crossRefnummer><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/referentienummer"/></StUF:crossRefnummer>
                <StUF:entiteittype>ZAK</StUF:entiteittype>
            </ZKN:stuurgegevens>
            <ZKN:parameters xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310">
                <StUF:indicatorVervolgvraag><xsl:value-of select="$UnwrapMessageResult/*/parameters/indicatorVervolgvraag"/></StUF:indicatorVervolgvraag>
            </ZKN:parameters>
            <ZKN:antwoord xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310">
                <ZKN:object StUF:entiteittype="ZAK">
                    <ZKN:identificatie><xsl:value-of select="$UnwrapMessageResult/*/gelijk/identificatie"/></ZKN:identificatie>
                    <xsl:for-each select="results/result/leidtTot">
                        <ZKN:leidtTot StUF:entiteittype="ZAKBSL">
                            <ZKN:gerelateerde StUF:entiteittype="BSL">
                                <xsl:if test="gerelateerde/identificatie">
                                    <ZKN:identificatie><xsl:value-of select="gerelateerde/identificatie"/></ZKN:identificatie>
                                </xsl:if>
                                <xsl:if test="gerelateerde/omschrijving">
                                    <ZKN:bst.omschrijving><xsl:value-of select="gerelateerde/omschrijving"/></ZKN:bst.omschrijving>
                                </xsl:if>
                                <xsl:if test="gerelateerde/datumBeslissing">
                                    <ZKN:datumBeslissing><xsl:value-of select="format-date(gerelateerde/datumBeslissing, '[Y0001][M01][D01]')"/></ZKN:datumBeslissing>
                                </xsl:if>
                                <xsl:if test="gerelateerde/toelichting">
                                    <ZKN:toelichting><xsl:value-of select="gerelateerde/toelichting"/></ZKN:toelichting>
                                </xsl:if>
                                <xsl:if test="gerelateerde/ingangsdatumWerking">
                                    <ZKN:ingangsdatumWerking><xsl:value-of select="format-date(gerelateerde/ingangsdatumWerking, '[Y0001][M01][D01]')"/></ZKN:ingangsdatumWerking>
                                </xsl:if>
                                <xsl:if test="gerelateerde/einddatumWerking">
                                    <ZKN:einddatumWerking><xsl:value-of select="format-date(gerelateerde/einddatumWerking, '[Y0001][M01][D01]')"/></ZKN:einddatumWerking>
                                </xsl:if>
                                <xsl:if test="gerelateerde/vervalreden">
                                    <ZKN:vervalreden>
                                        <xsl:choose>
                                            <xsl:when test="gerelateerde/vervalreden = 'tijdelijk'">
                                                <xsl:text>Besluit met tijdelijke werking</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="gerelateerde/vervalreden = 'ingetrokken_overheid'">
                                                <xsl:text>Besluit ingetrokken door overheid</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="gerelateerde/vervalreden = 'ingetrokken_belanghebbende'">
                                                <xsl:text>Besluit ingetrokken o.v.v. belanghebbende</xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="gerelateerde/vervalreden"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </ZKN:vervalreden>
                                </xsl:if>
                                <xsl:if test="gerelateerde/datumPublicatie">
                                    <ZKN:datumPublicatie><xsl:value-of select="format-date(gerelateerde/datumPublicatie, '[Y0001][M01][D01]')"/></ZKN:datumPublicatie>
                                </xsl:if>
                                <xsl:if test="gerelateerde/datumVerzending">
                                    <ZKN:datumVerzending><xsl:value-of select="format-date(gerelateerde/datumVerzending, '[Y0001][M01][D01]')"/></ZKN:datumVerzending>
                                </xsl:if>
                                <xsl:if test="gerelateerde/datumUiterlijkeReactie">
                                    <ZKN:datumUiterlijkeReactie><xsl:value-of select="format-date(gerelateerde/datumUiterlijkeReactie, '[Y0001][M01][D01]')"/></ZKN:datumUiterlijkeReactie>
                                </xsl:if>
                                <ZKN:tijdvakGeldigheid xmlns:ZKN="http://www.egem.nl/StUF/StUF0301">
                                    <xsl:if test="gerelateerde/beginGeldigheid">
                                        <ZKN:beginGeldigheid>
                                            <xsl:value-of select="format-date(gerelateerde/beginGeldigheid, '[Y0001][M01][D01]')"/>
                                        </ZKN:beginGeldigheid>
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test="gerelateerde/eindGeldigheid">
                                            <ZKN:eindGeldigheid>
                                                <xsl:value-of select="format-date(gerelateerde/eindGeldigheid, '[Y0001][M01][D01]')"/>
                                            </ZKN:eindGeldigheid>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <!-- Handle the case when gerelateerde/eindGeldigheid is null or not present -->
                                            <ZKN:eindGeldigheid>00000000</ZKN:eindGeldigheid>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </ZKN:tijdvakGeldigheid>
                                <ZKN:tijdstipRegistratie xmlns:ZKN="http://www.egem.nl/StUF/StUF0301">
                                    <xsl:value-of select="format-dateTime(adjust-dateTime-to-timezone(current-dateTime(), xs:dayTimeDuration('PT1H')), '[Y0001][M01][D01]')" />
                                </ZKN:tijdstipRegistratie>
                            </ZKN:gerelateerde>
                        </ZKN:leidtTot>
                    </xsl:for-each>
                </ZKN:object>
            </ZKN:antwoord>
        </ZKN:geefLijstBesluiten_ZakLa01>
    </xsl:template>
</xsl:stylesheet>