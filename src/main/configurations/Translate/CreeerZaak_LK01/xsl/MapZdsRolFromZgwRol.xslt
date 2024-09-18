<xsl:stylesheet exclude-result-prefixes="xs zgw" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" xmlns:BG="http://www.egem.nl/StUF/sector/bg/0310" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" version="3.0">
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
        <xsl:element name="{$RolNaam}">
            <xsl:attribute name="entiteittype" select="$RolEntiteitType"/>
            <gerelateerde>
                <natuurlijkPersoon entiteittype="NPS">
                    <inp.bsn><xsl:value-of select="betrokkeneIdentificatie/inpBsn"/></inp.bsn>
                    <authentiek>N</authentiek>
                    <geslachtsnaam><xsl:value-of select="betrokkeneIdentificatie/geslachtsnaam"/></geslachtsnaam>
                    <voorvoegselGeslachtsnaam><xsl:value-of select="betrokkeneIdentificatie/voorvoegselGeslachtsnaam"/></voorvoegselGeslachtsnaam>
                    <voorletters><xsl:value-of select="betrokkeneIdentificatie/voorletters"/></voorletters>
                    <voornamen><xsl:value-of select="betrokkeneIdentificatie/voornamen"/></voornamen>
                    <geslachtsaanduiding><xsl:value-of select="upper-case(betrokkeneIdentificatie/geslachtsaanduiding)"/></geslachtsaanduiding>
                    <geboortedatum><xsl:if test="betrokkeneIdentificatie/geboortedatum != ''"><xsl:value-of select="zgw:toZdsDate(betrokkeneIdentificatie/geboortedatum)"/></xsl:if></geboortedatum>
                    <xsl:apply-templates select="betrokkeneIdentificatie/verblijfsadres"/>
                </natuurlijkPersoon>
            </gerelateerde>
            <xsl:if test="$ExtraElementen != ''"><xsl:copy-of select="$ExtraElementen" /></xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*[betrokkeneType='niet_natuurlijk_persoon']">
        <xsl:element name="{$RolNaam}">
            <xsl:attribute name="entiteittype" select="$RolEntiteitType"/>
            <gerelateerde>
                <nietNatuurlijkPersoon entiteittype="NNP">
                    <xsl:if test="betrokkeneIdentificatie/innNnpId">
                        <inn.nnpId><xsl:value-of select="betrokkeneIdentificatie/innNnpId"/></inn.nnpId>
                        <authentiek>N</authentiek>
                    </xsl:if>
                    <xsl:if test="betrokkeneIdentificatie/annIdentificatie != ''"><ann.identificatie><xsl:value-of select="betrokkeneIdentificatie/annIdentificatie"/></ann.identificatie></xsl:if>
                    <statutaireNaam><xsl:value-of select="betrokkeneIdentificatie/statutaireNaam"/></statutaireNaam>
                    <inn.rechtsvorm><xsl:value-of select="betrokkeneIdentificatie/innRechtsvorm"/></inn.rechtsvorm>
                    <!-- Missing bezoekadres -->
                    <!-- Missing subVerblijfBuitenland -->
                </nietNatuurlijkPersoon>
            </gerelateerde>
            <xsl:if test="$ExtraElementen != ''"><xsl:copy-of select="$ExtraElementen" /></xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*[betrokkeneType='vestiging']">
        <xsl:element name="{$RolNaam}">
            <xsl:attribute name="entiteittype" select="$RolEntiteitType"/>
            <gerelateerde>
                <vestiging entiteittype="VES">
                    <vestigingsNummer><xsl:value-of select="betrokkeneIdentificatie/vestigingsNummer"/></vestigingsNummer>
                    <handelsnaam><xsl:value-of select="betrokkeneIdentificatie/handelsnaam[1]"/></handelsnaam>
                    <xsl:apply-templates select="betrokkeneIdentificatie/verblijfsadres"/>
                    <!-- Missing subVerblijfBuitenland -->
                </vestiging>
            </gerelateerde>
            <xsl:if test="$ExtraElementen != ''"><xsl:copy-of select="$ExtraElementen" /></xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*[betrokkeneType='medewerker']">
        <xsl:element name="{$RolNaam}">
            <xsl:attribute name="entiteittype" select="$RolEntiteitType"/>
            <gerelateerde>
                <medewerker entiteittype="MDW">
                    <identificatie><xsl:value-of select="betrokkeneIdentificatie/identificatie"/></identificatie>
                    <achternaam><xsl:value-of select="betrokkeneIdentificatie/achternaam"/></achternaam>
                    <voorletters><xsl:value-of select="betrokkeneIdentificatie/voorletters"/></voorletters>
                </medewerker>
            </gerelateerde>
            <xsl:if test="$ExtraElementen != ''"><xsl:copy-of select="$ExtraElementen" /></xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*[betrokkeneType='organisatorische_eenheid']">
        <xsl:element name="{$RolNaam}">
            <xsl:attribute name="entiteittype" select="$RolEntiteitType"/>
            <gerelateerde>
                <organisatorischeEenheid entiteittype="OEH">
                    <identificatie><xsl:value-of select="betrokkeneIdentificatie/identificatie"/></identificatie>
                    <naam><xsl:value-of select="betrokkeneIdentificatie/naam"/></naam>
                    <isGehuisvestIn><xsl:value-of select="betrokkeneIdentificatie/isGehuisvestIn"/></isGehuisvestIn>
                </organisatorischeEenheid>
            </gerelateerde>
            <xsl:if test="$ExtraElementen != ''"><xsl:copy-of select="$ExtraElementen" /></xsl:if>
        </xsl:element>
    </xsl:template>

    <xsl:template match="verblijfsadres">
        <verblijfsadres>
            <aoa.identificatie><xsl:value-of select="aoaIdentificatie"/></aoa.identificatie>
            <authentiek><xsl:value-of select="authentiek"/></authentiek>
            <wpl.woonplaatsNaam><xsl:value-of select="wplWoonplaatsNaam"/></wpl.woonplaatsNaam>
            <gor.openbareRuimteNaam><xsl:value-of select="gorOpenbareRuimteNaam"/></gor.openbareRuimteNaam>
            <gor.straatnaam><xsl:value-of select="gorOpenbareRuimteNaam"/></gor.straatnaam>
            <aoa.postcode><xsl:value-of select="aoaPostcode"/></aoa.postcode>
            <aoa.huisnummer><xsl:value-of select="aoaHuisnummer"/></aoa.huisnummer>
            <aoa.huisletter><xsl:value-of select="aoaHuisletter"/></aoa.huisletter>
            <aoa.huisnummertoevoeging><xsl:value-of select="aoaHuisnummertoevoeging"/></aoa.huisnummertoevoeging>
            <inp.locatiebeschrijving><xsl:value-of select="inpLocatiebeschrijving"/></inp.locatiebeschrijving>
        </verblijfsadres>
    </xsl:template>

</xsl:stylesheet>