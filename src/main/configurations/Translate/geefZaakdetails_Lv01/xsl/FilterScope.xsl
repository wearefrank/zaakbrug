<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="ZdsZaak" as="node()" />
    <xsl:param name="Scope" as="node()" />

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()[
                not(self::tijdvakRelatie) and
                not(self::tijdvakGeldigheid) and
                not(self::tijdstipRegistratie) and
                not(self::historieMaterieel) and
                not(self::historieFormeel) and
                not(self::historieFormeelRelatie)
            ]"/>        
        </xsl:copy>
    </xsl:template>

    <!-- Match for other cases -->
    <xsl:template match="/zakLv01[scope/object/@scope = 'alles']">
            <xsl:apply-templates select="$ZdsZaak/*" />
    </xsl:template>

    <xsl:template match="/zakLv01" priority="0">
        <xsl:copy select="$ZdsZaak/*">
            <xsl:copy-of select="@*" />
            <xsl:copy-of select="$ZdsZaak/*:object/*:identificatie" />
            <xsl:if test="$Scope/scope/object/omschrijving">
                <xsl:copy-of select="$ZdsZaak/*:object/*:omschrijving" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/toelichting">
                <xsl:copy-of select="$ZdsZaak/*:object/*:toelichting" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/kenmerk">
                <xsl:copy-of select="$ZdsZaak/*:object/*:kenmerk" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/anderZaakObject">
                <xsl:copy-of select="$ZdsZaak/*:object/*:anderZaakObject" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/resultaat">
                <xsl:copy-of select="$ZdsZaak/*:object/*:resultaat" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/startdatum">
                <xsl:copy-of select="$ZdsZaak/*:object/*:startdatum" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/registratiedatum">
                <xsl:copy-of select="$ZdsZaak/*:object/*:registratiedatum" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/publicatiedatum">
                <xsl:copy-of select="$ZdsZaak/*:object/*:publicatiedatum" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/einddatumGepland">
                <xsl:copy-of select="$ZdsZaak/*:object/*:einddatumGepland" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/uiterlijkeEinddatum">
                <xsl:copy-of select="$ZdsZaak/*:object/*:uiterlijkeEinddatum" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/einddatum">
                <xsl:copy-of select="$ZdsZaak/*:object/*:einddatum" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/opschorting">
                <xsl:copy-of select="$ZdsZaak/*:object/*:opschorting" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/verlenging">
                <xsl:copy-of select="$ZdsZaak/*:object/*:verlenging" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/betalingsIndicatie">
                <xsl:copy-of select="$ZdsZaak/*:object/*:betalingsIndicatie" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/laatsteBetaaldatum">
                <xsl:copy-of select="$ZdsZaak/*:object/*:laatsteBetaaldatum" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/archiefnominatie">
                <xsl:copy-of select="$ZdsZaak/*:object/archiefnominatie" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/datumVernietigingDossier">
                <xsl:copy-of select="$ZdsZaak/*:object/*:datumVernietigingDossier" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/zaakniveau">
                <xsl:copy-of select="$ZdsZaak/*:object/*:zaakniveau" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/deelzakenIndicatie">
                <xsl:copy-of select="$ZdsZaak/*:object/*:deelzakenIndicatie" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/isVan">
                <ZKN:isVan StUF:entiteittype="ZAKZKT">
                    <ZKN:gerelateerde StUF:entiteittype="ZKT">
                        <xsl:copy-of select="$ZdsZaak/*:object/*:isVan/*:gerelateerde/*:omschrijving" />
                        <xsl:copy-of select="$ZdsZaak/*:object/*:isVan/*:gerelateerde/*:code" />
                    </ZKN:gerelateerde>
                </ZKN:isVan>
            </xsl:if>
            <xsl:if test="$Scope/scope/object/heeftBetrekkingOp">
                <xsl:copy-of select="$ZdsZaak/*:object/*:heeftBetrekkingOp" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/heeftAlsBelanghebbende">
                <xsl:copy-of select="$ZdsZaak/*:object/*:heeftAlsBelanghebbende" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/heeftAlsGemachtigde">
                <xsl:copy-of select="$ZdsZaak/*:object/*:heeftAlsGemachtigde" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/heeftAlsInitiator">
                <xsl:copy-of select="$ZdsZaak/*:object/*:heeftAlsInitiator" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/heeftAlsUitvoerende">
                <xsl:copy-of select="$ZdsZaak/*:object/*:heeftAlsUitvoerende" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/heeftAlsVerantwoordelijke">
                <xsl:copy-of select="$ZdsZaak/*:object/*:heeftAlsVerantwoordelijke" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/heeftAlsOverigBetrokkene">
                <xsl:copy-of select="$ZdsZaak/*:object/*:heeftAlsOverigBetrokkene" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/heeft">
                <xsl:copy-of select="$ZdsZaak/*:object/*:heeft" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/heeftRelevant">
                <xsl:copy-of select="$ZdsZaak/*:object/*:heeftRelevant" />
            </xsl:if>
            <xsl:if test="$Scope/scope/object/leidtTot">
                <xsl:copy-of select="$ZdsZaak/*:object/*:leidtTot" />
            </xsl:if>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>