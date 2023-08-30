<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="ZdsZaak"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()[
                not(self::tijdvakRelatie) and
                not(self::tijdvakGeldigheid) and
                not(self::tijdstipRegistratie) and
                not(self::extraElementen) and
                not(self::historieMaterieel) and
                not(self::historieFormeel) and
                not(self::historieFormeelRelatie)
            ]"/>        
        </xsl:copy>
    </xsl:template>

    <!-- Match for other cases -->
    <xsl:template match="/zakLv01[scope/object/@scope = 'alles']">
        <ZgwZaak>
            <xsl:apply-templates select="$ZdsZaak/root/*"/>
        </ZgwZaak>
    </xsl:template>

    <xsl:template match="/zakLv01" priority="0">
        <ZgwZaak>
            <identificatie><xsl:value-of select="$ZdsZaak/root/identificatie"/></identificatie>
            <xsl:if test="scope/object/omschrijving">
                <omschrijving><xsl:value-of select="$ZdsZaak/root/omschrijving"/></omschrijving>
            </xsl:if>
            <xsl:if test="scope/object/toelichting">
                <toelichting><xsl:value-of select="$ZdsZaak/root/toelichting"/></toelichting>
            </xsl:if>
            <xsl:if test="scope/object/kenmerk">
                <xsl:for-each select="$ZdsZaak/root/kenmerk">
                    <kenmerk>
                        <kenmerk><xsl:value-of select="kenmerk"/></kenmerk>
                        <bron><xsl:value-of select="bron"/></bron>
                    </kenmerk>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/anderZaakObject">
                <xsl:for-each select="$ZdsZaak/root/anderZaakObject">
                    <anderZaakObject>
                        <omschrijving><xsl:value-of select="omschrijving"/></omschrijving>
                        <aanduiding><xsl:value-of select="aanduiding"/></aanduiding>
                        <lokatie><xsl:value-of select="lokatie"/></lokatie>
                        <registratie><xsl:value-of select="registratie"/></registratie>
                    </anderZaakObject>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/resultaat">
                <resultaat>
                    <omschrijving><xsl:value-of select="$ZdsZaak/root/resultaat/omschrijving"/></omschrijving>
                    <toelichting><xsl:value-of select="$ZdsZaak/root/resultaat/toelichting"/></toelichting>
                </resultaat>
            </xsl:if>
            <xsl:if test="scope/object/startdatum">
                <startdatum><xsl:value-of select="$ZdsZaak/root/startdatum"/></startdatum>
            </xsl:if>
            <xsl:if test="scope/object/registratiedatum">
                <registratiedatum><xsl:value-of select="$ZdsZaak/root/registratiedatum"/></registratiedatum>
            </xsl:if>
            <xsl:if test="scope/object/publicatiedatum">
                <publicatiedatum><xsl:value-of select="$ZdsZaak/root/publicatiedatum"/></publicatiedatum>
            </xsl:if>
            <xsl:if test="scope/object/einddatumGepland">
                <einddatumGepland><xsl:value-of select="$ZdsZaak/root/einddatumGepland"/></einddatumGepland>
            </xsl:if>
            <xsl:if test="scope/object/uiterlijkeEinddatum">
                <uiterlijkeEinddatum><xsl:value-of select="$ZdsZaak/root/uiterlijkeEinddatum"/></uiterlijkeEinddatum>
            </xsl:if>
            <xsl:if test="scope/object/einddatum">
                <einddatum><xsl:value-of select="$ZdsZaak/root/einddatum"/></einddatum>
            </xsl:if>
            <xsl:if test="scope/object/opschorting">
                <xsl:for-each select="$ZdsZaak/root/opschorting">
                    <opschorting>
                        <indicatie><xsl:value-of select="indicatie"/></indicatie>
                        <reden><xsl:value-of select="reden"/></reden>
                    </opschorting>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/verlenging">
                <xsl:for-each select="$ZdsZaak/root/verlenging">
                    <verlenging>
                        <duur><xsl:value-of select="duur"/></duur>
                        <reden><xsl:value-of select="reden"/></reden>
                    </verlenging>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/betalingsIndicatie">
                <betalingsIndicatie><xsl:value-of select="$ZdsZaak/root/betalingsIndicatie"/></betalingsIndicatie>
            </xsl:if>
            <xsl:if test="scope/object/laatsteBetaaldatum">
                <laatsteBetaaldatum><xsl:value-of select="$ZdsZaak/root/laatsteBetaaldatum"/></laatsteBetaaldatum>
            </xsl:if>
            <xsl:if test="scope/object/archiefnominatie">
                <archiefnominatie><xsl:value-of select="$ZdsZaak/root/archiefnominatie"/></archiefnominatie>
            </xsl:if>
            <xsl:if test="scope/object/datumVernietigingDossier">
                <datumVernietigingDossier><xsl:value-of select="$ZdsZaak/root/datumVernietigingDossier"/></datumVernietigingDossier>
            </xsl:if>
            <xsl:if test="scope/object/zaakniveau">
                <zaakniveau><xsl:value-of select="$ZdsZaak/root/zaakniveau"/></zaakniveau>
            </xsl:if>
            <xsl:if test="scope/object/deelzakenIndicatie">
                <deelzakenIndicatie><xsl:value-of select="$ZdsZaak/root/deelzakenIndicatie"/></deelzakenIndicatie>
            </xsl:if>
            <xsl:if test="scope/object/isVan">
                <isVan>
                    <gerelateerde>
                        <omschrijving><xsl:value-of select="$ZdsZaak/root/isVan/gerelateerde/omschrijving"/></omschrijving>
                        <code><xsl:value-of select="$ZdsZaak/root/isVan/gerelateerde/code"/></code>
                    </gerelateerde>
                </isVan>
            </xsl:if>
            <xsl:if test="scope/object/heeftBetrekkingOp">
                <xsl:for-each select="$ZdsZaak/root/heeftBetrekkingOp">
                    <heeftBetrekkingOp><xsl:apply-templates select="@*|node()"/></heeftBetrekkingOp>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/heeftAlsBelanghebbende">
                <xsl:for-each select="$ZdsZaak/root/heeftAlsBelanghebbende">
                    <heeftAlsBelanghebbende><xsl:apply-templates select="@*|node()"/></heeftAlsBelanghebbende>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/heeftAlsGemachtigde">
                <xsl:for-each select="$ZdsZaak/root/heeftAlsGemachtigde">
                    <heeftAlsGemachtigde><xsl:apply-templates select="@*|node()"/></heeftAlsGemachtigde>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/heeftAlsInitiator">
                <xsl:for-each select="$ZdsZaak/root/heeftAlsInitiator">
                    <heeftAlsInitiator><xsl:apply-templates select="@*|node()"/></heeftAlsInitiator>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/heeftAlsUitvoerende">
                <xsl:for-each select="$ZdsZaak/root/heeftAlsUitvoerende">
                    <heeftAlsUitvoerende><xsl:apply-templates select="@*|node()"/></heeftAlsUitvoerende>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/heeftAlsVerantwoordelijke">
                <xsl:for-each select="$ZdsZaak/root/heeftAlsVerantwoordelijke">
                    <heeftAlsVerantwoordelijke><xsl:apply-templates select="@*|node()"/></heeftAlsVerantwoordelijke>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/heeftAlsOverigBetrokkene">
                <xsl:for-each select="$ZdsZaak/root/heeftAlsOverigBetrokkene">
                    <heeftAlsOverigBetrokkene><xsl:apply-templates select="@*|node()"/></heeftAlsOverigBetrokkene>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/heeftAlsDeelzaak">
                <xsl:for-each select="$ZdsZaak/root/heeftAlsDeelzaak">
                    <heeftAlsDeelzaak><xsl:apply-templates select="@*|node()"/></heeftAlsDeelzaak>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/heeftAlsHoofdzaak">
                <xsl:for-each select="$ZdsZaak/root/heeftAlsHoofdzaak">
                    <heeftAlsHoofdzaak><xsl:apply-templates select="@*|node()"/></heeftAlsHoofdzaak>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/heeftBetrekkingOpAndere">
                <xsl:for-each select="$ZdsZaak/root/heeftBetrekkingOpAndere">
                    <heeftBetrekkingOpAndere><xsl:apply-templates select="@*|node()"/></heeftBetrekkingOpAndere>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/heeft">
                <xsl:for-each select="$ZdsZaak/root/heeft">
                    <heeft><xsl:apply-templates select="@*|node()"/></heeft>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/heeftRelevant">
                <xsl:for-each select="$ZdsZaak/root/heeftRelevant">
                    <heeftRelevant><xsl:apply-templates select="@*|node()"/></heeftRelevant>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="scope/object/leidtTot">
                <xsl:for-each select="$ZdsZaak/root/leidtTot">
                    <leidtTot><xsl:apply-templates select="@*|node()"/></leidtTot>
                </xsl:for-each>
            </xsl:if>
        </ZgwZaak>
    </xsl:template>
</xsl:stylesheet>