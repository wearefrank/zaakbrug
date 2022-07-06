<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" xmlns:BG="http://www.egem.nl/StUF/sector/bg/0310" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="UnwrapMessageResult"/>
   
	<xsl:template match="/">
        <ZKN:zakLa01>
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
                    <ZKN:identificatie><xsl:value-of select="ZgwZaak/identificatie"/></ZKN:identificatie>
                    <ZKN:omschrijving><xsl:value-of select="ZgwZaak/omschrijving"/></ZKN:omschrijving>
                    <ZKN:toelichting><xsl:value-of select="ZgwZaak/toelichting"/></ZKN:toelichting>
                    <xsl:apply-templates select="ZgwZaak/kenmerken"/>
                    <!-- <xsl:apply-templates select="ZgwZaak/anderZaakObject"/> -->
                    <!-- <ZKN:resultaat>
                        <ZKN:omschrijving><xsl:value-of select="ZgwZaak/resultaat/omschrijving"/></ZKN:omschrijving>
                        <ZKN:toelichting><xsl:value-of select="ZgwZaak/resultaat/toelichting"/></ZKN:toelichting>
                    </ZKN:resultaat> -->
                    <ZKN:startdatum><xsl:value-of select="ZgwZaak/startdatum"/></ZKN:startdatum>
                    <ZKN:registratiedatum><xsl:value-of select="ZgwZaak/registratiedatum"/></ZKN:registratiedatum>
                    <ZKN:publicatiedatum><xsl:value-of select="ZgwZaak/publicatiedatum"/></ZKN:publicatiedatum>
                    <ZKN:einddatumGepland><xsl:value-of select="ZgwZaak/einddatumGepland"/></ZKN:einddatumGepland>
                    <ZKN:uiterlijkeEinddatum><xsl:value-of select="ZgwZaak/uiterlijkeEinddatum"/></ZKN:uiterlijkeEinddatum>
                    <ZKN:einddatum><xsl:value-of select="ZgwZaak/einddatum"/></ZKN:einddatum>
                    <ZKN:opschorting>
                        <ZKN:indicatie><xsl:value-of select="ZgwZaak/opschorting/indicatie"/></ZKN:indicatie>
                        <ZKN:reden><xsl:value-of select="ZgwZaak/opschorting/reden"/></ZKN:reden>
                    </ZKN:opschorting>
                    <ZKN:verlenging>
                        <ZKN:duur><xsl:value-of select="ZgwZaak/verlenging/duur"/></ZKN:duur>
                        <ZKN:reden><xsl:value-of select="ZgwZaak/verlenging/reden"/></ZKN:reden>
                    </ZKN:verlenging>
                    <ZKN:betalingsIndicatie><xsl:value-of select="ZgwZaak/betalingsIndicatie"/></ZKN:betalingsIndicatie>
                    <ZKN:laatsteBetaaldatum><xsl:value-of select="ZgwZaak/laatsteBetaaldatum"/></ZKN:laatsteBetaaldatum>
                    <ZKN:archiefnominatie><xsl:value-of select="ZgwZaak/archiefnominatie"/></ZKN:archiefnominatie>
                    <ZKN:datumVernietigingDossier><xsl:value-of select="ZgwZaak/datumVernietigingDossier"/></ZKN:datumVernietigingDossier>
                    <ZKN:zaakniveau><xsl:value-of select="ZgwZaak/zaakniveau"/></ZKN:zaakniveau>
                    <ZKN:deelzakenIndicatie><xsl:value-of select="ZgwZaak/deelzakenIndicatie"/></ZKN:deelzakenIndicatie>
                    <ZKN:heeftBetrekkingOp>
                        <xsl:choose>
                            <xsl:when test="ZgwZaak/heeftBetrekkingOp/gerelateerde/natuurlijkPersoon">
                                <xsl:apply-templates select="natuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftBetrekkingOp/gerelateerde/nietNatuurlijkPersoon">
                                <xsl:apply-templates select="ZgwZaak/heeftBetrekkingOp/gerelateerde/nietNatuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftBetrekkingOp/gerelateerde/vestiging">
                                <xsl:apply-templates select="ZgwZaak/heeftBetrekkingOp/gerelateerde/vestiging"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftBetrekkingOp/gerelateerde/medewerker">
                                <xsl:apply-templates select="ZgwZaak/heeftBetrekkingOp/gerelateerde/medewerker"/>
                            </xsl:when>
                        </xsl:choose>
                    </ZKN:heeftBetrekkingOp>
                    <ZKN:heeftAlsBelanghebbende>
                        <xsl:choose>
                            <xsl:when test="ZgwZaak/heeftAlsBelanghebbende/gerelateerde/natuurlijkPersoon">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsBelanghebbende/gerelateerde/natuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsBelanghebbende/gerelateerde/nietNatuurlijkPersoon">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsBelanghebbende/gerelateerde/nietNatuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsBelanghebbende/gerelateerde/vestiging">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsBelanghebbende/gerelateerde/vestiging"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsBelanghebbende/gerelateerde/medewerker">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsBelanghebbende/gerelateerde/medewerker"/>
                            </xsl:when>
                        </xsl:choose>
                    </ZKN:heeftAlsBelanghebbende>
                    <ZKN:heeftAlsGemachtigde>
                        <xsl:choose>
                            <xsl:when test="ZgwZaak/heeftAlsGemachtigde/gerelateerde/natuurlijkPersoon">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsGemachtigde/gerelateerde/natuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsGemachtigde/gerelateerde/nietNatuurlijkPersoon">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsGemachtigde/gerelateerde/nietNatuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsGemachtigde/gerelateerde/vestiging">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsGemachtigde/gerelateerde/vestiging"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsGemachtigde/gerelateerde/medewerker">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsGemachtigde/gerelateerde/medewerker"/>
                            </xsl:when>
                        </xsl:choose>
                    </ZKN:heeftAlsGemachtigde>
                    <ZKN:heeftAlsInitiator>
                        <xsl:choose>
                            <xsl:when test="ZgwZaak/heeftAlsInitiator/gerelateerde/natuurlijkPersoon">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsInitiator/gerelateerde/natuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsInitiator/gerelateerde/nietNatuurlijkPersoon">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsInitiator/gerelateerde/nietNatuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsInitiator/gerelateerde/vestiging">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsInitiator/gerelateerde/vestiging"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsInitiator/gerelateerde/medewerker">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsInitiator/gerelateerde/medewerker"/>
                            </xsl:when>
                        </xsl:choose>
                    </ZKN:heeftAlsInitiator>
                    <ZKN:heeftAlsUitvoerende>
                        <xsl:choose>
                            <xsl:when test="ZgwZaak/heeftAlsUitvoerende/gerelateerde/natuurlijkPersoon">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsUitvoerende/gerelateerde/natuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsUitvoerende/gerelateerde/nietNatuurlijkPersoon">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsUitvoerende/gerelateerde/nietNatuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsUitvoerende/gerelateerde/vestiging">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsUitvoerende/gerelateerde/vestiging"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsUitvoerende/gerelateerde/medewerker">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsUitvoerende/gerelateerde/medewerker"/>
                            </xsl:when>
                        </xsl:choose>
                    </ZKN:heeftAlsUitvoerende>
                    <ZKN:heeftAlsVerantwoordelijke>
                        <xsl:choose>
                            <xsl:when test="ZgwZaak/heeftAlsVerantwoordelijke/gerelateerde/natuurlijkPersoon">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsVerantwoordelijke/gerelateerde/natuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsVerantwoordelijke/gerelateerde/nietNatuurlijkPersoon">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsVerantwoordelijke/gerelateerde/nietNatuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsVerantwoordelijke/gerelateerde/vestiging">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsVerantwoordelijke/gerelateerde/vestiging"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsVerantwoordelijke/gerelateerde/medewerker">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsVerantwoordelijke/gerelateerde/medewerker"/>
                            </xsl:when>
                        </xsl:choose>
                    </ZKN:heeftAlsVerantwoordelijke>
                    <ZKN:heeftAlsOverigBetrokkene>
                        <xsl:choose>
                            <xsl:when test="ZgwZaak/heeftAlsOverigBetrokkene/gerelateerde/natuurlijkPersoon">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsOverigBetrokkene/gerelateerde/natuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsOverigBetrokkene/gerelateerde/nietNatuurlijkPersoon">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsOverigBetrokkene/gerelateerde/nietNatuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsOverigBetrokkene/gerelateerde/vestiging">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsOverigBetrokkene/gerelateerde/vestiging"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsOverigBetrokkene/gerelateerde/medewerker">
                                <xsl:apply-templates select="ZgwZaak/heeftAlsOverigBetrokkene/gerelateerde/medewerker"/>
                            </xsl:when>
                        </xsl:choose>
                    </ZKN:heeftAlsOverigBetrokkene>
                    <xsl:apply-templates select="ZgwZaak/isVan/gerelateerde"/>
                    <xsl:apply-templates select="ZgwZaak/heeftAlsDeelzaak/gerelateerde"/>
                    <xsl:apply-templates select="ZgwZaak/heeftAlsHoofdzaak/gerelateerde"/>
                    <xsl:apply-templates select="ZgwZaak/root/heeftBetrekkingOp/gerelateerde"/>
                    <xsl:apply-templates select="ZgwZaak/heeft"/>
                    <xsl:apply-templates select="results/result/heeftRelevant"/>
                </ZKN:object>
            </ZKN:antwoord>
        </ZKN:zakLa01>
	</xsl:template>

    <xsl:template match="ZgwZaak/anderZaakObject">
        <ZKN:anderZaakObject>
            <ZKN:omschrijving><xsl:value-of select="omschrijving"/></ZKN:omschrijving>
            <ZKN:aanduiding><xsl:value-of select="aanduiding"/></ZKN:aanduiding>
            <ZKN:lokatie><xsl:value-of select="lokatie"/></ZKN:lokatie>
            <ZKN:registratie><xsl:value-of select="registratie"/></ZKN:registratie>
        </ZKN:anderZaakObject>
    </xsl:template>

    <xsl:template match="ZgwZaak/kenmerken">
        <ZKN:kenmerk>
            <ZKN:kenmerk><xsl:value-of select="kenmerk"/></ZKN:kenmerk>
            <ZKN:bron><xsl:value-of select="bron"/></ZKN:bron>
        </ZKN:kenmerk>
    </xsl:template>

    <xsl:template match="natuurlijkPersoon">
        <ZKN:gerelateerde>
            <ZKN:natuurlijkPersoon entiteittype="NPS">
                <BG:inp.bsn><xsl:value-of select="inp.bsn"/></BG:inp.bsn>
                <BG:geslachtsnaam><xsl:value-of select="geslachtsnaam"/></BG:geslachtsnaam>
                <BG:voorvoegselGeslachtsnaam><xsl:value-of select="voorvoegselGeslachtsnaam"/></BG:voorvoegselGeslachtsnaam>
                <BG:voorletters><xsl:value-of select="voorletters"/></BG:voorletters>
                <BG:voornamen><xsl:value-of select="voornamen"/></BG:voornamen>
                <BG:geslachtsaanduiding><xsl:value-of select="geslachtsaanduiding"/></BG:geslachtsaanduiding>
                <BG:geboortedatum><xsl:value-of select="geboortedatum"/></BG:geboortedatum>
                <xsl:apply-templates select="verblijfsadres"/>
            </ZKN:natuurlijkPersoon>
        </ZKN:gerelateerde>
    </xsl:template>

    <xsl:template match="nietNatuurlijkPersoon">
        <ZKN:gerelateerde>
            <ZKN:nietNatuurlijkPersoon entiteittype="NNP">
                <BG:inn.nnpId><xsl:value-of select="inn.nnpId"/></BG:inn.nnpId>
                <BG:ann.identificatie><xsl:value-of select="ann.identificatie"/></BG:ann.identificatie>
                <BG:statutaireNaam><xsl:value-of select="statutaireNaam"/></BG:statutaireNaam>
                <BG:innRechtsvorm><xsl:value-of select="innRechtsvorm"/></BG:innRechtsvorm>
                <!-- Missing bezoekadres -->
                <!-- Missing subVerblijfBuitenland -->
            </ZKN:nietNatuurlijkPersoon>
        </ZKN:gerelateerde>
    </xsl:template>

    <xsl:template match="vestiging">
        <ZKN:gerelateerde>
            <ZKN:vestiging entiteittype="VES">
                <BG:vestigingsNummer><xsl:value-of select="vestigingsNummer"/></BG:vestigingsNummer>
                <BG:handelsnaam><xsl:value-of select="handelsnaam"/></BG:handelsnaam>
                <xsl:apply-templates select="verblijfsadres"/>
                <!-- Missing subVerblijfBuitenland -->
            </ZKN:vestiging>
        </ZKN:gerelateerde>
    </xsl:template>

    <xsl:template match="medewerker">
        <ZKN:gerelateerde>
            <ZKN:medewerker entiteittype="MDW">
                <BG:identificatie><xsl:value-of select="identificatie"/></BG:identificatie>
                <BG:achternaam><xsl:value-of select="achternaam"/></BG:achternaam>
                <BG:voorletters><xsl:value-of select="voorletters"/></BG:voorletters>
            </ZKN:medewerker>
        </ZKN:gerelateerde>
    </xsl:template>

    <xsl:template match="verblijfsadres">
        <BG:verblijfsadres>
            <BG:aoa.identificatie><xsl:value-of select="aoa.identificatie"/></BG:aoa.identificatie>
            <BG:wpl.woonplaatsNaam><xsl:value-of select="wpl.woonplaatsNaam"/></BG:wpl.woonplaatsNaam>
            <BG:gor.openbareRuimteNaam><xsl:value-of select="gor.openbareRuimteNaam"/></BG:gor.openbareRuimteNaam>
            <BG:gor.straatnaam><xsl:value-of select="gor.straatnaam"/></BG:gor.straatnaam>
            <BG:aoa.postcode><xsl:value-of select="aoa.postcode"/></BG:aoa.postcode>
            <BG:aoa.huisnummer><xsl:value-of select="aoa.huisnummer"/></BG:aoa.huisnummer>
            <BG:aoa.huisletter><xsl:value-of select="aoa.huisletter"/></BG:aoa.huisletter>
            <BG:aoa.huisnummertoevoeging><xsl:value-of select="aoa.huisnummertoevoeging"/></BG:aoa.huisnummertoevoeging>
            <BG:inp.locatiebeschrijving><xsl:value-of select="inp.locatiebeschrijving"/></BG:inp.locatiebeschrijving>
        </BG:verblijfsadres>
    </xsl:template>

    <xsl:template match="ZgwZaak/isVan/gerelateerde">
        <ZKN:isVan>
            <ZKN:gerelateerde>
                <ZKN:omschrijving><xsl:value-of select="omschrijving"/></ZKN:omschrijving>
                <ZKN:code><xsl:value-of select="code"/></ZKN:code>
            </ZKN:gerelateerde>
        </ZKN:isVan>
    </xsl:template>

    <xsl:template match="ZgwZaak/heeftAlsDeelzaak/gerelateerde">
        <ZKN:heeftAlsHoofdzaak>
            <ZKN:gerelateerde>
                <ZKN:identificatie><xsl:value-of select="code"/></ZKN:identificatie>
                <ZKN:omschrijving><xsl:value-of select="omschrijving"/></ZKN:omschrijving>
            </ZKN:gerelateerde>
        </ZKN:heeftAlsHoofdzaak>
    </xsl:template>

    <xsl:template match="ZgwZaak/heeftAlsHoofdzaak/gerelateerde">
        <ZKN:heeftAlsHoofdzaak>
            <ZKN:gerelateerde>
                <ZKN:identificatie><xsl:value-of select="code"/></ZKN:identificatie>
                <ZKN:omschrijving><xsl:value-of select="omschrijving"/></ZKN:omschrijving>
            </ZKN:gerelateerde>
        </ZKN:heeftAlsHoofdzaak>
    </xsl:template>

    <xsl:template match="ZgwZaak/root/heeftBetrekkingOpAndere/gerelateerde">
        <ZKN:heeftBetrekkingOpAndere>
            <ZKN:gerelateerde>
                <ZKN:identificatie><xsl:value-of select="code"/></ZKN:identificatie>
                <ZKN:omschrijving><xsl:value-of select="omschrijving"/></ZKN:omschrijving>
            </ZKN:gerelateerde>
        </ZKN:heeftBetrekkingOpAndere>
    </xsl:template>

    <xsl:template match="ZgwZaak/heeft">
        <ZKN:heeft>
            <ZKN:gerelateerde>
                <ZKN:zkt.code><xsl:value-of select="gerelateerde/zktOmschrijving"/></ZKN:zkt.code>
                <ZKN:zkt.omschrijving><xsl:value-of select="gerelateerde/zktCode"/></ZKN:zkt.omschrijving>
                <ZKN:omschrijving><xsl:value-of select="gerelateerde/omschrijving"/></ZKN:omschrijving>
            </ZKN:gerelateerde>
            <ZKN:indicatieLaatsteStatus><xsl:value-of select="code"/></ZKN:indicatieLaatsteStatus>
        </ZKN:heeft>
    </xsl:template>

    <xsl:template match="results/result/heeftRelevant">
        <ZKN:heeftRelevant>
            <ZKN:gerelateerde>
                <ZKN:identificatie><xsl:value-of select="gerelateerde/identificatie"/></ZKN:identificatie>
                <ZKN:dct.omschrijving><xsl:value-of select="gerelateerde/omschrijving"/></ZKN:dct.omschrijving>
                <ZKN:creatiedatum><xsl:value-of select="gerelateerde/creatiedatum"/></ZKN:creatiedatum>
                <ZKN:ontvangstdatum><xsl:value-of select="gerelateerde/ontvangstdatum"/></ZKN:ontvangstdatum>
                <ZKN:titel><xsl:value-of select="gerelateerde/titel"/></ZKN:titel>
                <ZKN:beschrijving><xsl:value-of select="gerelateerde/beschrijving"/></ZKN:beschrijving>
                <ZKN:formaat><xsl:value-of select="gerelateerde/formaat"/></ZKN:formaat>
                <ZKN:taal><xsl:value-of select="gerelateerde/taal"/></ZKN:taal>
                <ZKN:versie><xsl:value-of select="gerelateerde/versie"/></ZKN:versie>
                <ZKN:status><xsl:value-of select="gerelateerde/status"/></ZKN:status>
                <ZKN:verzenddatum><xsl:value-of select="gerelateerde/verzenddatum"/></ZKN:verzenddatum>
                <ZKN:vertrouwelijkAanduiding><xsl:value-of select="gerelateerde/vertrouwelijkheidaanduiding"/></ZKN:vertrouwelijkAanduiding>
                <ZKN:auteur><xsl:value-of select="gerelateerde/auteur"/></ZKN:auteur>
                <ZKN:link><xsl:value-of select="gerelateerde/link"/></ZKN:link>
            </ZKN:gerelateerde>
            <ZKN:titel><xsl:value-of select="titel"/></ZKN:titel>
            <ZKN:beschrijving><xsl:value-of select="beschrijving"/></ZKN:beschrijving>
            <ZKN:registratiedatum><xsl:value-of select="registratiedatum"/></ZKN:registratiedatum>
        </ZKN:heeftRelevant>
    </xsl:template>
</xsl:stylesheet>