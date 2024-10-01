<xsl:stylesheet exclude-result-prefixes="xs zgw" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" xmlns:BG="http://www.egem.nl/StUF/sector/bg/0310" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="3.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

    <xsl:param name="RolNaam" />
    <xsl:param name="RolEntiteitType" />
    <xsl:param name="ExtraElementen" as="node()?"><StUF:extraElementen/></xsl:param>
    
    <xsl:function name="zgw:toZdsDate" as="xs:string">
        <xsl:param name="dateStr" as="xs:string"/>
        <xsl:if test="string-length($dateStr) > 0">
            <xsl:value-of select="concat(substring($dateStr,1,4), substring($dateStr,6,2), substring($dateStr,9,2))"/>
        </xsl:if>
	</xsl:function>

    <xsl:template match="/">
        <xsl:apply-templates select="@*|node()"/>
    </xsl:template>

    <xsl:template match="*[betrokkeneType='natuurlijk_persoon']">
        <xsl:element name="ZKN:{$RolNaam}">
            <xsl:attribute name="StUF:entiteittype" select="$RolEntiteitType"/>
            <ZKN:gerelateerde>
                <ZKN:natuurlijkPersoon StUF:entiteittype="NPS">
                    <xsl:if test="betrokkeneIdentificatie/inpBsn != ''">
                        <BG:inp.bsn><xsl:value-of select="betrokkeneIdentificatie/inpBsn"/></BG:inp.bsn>
                        <BG:authentiek StUF:metagegeven="true">N</BG:authentiek> <!-- Required by ZDS schema, but no place to store in ZGW -->
                    </xsl:if>
                    <xsl:if test="betrokkeneIdentificatie/geslachtsnaam != ''">
                        <BG:geslachtsnaam><xsl:value-of select="betrokkeneIdentificatie/geslachtsnaam"/></BG:geslachtsnaam>
                    </xsl:if>
                    <xsl:if test="betrokkeneIdentificatie/voorvoegselGeslachtsnaam != ''">
                        <BG:voorvoegselGeslachtsnaam><xsl:value-of select="betrokkeneIdentificatie/voorvoegselGeslachtsnaam"/></BG:voorvoegselGeslachtsnaam>
                    </xsl:if>
                    <xsl:if test="betrokkeneIdentificatie/voorletters != ''">
                        <BG:voorletters><xsl:value-of select="betrokkeneIdentificatie/voorletters"/></BG:voorletters>
                    </xsl:if>
                    <xsl:if test="betrokkeneIdentificatie/voornamen != ''">
                        <BG:voornamen><xsl:value-of select="betrokkeneIdentificatie/voornamen"/></BG:voornamen>
                    </xsl:if>
                    <xsl:if test="betrokkeneIdentificatie/geslachtsaanduiding != ''">
                        <BG:geslachtsaanduiding><xsl:value-of select="upper-case(betrokkeneIdentificatie/geslachtsaanduiding)"/></BG:geslachtsaanduiding>
                    </xsl:if>
                    <xsl:if test="betrokkeneIdentificatie/geboortedatum != ''">
                        <BG:geboortedatum><xsl:value-of select="zgw:toZdsDate(betrokkeneIdentificatie/geboortedatum)"/></BG:geboortedatum>
                    </xsl:if>
                    <xsl:apply-templates select="betrokkeneIdentificatie/verblijfsadres"/>
                </ZKN:natuurlijkPersoon>
            </ZKN:gerelateerde>
            <xsl:if test="string-length($ExtraElementen) gt 0"><xsl:copy-of select="$ExtraElementen" /></xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*[betrokkeneType='niet_natuurlijk_persoon']">
        <xsl:element name="ZKN:{$RolNaam}">
            <xsl:attribute name="StUF:entiteittype" select="$RolEntiteitType"/>
            <ZKN:gerelateerde>
                <ZKN:nietNatuurlijkPersoon StUF:entiteittype="NNP">
                    <xsl:if test="betrokkeneIdentificatie/innNnpId != ''">
                        <BG:inn.nnpId><xsl:value-of select="betrokkeneIdentificatie/innNnpId" /></BG:inn.nnpId>
                        <BG:authentiek StUF:metagegeven="true">N</BG:authentiek> <!-- Required by ZDS schema, but no place to store in ZGW -->
                    </xsl:if>
                    <xsl:if test="betrokkeneIdentificatie/annIdentificatie != ''">
                        <BG:ann.identificatie><xsl:value-of select="betrokkeneIdentificatie/annIdentificatie"/></BG:ann.identificatie>
                    </xsl:if>
                    <xsl:if test="betrokkeneIdentificatie/statutaireNaam != ''">
                        <BG:statutaireNaam><xsl:value-of select="betrokkeneIdentificatie/statutaireNaam"/></BG:statutaireNaam>
                    </xsl:if>
                    <xsl:if test="betrokkeneIdentificatie/innRechtsvorm != ''">
                        <BG:inn.rechtsvorm><xsl:value-of select="betrokkeneIdentificatie/innRechtsvorm"/></BG:inn.rechtsvorm>
                    </xsl:if>
                    <!-- Missing bezoekadres -->
                    <!-- Missing subVerblijfBuitenland -->
                </ZKN:nietNatuurlijkPersoon>
            </ZKN:gerelateerde>
            <xsl:if test="string-length($ExtraElementen) gt 0"><xsl:copy-of select="$ExtraElementen" /></xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*[betrokkeneType='vestiging']">
        <xsl:element name="ZKN:{$RolNaam}">
            <xsl:attribute name="StUF:entiteittype" select="$RolEntiteitType"/>
            <ZKN:gerelateerde>
                <ZKN:vestiging StUF:entiteittype="VES">
                    <xsl:if test="betrokkeneIdentificatie/vestigingsNummer != ''">
                        <BG:vestigingsNummer><xsl:value-of select="betrokkeneIdentificatie/vestigingsNummer"/></BG:vestigingsNummer>
                    </xsl:if>
                    <xsl:for-each select="betrokkeneIdentificatie/handelsnaam">
                        <BG:handelsnaam><xsl:value-of select="."/></BG:handelsnaam>
                    </xsl:for-each>
                    <xsl:apply-templates select="betrokkeneIdentificatie/verblijfsadres"/>
                    <!-- Missing subVerblijfBuitenland -->
                </ZKN:vestiging>
            </ZKN:gerelateerde>
            <xsl:if test="string-length($ExtraElementen) gt 0"><xsl:copy-of select="$ExtraElementen" /></xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*[betrokkeneType='medewerker']">
        <xsl:element name="ZKN:{$RolNaam}">
            <xsl:attribute name="StUF:entiteittype" select="$RolEntiteitType"/>
            <ZKN:gerelateerde>
                <ZKN:medewerker StUF:entiteittype="MDW">
                    <xsl:if test="betrokkeneIdentificatie/identificatie != ''">
                        <ZKN:identificatie><xsl:value-of select="betrokkeneIdentificatie/identificatie"/></ZKN:identificatie>
                    </xsl:if>
                    <xsl:if test="betrokkeneIdentificatie/achternaam != ''">
                        <ZKN:achternaam><xsl:value-of select="betrokkeneIdentificatie/achternaam"/></ZKN:achternaam>
                    </xsl:if>
                    <xsl:if test="betrokkeneIdentificatie/voorletters != ''">
                        <ZKN:voorletters><xsl:value-of select="betrokkeneIdentificatie/voorletters"/></ZKN:voorletters>
                    </xsl:if>
                </ZKN:medewerker>
            </ZKN:gerelateerde>
            <xsl:if test="$ExtraElementen != ''"><xsl:copy-of select="$ExtraElementen" /></xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*[betrokkeneType='organisatorische_eenheid']">
        <xsl:element name="ZKN:{$RolNaam}">
            <xsl:attribute name="StUF:entiteittype" select="$RolEntiteitType"/>
            <ZKN:gerelateerde>
                <ZKN:organisatorischeEenheid StUF:entiteittype="OEH">
                    <xsl:if test="betrokkeneIdentificatie/identificatie != ''">
                        <ZKN:identificatie><xsl:value-of select="betrokkeneIdentificatie/identificatie"/></ZKN:identificatie>
                    </xsl:if>
                    <xsl:if test="betrokkeneIdentificatie/naam != ''">
                        <ZKN:naam><xsl:value-of select="betrokkeneIdentificatie/naam"/></ZKN:naam>
                    </xsl:if>
                </ZKN:organisatorischeEenheid>
            </ZKN:gerelateerde>
            <xsl:if test="string-length($ExtraElementen) gt 0"><xsl:copy-of select="$ExtraElementen" /></xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template match="verblijfsadres">
        <xsl:if test="string-length(.) gt 0">
            <BG:verblijfsadres>
                <xsl:if test="aoaIdentificatie != ''">
                    <BG:aoa.identificatie><xsl:value-of select="aoaIdentificatie" /></BG:aoa.identificatie>
                    <BG:authentiek StUF:metagegeven="true"><xsl:value-of select="if (authentiek != '') then authentiek else 'N'"/></BG:authentiek>
                </xsl:if>
                <xsl:if test="wplWoonplaatsNaam != ''">
                    <BG:wpl.woonplaatsNaam><xsl:value-of select="wplWoonplaatsNaam"/></BG:wpl.woonplaatsNaam>
                </xsl:if>
                <xsl:if test="gorOpenbareRuimteNaam != ''">
                    <BG:gor.openbareRuimteNaam><xsl:value-of select="gorOpenbareRuimteNaam"/></BG:gor.openbareRuimteNaam>
                </xsl:if>
                <xsl:if test="gorOpenbareRuimteNaam != ''">
                    <BG:gor.straatnaam><xsl:value-of select="gorOpenbareRuimteNaam"/></BG:gor.straatnaam>
                </xsl:if>
                <xsl:if test="aoaPostcode != ''">
                    <BG:aoa.postcode><xsl:value-of select="aoaPostcode"/></BG:aoa.postcode>
                </xsl:if>
                <xsl:if test="aoaHuisnummer != ''">
                    <BG:aoa.huisnummer><xsl:value-of select="aoaHuisnummer"/></BG:aoa.huisnummer>
                </xsl:if>
                <xsl:if test="aoaHuisletter != ''">
                    <BG:aoa.huisletter><xsl:value-of select="aoaHuisletter"/></BG:aoa.huisletter>
                </xsl:if>
                <xsl:if test="aoaHuisnummertoevoeging != ''">
                    <BG:aoa.huisnummertoevoeging><xsl:value-of select="aoaHuisnummertoevoeging"/></BG:aoa.huisnummertoevoeging>
                </xsl:if>
                <xsl:if test="inpLocatiebeschrijving != ''">
                    <BG:inp.locatiebeschrijving><xsl:value-of select="inpLocatiebeschrijving"/></BG:inp.locatiebeschrijving>
                </xsl:if>
            </BG:verblijfsadres>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>