<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="UnwrapMessageResult"/>
   
	<xsl:template match="/">
        <StUF:zakLa01>
            <StUF:stuurgegevens>
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
            </StUF:stuurgegevens>
            <StUF:parameters>
                <StUF:indicatorVervolgvraag><xsl:value-of select="$UnwrapMessageResult/*/parameters/indicatorVervolgvraag"/></StUF:indicatorVervolgvraag>
            </StUF:parameters>
            <StUF:antwoord>
                <StUF:object>
                    <StUF:identificatie><xsl:value-of select="ZgwZaak/identificatie"/></StUF:identificatie>
                    <StUF:omschrijving><xsl:value-of select="ZgwZaak/omschrijving"/></StUF:omschrijving>
                    <StUF:toelichting><xsl:value-of select="ZgwZaak/toelichting"/></StUF:toelichting>
                    <xsl:apply-templates select="ZgwZaak/kenmerken"/>
                    <!-- <xsl:apply-templates select="ZgwZaak/anderZaakObject"/> -->
                    <!-- <StUF:resultaat>
                        <StUF:omschrijving><xsl:value-of select="ZgwZaak/resultaat/omschrijving"/></StUF:omschrijving>
                        <StUF:toelichting><xsl:value-of select="ZgwZaak/resultaat/toelichting"/></StUF:toelichting>
                    </StUF:resultaat> -->
                    <StUF:startdatum><xsl:value-of select="ZgwZaak/startdatum"/></StUF:startdatum>
                    <StUF:registratiedatum><xsl:value-of select="ZgwZaak/registratiedatum"/></StUF:registratiedatum>
                    <StUF:publicatiedatum><xsl:value-of select="ZgwZaak/publicatiedatum"/></StUF:publicatiedatum>
                    <StUF:einddatumGepland><xsl:value-of select="ZgwZaak/einddatumGepland"/></StUF:einddatumGepland>
                    <StUF:uiterlijkeEinddatum><xsl:value-of select="ZgwZaak/uiterlijkeEinddatum"/></StUF:uiterlijkeEinddatum>
                    <StUF:einddatum><xsl:value-of select="ZgwZaak/einddatum"/></StUF:einddatum>
                    <StUF:opschorting>
                        <StUF:indicatie><xsl:value-of select="ZgwZaak/opschorting/indicatie"/></StUF:indicatie>
                        <StUF:reden><xsl:value-of select="ZgwZaak/opschorting/reden"/></StUF:reden>
                    </StUF:opschorting>
                    <StUF:verlenging>
                        <StUF:duur><xsl:value-of select="ZgwZaak/verlenging/duur"/></StUF:duur>
                        <StUF:reden><xsl:value-of select="ZgwZaak/verlenging/reden"/></StUF:reden>
                    </StUF:verlenging>
                    <StUF:betalingsIndicatie><xsl:value-of select="ZgwZaak/betalingsIndicatie"/></StUF:betalingsIndicatie>
                    <StUF:laatsteBetaaldatum><xsl:value-of select="ZgwZaak/laatsteBetaaldatum"/></StUF:laatsteBetaaldatum>
                    <StUF:archiefnominatie><xsl:value-of select="ZgwZaak/archiefnominatie"/></StUF:archiefnominatie>
                    <StUF:datumVernietigingDossier><xsl:value-of select="ZgwZaak/datumVernietigingDossier"/></StUF:datumVernietigingDossier>
                    <StUF:zaakniveau><xsl:value-of select="ZgwZaak/zaakniveau"/></StUF:zaakniveau>
                    <StUF:deelzakenIndicatie><xsl:value-of select="ZgwZaak/deelzakenIndicatie"/></StUF:deelzakenIndicatie>
                    <StUF:heeftBetrekkingOp>
                        <xsl:choose>
                            <xsl:when test="ZgwZaak/heeftBetrekkingOp/gerelateerde/natuurlijkPersoon">
                                <xsl:apply-templates select="natuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftBetrekkingOp/gerelateerde/nietNatuurlijkPersoon">
                                <xsl:apply-templates select="nietNatuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftBetrekkingOp/gerelateerde/vestiging">
                                <xsl:apply-templates select="vestiging"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftBetrekkingOp/gerelateerde/medewerker">
                                <xsl:apply-templates select="medewerker"/>
                            </xsl:when>
                        </xsl:choose>
                    </StUF:heeftBetrekkingOp>
                    <StUF:heeftAlsBelanghebbende>
                        <xsl:choose>
                            <xsl:when test="ZgwZaak/heeftAlsBelanghebbende/gerelateerde/natuurlijkPersoon">
                                <xsl:apply-templates select="natuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsBelanghebbende/gerelateerde/nietNatuurlijkPersoon">
                                <xsl:apply-templates select="nietNatuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsBelanghebbende/gerelateerde/vestiging">
                                <xsl:apply-templates select="vestiging"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsBelanghebbende/gerelateerde/medewerker">
                                <xsl:apply-templates select="medewerker"/>
                            </xsl:when>
                        </xsl:choose>
                    </StUF:heeftAlsBelanghebbende>
                    <StUF:heeftAlsGemachtigde>
                        <xsl:choose>
                            <xsl:when test="ZgwZaak/heeftAlsGemachtigde/gerelateerde/natuurlijkPersoon">
                                <xsl:apply-templates select="natuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsGemachtigde/gerelateerde/nietNatuurlijkPersoon">
                                <xsl:apply-templates select="nietNatuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsGemachtigde/gerelateerde/vestiging">
                                <xsl:apply-templates select="vestiging"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsGemachtigde/gerelateerde/medewerker">
                                <xsl:apply-templates select="medewerker"/>
                            </xsl:when>
                        </xsl:choose>
                    </StUF:heeftAlsGemachtigde>
                    <StUF:heeftAlsInitiator>
                        <xsl:choose>
                            <xsl:when test="ZgwZaak/heeftAlsInitiator/gerelateerde/natuurlijkPersoon">
                                <xsl:apply-templates select="natuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsInitiator/gerelateerde/nietNatuurlijkPersoon">
                                <xsl:apply-templates select="nietNatuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsInitiator/gerelateerde/vestiging">
                                <xsl:apply-templates select="vestiging"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsInitiator/gerelateerde/medewerker">
                                <xsl:apply-templates select="medewerker"/>
                            </xsl:when>
                        </xsl:choose>
                    </StUF:heeftAlsInitiator>
                    <StUF:heeftAlsUitvoerende>
                        <xsl:choose>
                            <xsl:when test="ZgwZaak/heeftAlsUitvoerende/gerelateerde/natuurlijkPersoon">
                                <xsl:apply-templates select="natuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsUitvoerende/gerelateerde/nietNatuurlijkPersoon">
                                <xsl:apply-templates select="nietNatuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsUitvoerende/gerelateerde/vestiging">
                                <xsl:apply-templates select="vestiging"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsUitvoerende/gerelateerde/medewerker">
                                <xsl:apply-templates select="medewerker"/>
                            </xsl:when>
                        </xsl:choose>
                    </StUF:heeftAlsUitvoerende>
                    <StUF:heeftAlsVerantwoordelijke>
                        <xsl:choose>
                            <xsl:when test="ZgwZaak/heeftAlsVerantwoordelijke/gerelateerde/natuurlijkPersoon">
                                <xsl:apply-templates select="natuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsVerantwoordelijke/gerelateerde/nietNatuurlijkPersoon">
                                <xsl:apply-templates select="nietNatuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsVerantwoordelijke/gerelateerde/vestiging">
                                <xsl:apply-templates select="vestiging"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsVerantwoordelijke/gerelateerde/medewerker">
                                <xsl:apply-templates select="medewerker"/>
                            </xsl:when>
                        </xsl:choose>
                    </StUF:heeftAlsVerantwoordelijke>
                    <StUF:heeftAlsOverigBetrokkene>
                        <xsl:choose>
                            <xsl:when test="ZgwZaak/heeftAlsOverigBetrokkene/gerelateerde/natuurlijkPersoon">
                                <xsl:apply-templates select="natuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsOverigBetrokkene/gerelateerde/nietNatuurlijkPersoon">
                                <xsl:apply-templates select="nietNatuurlijkPersoon"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsOverigBetrokkene/gerelateerde/vestiging">
                                <xsl:apply-templates select="vestiging"/>
                            </xsl:when>
                            <xsl:when test="ZgwZaak/heeftAlsOverigBetrokkene/gerelateerde/medewerker">
                                <xsl:apply-templates select="medewerker"/>
                            </xsl:when>
                        </xsl:choose>
                    </StUF:heeftBetrekkingOp>
                    <xsl:apply-templates select="ZgwZaak/isVan/gerelateerde"/>
                    <xsl:apply-templates select="ZgwZaak/heeftAlsDeelzaak/gerelateerde"/>
                    <xsl:apply-templates select="ZgwZaak/heeftAlsHoofdzaak/gerelateerde"/>
                    <xsl:apply-templates select="ZgwZaak/root/heeftBetrekkingOp/gerelateerde"/>
                    <xsl:apply-templates select="ZgwZaak/heeft"/>
                    <xsl:apply-templates select="results/result/heeftRelevant"/>
                </StUF:object>
            </StUF:antwoord>
        </StUF:zakLa01>
	</xsl:template>

    <xsl:template match="ZgwZaak/anderZaakObject">
        <StUF:anderZaakObject>
            <StUF:omschrijving><xsl:value-of select="omschrijving"/></StUF:omschrijving>
            <StUF:aanduiding><xsl:value-of select="aanduiding"/></StUF:aanduiding>
            <StUF:lokatie><xsl:value-of select="lokatie"/></StUF:lokatie>
            <StUF:registratie><xsl:value-of select="registratie"/></StUF:registratie>
        </StUF:anderZaakObject>
    </xsl:template>

    <xsl:template match="ZgwZaak/kenmerken">
        <StUF:kenmerk>
            <StUF:kenmerk><xsl:value-of select="kenmerk"/></StUF:kenmerk>
            <StUF:bron><xsl:value-of select="bron"/></StUF:bron>
        </StUF:kenmerk>
    </xsl:template>

    <xsl:template match="natuurlijkPersoon">
        <StUF:gerelateerde>
            <StUF:natuurlijkPersoon entiteittype="NPS">
                <StUF:inp.bsn><xsl:value-of select="inp.bsn"/></StUF:inp.bsn>
                <StUF:geslachtsnaam><xsl:value-of select="geslachtsnaam"/></StUF:geslachtsnaam>
                <StUF:voorvoegselGeslachtsnaam><xsl:value-of select="voorvoegselGeslachtsnaam"/></StUF:voorvoegselGeslachtsnaam>
                <StUF:voorletters><xsl:value-of select="voorletters"/></StUF:voorletters>
                <StUF:voornamen><xsl:value-of select="voornamen"/></StUF:voornamen>
                <StUF:geslachtsaanduiding><xsl:value-of select="geslachtsaanduiding"/></StUF:geslachtsaanduiding>
                <StUF:geboortedatum><xsl:value-of select="geboortedatum"/></StUF:geboortedatum>
                <xsl:apply-templates select="verblijfsadres"/>
            </StUF:natuurlijkPersoon>
        </StUF:gerelateerde>
    </xsl:template>

    <xsl:template match="nietNatuurlijkPersoon">
        <StUF:gerelateerde>
            <StUF:nietNatuurlijkPersoon entiteittype="NNP">
                <StUF:inn.nnpId><xsl:value-of select="inn.nnpId"/></StUF:inn.nnpId>
                <StUF:ann.identificatie><xsl:value-of select="ann.identificatie"/></StUF:ann.identificatie>
                <StUF:statutaireNaam><xsl:value-of select="statutaireNaam"/></StUF:statutaireNaam>
                <StUF:innRechtsvorm><xsl:value-of select="innRechtsvorm"/></StUF:innRechtsvorm>
                <!-- Missing bezoekadres -->
                <!-- Missing subVerblijfBuitenland -->
            </StUF:nietNatuurlijkPersoon>
        </StUF:gerelateerde>
    </xsl:template>

    <xsl:template match="vestiging">
        <StUF:gerelateerde>
            <StUF:vestiging entiteittype="VES">
                <StUF:vestigingsNummer><xsl:value-of select="vestigingsNummer"/></StUF:vestigingsNummer>
                <StUF:handelsnaam><xsl:value-of select="handelsnaam"/></StUF:handelsnaam>
                <xsl:apply-templates select="verblijfsadres"/>
                <!-- Missing subVerblijfBuitenland -->
            </StUF:vestiging>
        </StUF:gerelateerde>
    </xsl:template>

    <xsl:template match="medewerker">
        <StUF:gerelateerde>
            <StUF:medewerker entiteittype="MDW">
                <StUF:identificatie><xsl:value-of select="identificatie"/></StUF:identificatie>
                <StUF:achternaam><xsl:value-of select="achternaam"/></StUF:achternaam>
                <StUF:voorletters><xsl:value-of select="voorletters"/></StUF:voorletters>
            </StUF:medewerker>
        </StUF:gerelateerde>
    </xsl:template>

    <xsl:template match="verblijfsadres">
        <StUF:verblijfsadres>
            <StUF:aoa.identificatie><xsl:value-of select="aoa.identificatie"/></StUF:aoa.identificatie>
            <StUF:wpl.woonplaatsNaam><xsl:value-of select="wpl.woonplaatsNaam"/></StUF:wpl.woonplaatsNaam>
            <StUF:gor.openbareRuimteNaam><xsl:value-of select="gor.openbareRuimteNaam"/></StUF:gor.openbareRuimteNaam>
            <StUF:gor.straatnaam><xsl:value-of select="gor.straatnaam"/></StUF:gor.straatnaam>
            <StUF:aoa.postcode><xsl:value-of select="aoa.postcode"/></StUF:aoa.postcode>
            <StUF:aoa.huisnummer><xsl:value-of select="aoa.huisnummer"/></StUF:aoa.huisnummer>
            <StUF:aoa.huisletter><xsl:value-of select="aoa.huisletter"/></StUF:aoa.huisletter>
            <StUF:aoa.huisnummertoevoeging><xsl:value-of select="aoa.huisnummertoevoeging"/></StUF:aoa.huisnummertoevoeging>
            <StUF:inp.locatiebeschrijving><xsl:value-of select="inp.locatiebeschrijving"/></StUF:inp.locatiebeschrijving>
        </StUF:verblijfsadres>
    </xsl:template>

    <xsl:template match="ZgwZaak/isVan/gerelateerde">
        <StUF:isVan>
            <StUF:gerelateerde>
                <StUF:omschrijving><xsl:value-of select="omschrijving"/></StUF:omschrijving>
                <StUF:code><xsl:value-of select="code"/></StUF:code>
            </StUF:gerelateerde>
        </StUF:isVan>
    </xsl:template>

    <xsl:template match="ZgwZaak/heeftAlsDeelzaak/gerelateerde">
        <StUF:heeftAlsHoofdzaak>
            <StUF:gerelateerde>
                <StUF:identificatie><xsl:value-of select="code"/></StUF:identificatie>
                <StUF:omschrijving><xsl:value-of select="omschrijving"/></StUF:omschrijving>
            </StUF:gerelateerde>
        </StUF:heeftAlsHoofdzaak>
    </xsl:template>

    <xsl:template match="ZgwZaak/heeftAlsHoofdzaak/gerelateerde">
        <StUF:heeftAlsHoofdzaak>
            <StUF:gerelateerde>
                <StUF:identificatie><xsl:value-of select="code"/></StUF:identificatie>
                <StUF:omschrijving><xsl:value-of select="omschrijving"/></StUF:omschrijving>
            </StUF:gerelateerde>
        </StUF:heeftAlsHoofdzaak>
    </xsl:template>

    <xsl:template match="ZgwZaak/root/heeftBetrekkingOp/gerelateerde">
        <StUF:heeftBetrekkingOpAndere>
            <StUF:gerelateerde>
                <StUF:identificatie><xsl:value-of select="code"/></StUF:identificatie>
                <StUF:omschrijving><xsl:value-of select="omschrijving"/></StUF:omschrijving>
            </StUF:gerelateerde>
        </StUF:heeftBetrekkingOpAndere>
    </xsl:template>

    <xsl:template match="ZgwZaak/heeft">
        <StUF:heeft>
            <StUF:gerelateerde>
                <StUF:zkt.code><xsl:value-of select="gerelateerde/zktOmschrijving"/></StUF:zkt.code>
                <StUF:zkt.omschrijving><xsl:value-of select="gerelateerde/zktCode"/></StUF:zkt.omschrijving>
                <StUF:omschrijving><xsl:value-of select="gerelateerde/omschrijving"/></StUF:omschrijving>
            </StUF:gerelateerde>
            <StUF:indicatieLaatsteStatus><xsl:value-of select="code"/></StUF:indicatieLaatsteStatus>
        </StUF:heeft>
    </xsl:template>

    <xsl:template match="results/result/heeftRelevant">
        <StUF:heeftRelevant>
            <StUF:gerelateerde>
                <StUF:identificatie><xsl:value-of select="gerelateerde/identificatie"/></StUF:identificatie>
                <StUF:dct.omschrijving><xsl:value-of select="gerelateerde/omschrijving"/></StUF:dct.omschrijving>
                <StUF:creatiedatum><xsl:value-of select="gerelateerde/creatiedatum"/></StUF:creatiedatum>
                <StUF:ontvangstdatum><xsl:value-of select="gerelateerde/ontvangstdatum"/></StUF:ontvangstdatum>
                <StUF:titel><xsl:value-of select="gerelateerde/titel"/></StUF:titel>
                <StUF:beschrijving><xsl:value-of select="gerelateerde/beschrijving"/></StUF:beschrijving>
                <StUF:formaat><xsl:value-of select="gerelateerde/formaat"/></StUF:formaat>
                <StUF:taal><xsl:value-of select="gerelateerde/taal"/></StUF:taal>
                <StUF:versie><xsl:value-of select="gerelateerde/versie"/></StUF:versie>
                <StUF:status><xsl:value-of select="gerelateerde/status"/></StUF:status>
                <StUF:verzenddatum><xsl:value-of select="gerelateerde/verzenddatum"/></StUF:verzenddatum>
                <StUF:vertrouwelijkAanduiding><xsl:value-of select="gerelateerde/vertrouwelijkheidaanduiding"/></StUF:vertrouwelijkAanduiding>
                <StUF:auteur><xsl:value-of select="gerelateerde/auteur"/></StUF:auteur>
                <StUF:link><xsl:value-of select="gerelateerde/link"/></StUF:link>
            </StUF:gerelateerde>
            <StUF:titel><xsl:value-of select="titel"/></StUF:titel>
            <StUF:beschrijving><xsl:value-of select="beschrijving"/></StUF:beschrijving>
            <StUF:registratiedatum><xsl:value-of select="registratiedatum"/></StUF:registratiedatum>
        </StUF:heeftRelevant>
    </xsl:template>
</xsl:stylesheet>