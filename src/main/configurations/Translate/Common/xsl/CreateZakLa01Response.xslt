<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" xmlns:BG="http://www.egem.nl/StUF/sector/bg/0310" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="Stuurgegevens" as="node()?" />
    <xsl:param name="Parameters" as="node()?" />
   
	<xsl:template match="/">
        <ZKN:zakLa01>
            <ZKN:stuurgegevens>
                <StUF:berichtcode>La01</StUF:berichtcode>
                <StUF:zender>
                    <StUF:organisatie><xsl:value-of select="$Stuurgegevens/stuurgegevens/ontvanger/organisatie"/></StUF:organisatie>
                    <StUF:applicatie><xsl:value-of select="$Stuurgegevens/stuurgegevens/ontvanger/applicatie"/></StUF:applicatie>
                </StUF:zender>
                <StUF:ontvanger>
                    <StUF:organisatie><xsl:value-of select="$Stuurgegevens/stuurgegevens/zender/organisatie"/></StUF:organisatie>
                    <StUF:applicatie><xsl:value-of select="$Stuurgegevens/stuurgegevens/zender/applicatie"/></StUF:applicatie>
                    <StUF:gebruiker><xsl:value-of select="$Stuurgegevens/stuurgegevens/zender/gebruiker"/></StUF:gebruiker>
                </StUF:ontvanger>
                <StUF:referentienummer><xsl:value-of select="$Stuurgegevens/stuurgegevens/referentienummer"/></StUF:referentienummer>
                <StUF:tijdstipBericht><xsl:value-of select="format-dateTime(current-dateTime(), '[Y0001][M01][D01][H01][m01][s01]')"/></StUF:tijdstipBericht>
                <StUF:crossRefnummer><xsl:value-of select="$Stuurgegevens/stuurgegevens/referentienummer"/></StUF:crossRefnummer>
                <StUF:entiteittype>ZAK</StUF:entiteittype>
            </ZKN:stuurgegevens>
            <ZKN:parameters>
                <StUF:indicatorVervolgvraag><xsl:value-of select="$Parameters/parameters/indicatorVervolgvraag"/></StUF:indicatorVervolgvraag>
            </ZKN:parameters>
            <ZKN:antwoord>
                <ZKN:object StUF:entiteittype="ZAK">
                    <xsl:if test="root/identificatie">
                        <ZKN:identificatie><xsl:value-of select="root/identificatie"/></ZKN:identificatie>
                    </xsl:if>
                    <xsl:if test="root/omschrijving">
                        <ZKN:omschrijving><xsl:value-of select="root/omschrijving"/></ZKN:omschrijving>
                    </xsl:if>
                    <xsl:if test="root/toelichting">
                        <ZKN:toelichting><xsl:value-of select="root/toelichting"/></ZKN:toelichting>
                    </xsl:if>
                    <xsl:apply-templates select="root/kenmerk"/>
                    <!-- <xsl:apply-templates select="root/anderZaakObject"/> --> <!-- not provided -->
                    <!-- <ZKN:resultaat>
                        <ZKN:omschrijving><xsl:value-of select="root/resultaat/omschrijving"/></ZKN:omschrijving>
                        <ZKN:toelichting><xsl:value-of select="root/resultaat/toelichting"/></ZKN:toelichting>
                    </ZKN:resultaat> -->
                    <xsl:if test="root/startdatum">
                        <ZKN:startdatum><xsl:value-of select="root/startdatum"/></ZKN:startdatum>
                    </xsl:if>
                    <xsl:if test="root/registratiedatum">
                        <ZKN:registratiedatum><xsl:value-of select="root/registratiedatum"/></ZKN:registratiedatum>
                    </xsl:if>
                    <xsl:if test="root/publicatiedatum">
                        <ZKN:publicatiedatum><xsl:value-of select="root/publicatiedatum"/></ZKN:publicatiedatum>
                    </xsl:if>
                    <xsl:if test="root/einddatumGepland">
                        <ZKN:einddatumGepland><xsl:value-of select="root/einddatumGepland"/></ZKN:einddatumGepland>
                    </xsl:if>
                    <xsl:if test="root/uiterlijkeEinddatum">
                        <ZKN:uiterlijkeEinddatum><xsl:value-of select="root/uiterlijkeEinddatum"/></ZKN:uiterlijkeEinddatum>
                    </xsl:if>
                    <xsl:if test="root/einddatum">
                        <ZKN:einddatum><xsl:value-of select="root/einddatum"/></ZKN:einddatum>
                    </xsl:if>
                    <xsl:if test="root/opschorting">
                        <ZKN:opschorting>
                            <ZKN:indicatie><xsl:value-of select="root/opschorting/indicatie"/></ZKN:indicatie>
                            <ZKN:reden><xsl:value-of select="root/opschorting/reden"/></ZKN:reden>
                        </ZKN:opschorting>
                    </xsl:if>
                    <xsl:if test="root/verlenging">
                        <ZKN:verlenging>
                            <ZKN:duur><xsl:value-of select="root/verlenging/duur"/></ZKN:duur>
                            <ZKN:reden><xsl:value-of select="root/verlenging/reden"/></ZKN:reden>
                        </ZKN:verlenging>
                    </xsl:if>
                    <xsl:if test="root/betalingsIndicatie">
                        <ZKN:betalingsIndicatie><xsl:value-of select="root/betalingsIndicatie"/></ZKN:betalingsIndicatie>
                    </xsl:if>
                    <xsl:if test="root/laatsteBetaaldatum">
                        <ZKN:laatsteBetaaldatum><xsl:value-of select="root/laatsteBetaaldatum"/></ZKN:laatsteBetaaldatum>
                    </xsl:if>
                    <xsl:if test="root/archiefnominatie">
                        <ZKN:archiefnominatie><xsl:value-of select="root/archiefnominatie"/></ZKN:archiefnominatie>
                    </xsl:if>
                    <xsl:if test="root/datumVernietigingDossier">
                        <ZKN:datumVernietigingDossier><xsl:value-of select="root/datumVernietigingDossier"/></ZKN:datumVernietigingDossier>
                    </xsl:if>
                    <xsl:if test="root/zaakniveau">
                        <ZKN:zaakniveau><xsl:value-of select="root/zaakniveau"/></ZKN:zaakniveau>
                    </xsl:if>
                    <xsl:if test="root/deelzakenIndicatie">
                        <ZKN:deelzakenIndicatie><xsl:value-of select="root/deelzakenIndicatie"/></ZKN:deelzakenIndicatie>
                    </xsl:if>
                    <xsl:apply-templates select="root/isVan/gerelateerde"/>
                    <xsl:for-each select="root/heeftBetrekkingOp">
                        <ZKN:heeftBetrekkingOp StUF:entiteittype="ZAKOBJ">
                            <xsl:apply-templates select="gerelateerde/natuurlijkPersoon"/>
                            <xsl:apply-templates select="gerelateerde/nietNatuurlijkPersoon"/>
                            <xsl:apply-templates select="gerelateerde/vestiging"/>
                            <xsl:apply-templates select="gerelateerde/medewerker"/>
                            <xsl:apply-templates select="gerelateerde/organisatorischeEenheid"/>
                        </ZKN:heeftBetrekkingOp>
                    </xsl:for-each>
                    <xsl:for-each select="root/heeftAlsBelanghebbende">
                        <ZKN:heeftAlsBelanghebbende StUF:entiteittype="ZAKBTRBLH">
                            <xsl:apply-templates select="gerelateerde/natuurlijkPersoon"/>
                            <xsl:apply-templates select="gerelateerde/nietNatuurlijkPersoon"/>
                            <xsl:apply-templates select="gerelateerde/vestiging"/>
                            <xsl:apply-templates select="gerelateerde/medewerker"/>
                            <xsl:apply-templates select="gerelateerde/organisatorischeEenheid"/>
                        </ZKN:heeftAlsBelanghebbende>
                    </xsl:for-each>
                    <xsl:for-each select="root/heeftAlsGemachtigde">
                        <ZKN:heeftAlsGemachtigde StUF:entiteittype="ZAKBTRGMC">
                            <xsl:apply-templates select="gerelateerde/natuurlijkPersoon"/>
                            <xsl:apply-templates select="gerelateerde/nietNatuurlijkPersoon"/>
                            <xsl:apply-templates select="gerelateerde/vestiging"/>
                            <xsl:apply-templates select="gerelateerde/medewerker"/>
                            <xsl:apply-templates select="gerelateerde/organisatorischeEenheid"/>
                        </ZKN:heeftAlsGemachtigde>
                    </xsl:for-each>
                    <xsl:for-each select="root/heeftAlsInitiator">
                        <ZKN:heeftAlsInitiator StUF:entiteittype="ZAKBTRINI">
                            <xsl:apply-templates select="gerelateerde/natuurlijkPersoon"/>
                            <xsl:apply-templates select="gerelateerde/nietNatuurlijkPersoon"/>
                            <xsl:apply-templates select="gerelateerde/vestiging"/>
                            <xsl:apply-templates select="gerelateerde/medewerker"/>
                            <xsl:apply-templates select="gerelateerde/organisatorischeEenheid"/>
                        </ZKN:heeftAlsInitiator>
                    </xsl:for-each>
                    <xsl:for-each select="root/heeftAlsUitvoerende">
                        <ZKN:heeftAlsUitvoerende StUF:entiteittype="ZAKBTRUTV">
                            <xsl:apply-templates select="gerelateerde/natuurlijkPersoon"/>
                            <xsl:apply-templates select="gerelateerde/nietNatuurlijkPersoon"/>
                            <xsl:apply-templates select="gerelateerde/vestiging"/>
                            <xsl:apply-templates select="gerelateerde/medewerker"/>
                            <xsl:apply-templates select="gerelateerde/organisatorischeEenheid"/>
                        </ZKN:heeftAlsUitvoerende>
                    </xsl:for-each>
                    <xsl:for-each select="root/heeftAlsVerantwoordelijke">
                        <ZKN:heeftAlsVerantwoordelijke StUF:entiteittype="ZAKBTRVRA">
                            <xsl:apply-templates select="gerelateerde/natuurlijkPersoon"/>
                            <xsl:apply-templates select="gerelateerde/nietNatuurlijkPersoon"/>
                            <xsl:apply-templates select="gerelateerde/vestiging"/>
                            <xsl:apply-templates select="gerelateerde/medewerker"/>
                            <xsl:apply-templates select="gerelateerde/organisatorischeEenheid"/>
                        </ZKN:heeftAlsVerantwoordelijke>
                    </xsl:for-each>
                    <xsl:for-each select="root/heeftAlsOverigBetrokkene">
                        <ZKN:heeftAlsOverigBetrokkene StUF:entiteittype="ZAKBTROVR">
                            <xsl:apply-templates select="gerelateerde/natuurlijkPersoon"/>
                            <xsl:apply-templates select="gerelateerde/nietNatuurlijkPersoon"/>
                            <xsl:apply-templates select="gerelateerde/vestiging"/>
                            <xsl:apply-templates select="gerelateerde/medewerker"/>
                            <xsl:apply-templates select="gerelateerde/organisatorischeEenheid"/>
                        </ZKN:heeftAlsOverigBetrokkene>
                    </xsl:for-each>
                    <xsl:apply-templates select="root/heeftAlsDeelzaak/gerelateerde"/>
                    <xsl:apply-templates select="root/heeftAlsHoofdzaak/gerelateerde"/>
                    <xsl:apply-templates select="root/heeftBetrekkingOpAndere/gerelateerde"/>
                    <xsl:apply-templates select="root/heeft"/>
                    <xsl:apply-templates select="results/result/heeftRelevant"/>
                </ZKN:object>
            </ZKN:antwoord>
        </ZKN:zakLa01>
	</xsl:template>

    <!-- <xsl:template match="root/anderZaakObject">
        <ZKN:anderZaakObject>
            <ZKN:omschrijving><xsl:value-of select="omschrijving"/></ZKN:omschrijving>
            <xsl:if test="aanduiding">
                <ZKN:aanduiding><xsl:value-of select="aanduiding"/></ZKN:aanduiding>
            </xsl:if>
            <xsl:if test="lokatie">
                <ZKN:lokatie><xsl:value-of select="lokatie"/></ZKN:lokatie>
            </xsl:if>
            <xsl:if test="registratie">
                <ZKN:registratie><xsl:value-of select="registratie"/></ZKN:registratie>
            </xsl:if>
        </ZKN:anderZaakObject>
    </xsl:template> -->

    <xsl:template match="root/kenmerk">
        <ZKN:kenmerk>
            <ZKN:kenmerk><xsl:value-of select="kenmerk"/></ZKN:kenmerk>
            <ZKN:bron><xsl:value-of select="bron"/></ZKN:bron>
        </ZKN:kenmerk>
    </xsl:template>

    <xsl:template match="natuurlijkPersoon">
        <ZKN:gerelateerde>
            <ZKN:natuurlijkPersoon StUF:entiteittype="NPS">
                <xsl:if test="inp.bsn">
                    <BG:inp.bsn><xsl:value-of select="inp.bsn"/></BG:inp.bsn>
                </xsl:if>
                <xsl:if test="authentiek">
                    <BG:authentiek StUF:metagegeven="true">J</BG:authentiek>
                </xsl:if>
                <xsl:if test="geslachtsnaam">
                    <BG:geslachtsnaam><xsl:value-of select="geslachtsnaam"/></BG:geslachtsnaam>
                </xsl:if>
                <xsl:if test="voorvoegselGeslachtsnaam">
                    <BG:voorvoegselGeslachtsnaam><xsl:value-of select="voorvoegselGeslachtsnaam"/></BG:voorvoegselGeslachtsnaam>
                </xsl:if>
                <xsl:if test="voorletters">
                    <BG:voorletters><xsl:value-of select="voorletters"/></BG:voorletters>
                </xsl:if>
                <xsl:if test="voornamen">
                    <BG:voornamen><xsl:value-of select="voornamen"/></BG:voornamen>
                </xsl:if>
                <xsl:if test="geslachtsaanduiding">
                    <BG:geslachtsaanduiding><xsl:value-of select="geslachtsaanduiding"/></BG:geslachtsaanduiding>
                </xsl:if>
                <xsl:if test="geboortedatum">
                    <BG:geboortedatum><xsl:value-of select="geboortedatum"/></BG:geboortedatum>
                </xsl:if>
                <xsl:apply-templates select="verblijfsadres"/>
            </ZKN:natuurlijkPersoon>
        </ZKN:gerelateerde>
    </xsl:template>

    <xsl:template match="nietNatuurlijkPersoon">
        <ZKN:gerelateerde>
            <ZKN:nietNatuurlijkPersoon StUF:entiteittype="NNP">
                <xsl:if test="inn.nnpId">
                    <BG:inn.nnpId><xsl:value-of select="inn.nnpId"/></BG:inn.nnpId>
                </xsl:if>
                <xsl:if test="authentiek">
                    <BG:authentiek StUF:metagegeven="true">J</BG:authentiek>
                </xsl:if>
                <xsl:if test="ann.identificatie">
                    <BG:ann.identificatie><xsl:value-of select="ann.identificatie"/></BG:ann.identificatie>
                </xsl:if>
                <xsl:if test="statutaireNaam">
                    <BG:statutaireNaam><xsl:value-of select="statutaireNaam"/></BG:statutaireNaam>
                </xsl:if>
                <xsl:if test="inn.rechtsvorm">
                    <BG:inn.rechtsvorm><xsl:value-of select="inn.rechtsvorm"/></BG:inn.rechtsvorm>
                </xsl:if>
                <!-- Missing bezoekadres -->
                <!-- Missing subVerblijfBuitenland -->
            </ZKN:nietNatuurlijkPersoon>
        </ZKN:gerelateerde>
    </xsl:template>

    <xsl:template match="vestiging">
        <ZKN:gerelateerde>
            <ZKN:vestiging StUF:entiteittype="VES">
                <xsl:if test="vestigingsNummer">
                    <BG:vestigingsNummer><xsl:value-of select="vestigingsNummer"/></BG:vestigingsNummer>
                </xsl:if>
                <xsl:if test="handelsnaam">
                    <BG:handelsnaam><xsl:value-of select="handelsnaam"/></BG:handelsnaam>
                </xsl:if>
                <xsl:apply-templates select="verblijfsadres"/>
                <!-- Missing subVerblijfBuitenland -->
            </ZKN:vestiging>
        </ZKN:gerelateerde>
    </xsl:template>

    <xsl:template match="medewerker">
        <ZKN:gerelateerde>
            <ZKN:medewerker StUF:entiteittype="MDW">
                <xsl:if test="identificatie">
                    <ZKN:identificatie><xsl:value-of select="identificatie"/></ZKN:identificatie>
                </xsl:if>
                <xsl:if test="achternaam">
                    <ZKN:achternaam><xsl:value-of select="achternaam"/></ZKN:achternaam>
                </xsl:if>
                <xsl:if test="voorletters">
                    <ZKN:voorletters><xsl:value-of select="voorletters"/></ZKN:voorletters>
                </xsl:if>
            </ZKN:medewerker>
        </ZKN:gerelateerde>
    </xsl:template>
    
    <xsl:template match="organisatorischeEenheid">
        <ZKN:gerelateerde>
            <ZKN:organisatorischeEenheid StUF:entiteittype="OEH">
                <xsl:if test="identificatie">
                    <ZKN:identificatie><xsl:value-of select="identificatie"/></ZKN:identificatie>
                </xsl:if>
                <xsl:if test="naam">
                    <ZKN:naam><xsl:value-of select="naam"/></ZKN:naam>
                </xsl:if>
                <xsl:if test="isGehuisvestIn">
                    <ZKN:isGehuisvestIn><xsl:value-of select="isGehuisvestIn"/></ZKN:isGehuisvestIn>
                </xsl:if>
            </ZKN:organisatorischeEenheid>
        </ZKN:gerelateerde>
    </xsl:template>

    <xsl:template match="verblijfsadres">
        <BG:verblijfsadres>
            <xsl:if test="aoa.identificatie">
                <BG:aoa.identificatie><xsl:value-of select="aoa.identificatie"/></BG:aoa.identificatie>
            </xsl:if>
            <xsl:if test="authentiek">
                <BG:authentiek StUF:metagegeven="true"><xsl:value-of select="authentiek"/></BG:authentiek>
            </xsl:if>
            <xsl:if test="wpl.woonplaatsNaam">
                <BG:wpl.woonplaatsNaam><xsl:value-of select="wpl.woonplaatsNaam"/></BG:wpl.woonplaatsNaam>
            </xsl:if>
            <xsl:if test="gor.openbareRuimteNaam">
                <BG:gor.openbareRuimteNaam><xsl:value-of select="gor.openbareRuimteNaam"/></BG:gor.openbareRuimteNaam>
            </xsl:if>
            <xsl:if test="gor.straatnaam">
                <BG:gor.straatnaam><xsl:value-of select="gor.straatnaam"/></BG:gor.straatnaam>
            </xsl:if>
            <xsl:if test="aoa.postcode">
                <BG:aoa.postcode><xsl:value-of select="aoa.postcode"/></BG:aoa.postcode>
            </xsl:if>
            <xsl:if test="aoa.huisnummer">
                <BG:aoa.huisnummer><xsl:value-of select="aoa.huisnummer"/></BG:aoa.huisnummer>
            </xsl:if>
            <xsl:if test="aoa.huisletter">
                <BG:aoa.huisletter><xsl:value-of select="aoa.huisletter"/></BG:aoa.huisletter>
            </xsl:if>
            <xsl:if test="aoa.huisnummertoevoeging">
                <BG:aoa.huisnummertoevoeging><xsl:value-of select="aoa.huisnummertoevoeging"/></BG:aoa.huisnummertoevoeging>
            </xsl:if>
            <xsl:if test="inp.locatiebeschrijving">
                <BG:inp.locatiebeschrijving><xsl:value-of select="inp.locatiebeschrijving"/></BG:inp.locatiebeschrijving>
            </xsl:if>
        </BG:verblijfsadres>
    </xsl:template>

    <xsl:template match="root/isVan/gerelateerde">
        <ZKN:isVan StUF:entiteittype="ZAKZKT">
            <ZKN:gerelateerde StUF:entiteittype="ZKT">
                <xsl:if test="omschrijving">
                    <ZKN:omschrijving><xsl:value-of select="omschrijving"/></ZKN:omschrijving>
                </xsl:if>
                <xsl:if test="code">
                    <ZKN:code><xsl:value-of select="code"/></ZKN:code>
                </xsl:if>
            </ZKN:gerelateerde>
        </ZKN:isVan>
    </xsl:template>

    <xsl:template match="root/heeftAlsDeelzaak/gerelateerde">
        <ZKN:heeftAlsHoofdzaak StUF:entiteittype="ZAKZAKDEL">
            <ZKN:gerelateerde>
                <xsl:if test="code">
                    <ZKN:identificatie><xsl:value-of select="code"/></ZKN:identificatie>
                </xsl:if>
                <xsl:if test="omschrijving">
                    <ZKN:omschrijving><xsl:value-of select="omschrijving"/></ZKN:omschrijving>
                </xsl:if>
            </ZKN:gerelateerde>
        </ZKN:heeftAlsHoofdzaak>
    </xsl:template>

    <xsl:template match="root/heeftAlsHoofdzaak/gerelateerde">
        <ZKN:heeftAlsHoofdzaak StUF:entiteittype="ZAKZAKHFD">
            <ZKN:gerelateerde>
                <xsl:if test="code">
                    <ZKN:identificatie><xsl:value-of select="code"/></ZKN:identificatie>
                </xsl:if>
                <xsl:if test="omschrijving">
                    <ZKN:omschrijving><xsl:value-of select="omschrijving"/></ZKN:omschrijving>
                </xsl:if>
            </ZKN:gerelateerde>
        </ZKN:heeftAlsHoofdzaak>
    </xsl:template>

    <xsl:template match="root/heeftBetrekkingOpAndere/gerelateerde">
        <ZKN:heeftBetrekkingOpAndere StUF:entiteittype="ZAKZAKBTR">
            <ZKN:gerelateerde StUF:entiteittype="ZAK">
                <xsl:if test="code">
                    <ZKN:identificatie><xsl:value-of select="code"/></ZKN:identificatie>
                </xsl:if>
                <xsl:if test="omschrijving">
                    <ZKN:omschrijving><xsl:value-of select="omschrijving"/></ZKN:omschrijving>
                </xsl:if>
            </ZKN:gerelateerde>
        </ZKN:heeftBetrekkingOpAndere>
    </xsl:template>

    <xsl:template match="root/heeft">
        <ZKN:heeft StUF:entiteittype="ZAKSTT">
            <ZKN:gerelateerde StUF:entiteittype="STT">
                <xsl:if test="gerelateerde/zktCode">
                    <ZKN:zkt.code><xsl:value-of select="gerelateerde/zktCode"/></ZKN:zkt.code>
                </xsl:if>
                <xsl:if test="gerelateerde/zktOmschrijving">
                    <ZKN:zkt.omschrijving><xsl:value-of select="gerelateerde/zktOmschrijving"/></ZKN:zkt.omschrijving>
                </xsl:if>
                <xsl:if test="gerelateerde/omschrijving">
                    <ZKN:omschrijving><xsl:value-of select="gerelateerde/omschrijving"/></ZKN:omschrijving>
                </xsl:if>
            </ZKN:gerelateerde>
            <xsl:if test="gerelateerde/indicatieLaatsteStatus">
                <ZKN:indicatieLaatsteStatus><xsl:value-of select="gerelateerde/indicatieLaatsteStatus"/></ZKN:indicatieLaatsteStatus>
            </xsl:if>
        </ZKN:heeft>
    </xsl:template>

    <xsl:template match="results/result/heeftRelevant">
        <ZKN:heeftRelevant StUF:entiteittype="ZAKEDC">
            <ZKN:gerelateerde StUF:entiteittype="EDC">
                <xsl:if test="gerelateerde/identificatie">
                    <ZKN:identificatie><xsl:value-of select="gerelateerde/identificatie"/></ZKN:identificatie>
                </xsl:if>
                <xsl:if test="gerelateerde/omschrijving">
                    <ZKN:dct.omschrijving><xsl:value-of select="gerelateerde/omschrijving"/></ZKN:dct.omschrijving>
                </xsl:if>
                <xsl:if test="gerelateerde/creatiedatum">
                    <ZKN:creatiedatum><xsl:value-of select="format-date(gerelateerde/creatiedatum, '[Y0001][M01][D01]')"/></ZKN:creatiedatum>
                </xsl:if>
                <xsl:if test="gerelateerde/ontvangstdatum">
                    <ZKN:ontvangstdatum><xsl:value-of select="format-date(gerelateerde/ontvangstdatum, '[Y0001][M01][D01]')"/></ZKN:ontvangstdatum>
                </xsl:if>
                <xsl:if test="gerelateerde/titel">
                    <ZKN:titel><xsl:value-of select="gerelateerde/titel"/></ZKN:titel>
                </xsl:if>
                <xsl:if test="gerelateerde/beschrijving">
                    <ZKN:beschrijving><xsl:value-of select="gerelateerde/beschrijving"/></ZKN:beschrijving>
                </xsl:if>
                <xsl:if test="gerelateerde/formaat">
                    <ZKN:formaat><xsl:value-of select="gerelateerde/formaat"/></ZKN:formaat>
                </xsl:if>
                <xsl:if test="gerelateerde/taal">
                    <ZKN:taal><xsl:value-of select="gerelateerde/taal"/></ZKN:taal>
                </xsl:if>
                <xsl:if test="gerelateerde/versie">
                    <ZKN:versie><xsl:value-of select="gerelateerde/versie"/></ZKN:versie>
                </xsl:if>
                <xsl:if test="gerelateerde/status">
                    <ZKN:status><xsl:value-of select="$statusMap(gerelateerde/status)"/></ZKN:status>
                </xsl:if>
                <xsl:if test="gerelateerde/verzenddatum">
                    <ZKN:verzenddatum><xsl:value-of select="format-date(gerelateerde/verzenddatum, '[Y0001][M01][D01]')"/></ZKN:verzenddatum>
                </xsl:if>
                <xsl:if test="gerelateerde/vertrouwelijkAanduiding">
                    <ZKN:vertrouwelijkAanduiding><xsl:value-of select="upper-case(gerelateerde/vertrouwelijkAanduiding)"/></ZKN:vertrouwelijkAanduiding>
                </xsl:if>
                <xsl:if test="gerelateerde/auteur">
                    <ZKN:auteur><xsl:value-of select="gerelateerde/auteur"/></ZKN:auteur>
                </xsl:if>
                <xsl:if test="gerelateerde/link">
                    <ZKN:link><xsl:value-of select="gerelateerde/link"/></ZKN:link>
                </xsl:if>
            </ZKN:gerelateerde>
            <xsl:if test="titel">
                <ZKN:titel><xsl:value-of select="titel"/></ZKN:titel>
            </xsl:if>
            <xsl:if test="beschrijving">
                <ZKN:beschrijving><xsl:value-of select="beschrijving"/></ZKN:beschrijving>
            </xsl:if>
            <xsl:if test="registratiedatum">
                <ZKN:registratiedatum><xsl:value-of select="format-dateTime(registratiedatum, '[Y0001][M01][D01]')"/></ZKN:registratiedatum>
            </xsl:if>
        </ZKN:heeftRelevant>
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