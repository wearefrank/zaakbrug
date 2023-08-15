<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" xmlns:zgw="http://google.com/zgw" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZDS="http://www.stufstandaarden.nl/koppelvlak/zds0120" xmlns:BG="http://www.egem.nl/StUF/StUF0301" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="UnwrapMessageResult" as="node()?" />
    <xsl:include href="../../ZgwFunctionsBase.xslt" />

	<xsl:template match="/">
        <ZDS:geefLijstBesluiten_ZakLa01>
            <ZKN:stuurgegevens>
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
            <ZKN:parameters>
                <StUF:indicatorVervolgvraag><xsl:value-of select="$UnwrapMessageResult/*/parameters/indicatorVervolgvraag"/></StUF:indicatorVervolgvraag>
            </ZKN:parameters>
            <ZKN:antwoord>
                <ZKN:object StUF:entiteittype="ZAK">
                    <ZKN:identificatie><xsl:value-of select="$UnwrapMessageResult/*/gelijk/identificatie"/></ZKN:identificatie>
                    <xsl:for-each select="results/result/leidtTot">
                        <ZKN:leidtTot StUF:entiteittype="ZAKBSL">
                            <ZKN:gerelateerde StUF:entiteittype="BSL">
                            <!--filter scope-->
                            <xsl:for-each select="gerelateerde/*">
                                <xsl:if test="$UnwrapMessageResult/*/scope/object/@scope = 'alles' or $UnwrapMessageResult/*/scope/object/leidtTot/gerelateerde/*[local-name() = local-name(current())]">
                                    <xsl:copy-of select="."/>
                                </xsl:if>
                            </xsl:for-each>

                            </ZKN:gerelateerde>
                        </ZKN:leidtTot>
                    </xsl:for-each>
                </ZKN:object>
            </ZKN:antwoord>
        </ZDS:geefLijstBesluiten_ZakLa01>
    </xsl:template>
</xsl:stylesheet>