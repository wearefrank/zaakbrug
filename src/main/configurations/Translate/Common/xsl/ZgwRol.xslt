<xsl:stylesheet exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:zgw="http://www.wearefrank.nl/zgw" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:BG="http://www.egem.nl/StUF/sector/bg/0310" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <xsl:param name="ZgwRolTypen" as="node()"><ZgwRolTypen/></xsl:param>
    <xsl:param name="RolMapping" as="node()"><rolMapping/></xsl:param>
    
    <xsl:variable name="rootName" select="local-name(root()/*)" />
    <xsl:variable name="ZgwRolTypeOmschrijving" select="$RolMapping//rolMapping/*[local-name() = $rootName]/text()" />
    <xsl:variable name="ZgwRolType" select="$ZgwRolTypen//ZgwRolType[omschrijving = $ZgwRolTypeOmschrijving]" />

	<xsl:template match="/">
        <zgwRol>
            <xsl:if test="string-length($ZgwRolType) gt 0">
                <roltype><xsl:value-of select="$ZgwRolType/url"/></roltype>
                <omschrijving><xsl:value-of select="$ZgwRolType/omschrijving"/></omschrijving>
                <omschrijvingGeneriek><xsl:value-of select="$ZgwRolType/omschrijvingGeneriek"/></omschrijvingGeneriek>
            </xsl:if>
            <xsl:apply-templates select="*/*:gerelateerde/*:medewerker[@*:entiteittype='MDW']" />
            <xsl:apply-templates select="*/*:gerelateerde/*:natuurlijkPersoon[@*:entiteittype='NPS']" />
            <xsl:apply-templates select="*/*:gerelateerde/*:nietNatuurlijkPersoon[@*:entiteittype='NNP']" />
            <xsl:apply-templates select="*/*:gerelateerde/*:vestiging[@*:entiteittype='VES']" />
            <xsl:apply-templates select="*/*:gerelateerde/*:organisatorischeEenheid[@*:entiteittype='OEH']" />
        </zgwRol>
    </xsl:template>
	
    <xsl:template match="*/*:gerelateerde/*:medewerker[@*:entiteittype='MDW']">
        <betrokkeneType>medewerker</betrokkeneType>
        <roltoelichting>
            <xsl:choose>
                <xsl:when test="string-length(achternaam) gt 0">
                    <xsl:value-of select="concat($ZgwRolTypeOmschrijving, ':', achternaam)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($ZgwRolTypeOmschrijving, ':', identificatie)"/>
                </xsl:otherwise>
            </xsl:choose>
        </roltoelichting>
        <betrokkeneIdentificatie>
            <xsl:if test="identificatie != ''"><identificatie><xsl:value-of select="identificatie"/></identificatie></xsl:if>
            <xsl:if test="achternaam != ''"><achternaam><xsl:value-of select="achternaam"/></achternaam></xsl:if>
            <xsl:if test="voorletters != ''"><voorletters><xsl:value-of select="voorletters"/></voorletters></xsl:if>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="*/*:gerelateerde/*:natuurlijkPersoon[@*:entiteittype='NPS']">
        <betrokkeneType>natuurlijk_persoon</betrokkeneType>
        <roltoelichting>
            <xsl:choose>
                <xsl:when test="authentiek != ''">
                    <xsl:value-of select="concat($ZgwRolTypeOmschrijving, ':', geslachtsnaam, ', {# authentiek:', authentiek, ' #}')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($ZgwRolTypeOmschrijving, ':', geslachtsnaam)"/>
                </xsl:otherwise>
            </xsl:choose>
        </roltoelichting>
        <betrokkeneIdentificatie>
            <xsl:if test="inp.bsn != ''"><inpBsn><xsl:value-of select="inp.bsn"/></inpBsn></xsl:if>
            <xsl:if test="anp.identificatie != ''"><anpIdentificatie><xsl:value-of select="anp.identificatie"/></anpIdentificatie></xsl:if>
            <xsl:if test="geslachtsnaam != ''"><geslachtsnaam><xsl:value-of select="geslachtsnaam"/></geslachtsnaam></xsl:if>
            <xsl:if test="voorvoegselGeslachtsnaam != ''"><voorvoegselGeslachtsnaam><xsl:value-of select="voorvoegselGeslachtsnaam"/></voorvoegselGeslachtsnaam></xsl:if>
            <xsl:if test="voorletters != ''"><voorletters><xsl:value-of select="voorletters"/></voorletters></xsl:if>
            <xsl:if test="voornamen != ''"><voornamen><xsl:value-of select="voornamen"/></voornamen></xsl:if>
            <xsl:if test="geslachtsaanduiding != ''"><geslachtsaanduiding><xsl:value-of select="lower-case(geslachtsaanduiding)"/></geslachtsaanduiding></xsl:if>
            <xsl:if test="geboortedatum != ''"><geboortedatum><xsl:value-of select="zgw:toZgwDate(geboortedatum)"/></geboortedatum></xsl:if>
            <xsl:if test="verblijfsadres/aoa.identificatie != '' and verblijfsadres/wpl.woonplaatsNaam != '' and verblijfsadres/gor.openbareRuimteNaam != '' and verblijfsadres/aoa.huisnummer != ''">
                <xsl:apply-templates select="verblijfsadres"/>
            </xsl:if>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="*/*:gerelateerde/*:nietNatuurlijkPersoon[@*:entiteittype='NNP']">
        <betrokkeneType>niet_natuurlijk_persoon</betrokkeneType>
        <roltoelichting>
            <xsl:choose>
                <xsl:when test="authentiek != ''">
                    <xsl:value-of select="concat($ZgwRolTypeOmschrijving, ':', statutaireNaam, ', {# authentiek:', authentiek, ' #}')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($ZgwRolTypeOmschrijving, ':', statutaireNaam)"/>
                </xsl:otherwise>
            </xsl:choose>
        </roltoelichting>
        <betrokkeneIdentificatie>
            <xsl:if test="inn.nnpId != ''"><innNnpId><xsl:value-of select="inn.nnpId"/></innNnpId></xsl:if>
            <xsl:if test="ann.identificatie != ''"><annIdentificatie><xsl:value-of select="ann.identificatie"/></annIdentificatie></xsl:if>
            <xsl:if test="statutaireNaam != ''"><statutaireNaam><xsl:value-of select="statutaireNaam"/></statutaireNaam></xsl:if>
            <xsl:if test="inn.rechtsvorm != ''"><innRechtsvorm>
                <xsl:choose>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'besloten vennootschap')">
                        <xsl:value-of select="'besloten_vennootschap'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'economische')">
                        <xsl:value-of select="'cooperatie_europees_economische_samenwerking'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'cooperatieve')">
                        <xsl:value-of select="'europese_cooperatieve_venootschap'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'europese')">
                        <xsl:value-of select="'europese_naamloze_vennootschap'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'kerkelijke')">
                        <xsl:value-of select="'kerkelijke_organisatie'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'naamloze vennootschap')">
                        <xsl:value-of select="'naamloze_vennootschap'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'waarborg')">
                        <xsl:value-of select="'onderlinge_waarborg_maatschappij'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'privaatrechtelijke')">
                        <xsl:value-of select="'overig_privaatrechtelijke_rechtspersoon'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'stichting')">
                        <xsl:value-of select="'stichting'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'vereniging')">
                        <xsl:value-of select="'vereniging'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'eigenaars')">
                        <xsl:value-of select="'vereniging_van_eigenaars'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'publiekrechtelijke')">
                        <xsl:value-of select="'publiekrechtelijke_rechtspersoon'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'firma')">
                        <xsl:value-of select="'vennootschap_onder_firma'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'maatschap')">
                        <xsl:value-of select="'maatschap'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'rederij')">
                        <xsl:value-of select="'rederij'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'commanditaire')">
                        <xsl:value-of select="'commanditaire_vennootschap'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'binnen')">
                        <xsl:value-of select="'kapitaalvennootschap_binnen_eer'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'buitenlandse')">
                        <xsl:value-of select="'overige_buitenlandse_rechtspersoon_vennootschap'"/>
                    </xsl:when>
                    <xsl:when test="contains(lower-case(inn.rechtsvorm), 'buiten')">
                        <xsl:value-of select="'kapitaalvennootschap_buiten_eer'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'overig_privaatrechtelijke_rechtspersoon'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </innRechtsvorm></xsl:if>
            <xsl:if test="verblijfsadres/aoa.identificatie != '' and verblijfsadres/wpl.woonplaatsNaam != '' and verblijfsadres/gor.openbareRuimteNaam != '' and verblijfsadres/aoa.huisnummer != ''">
                <xsl:apply-templates select="verblijfsadres"/>
            </xsl:if>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="*/*:gerelateerde/*:vestiging[@*:entiteittype='VES']">
        <betrokkeneType>vestiging</betrokkeneType>
        <roltoelichting>
            <xsl:choose>
                <xsl:when test="authentiek != ''">
                    <xsl:value-of select="concat($ZgwRolTypeOmschrijving, ':', handelsnaam, ', {# authentiek:', authentiek, ' #}')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($ZgwRolTypeOmschrijving, ':', handelsnaam)"/>
                </xsl:otherwise>
            </xsl:choose>
        </roltoelichting>
        <betrokkeneIdentificatie>
            <xsl:if test="vestigingsNummer != ''"><vestigingsNummer><xsl:value-of select="vestigingsNummer"/></vestigingsNummer></xsl:if>
            <xsl:if test="handelsnaam != ''"><handelsnaam><xsl:value-of select="handelsnaam"/></handelsnaam></xsl:if>
            <xsl:if test="verblijfsadres/aoa.identificatie != '' and verblijfsadres/wpl.woonplaatsNaam != '' and verblijfsadres/gor.openbareRuimteNaam != '' and verblijfsadres/aoa.huisnummer != ''">
                <xsl:apply-templates select="verblijfsadres"/>
            </xsl:if>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="*/*:gerelateerde/*:organisatorischeEenheid[@*:entiteittype='OEH']">
        <betrokkeneType>organisatorische_eenheid</betrokkeneType>
        <roltoelichting>
            <xsl:choose>
                <xsl:when test="string-length(naam) > 0">
                    <xsl:value-of select="concat($ZgwRolTypeOmschrijving, ':', naam)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($ZgwRolTypeOmschrijving, ':', identificatie)"/>
                </xsl:otherwise>
            </xsl:choose>
        </roltoelichting>
        <betrokkeneIdentificatie>
            <xsl:if test="identificatie != ''"><identificatie><xsl:value-of select="identificatie"/></identificatie></xsl:if>
            <xsl:if test="naam != ''"><naam><xsl:value-of select="naam"/></naam></xsl:if>
            <xsl:if test="isGehuisvestIn[. != ''] != ''"><isGehuisvestIn><xsl:value-of select="isGehuisvestIn[. != '']"/></isGehuisvestIn></xsl:if>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="verblijfsadres">
        <verblijfsadres>
            <xsl:if test="aoa.identificatie != ''"><aoaIdentificatie><xsl:value-of select="aoa.identificatie"/></aoaIdentificatie></xsl:if>
            <xsl:if test="wpl.woonplaatsNaam != ''"><wplWoonplaatsNaam><xsl:value-of select="wpl.woonplaatsNaam"/></wplWoonplaatsNaam></xsl:if>
            <xsl:if test="gor.openbareRuimteNaam != ''"><gorOpenbareRuimteNaam><xsl:value-of select="gor.openbareRuimteNaam"/></gorOpenbareRuimteNaam></xsl:if>
            <xsl:if test="aoa.postcode != ''"><aoaPostcode><xsl:value-of select="aoa.postcode"/></aoaPostcode></xsl:if>
            <xsl:if test="aoa.huisnummer != ''"><aoaHuisnummer><xsl:value-of select="aoa.huisnummer"/></aoaHuisnummer></xsl:if>
            <xsl:if test="aoa.huisletter != ''"><aoaHuisletter><xsl:value-of select="aoa.huisletter"/></aoaHuisletter></xsl:if>
            <xsl:if test="aoa.huisnummertoevoeging != ''"><aoaHuisnummertoevoeging><xsl:value-of select="aoa.huisnummertoevoeging"/></aoaHuisnummertoevoeging></xsl:if>
            <xsl:if test="inp.locatiebeschrijving != ''"><inpLocatiebeschrijving><xsl:value-of select="inp.locatiebeschrijving"/></inpLocatiebeschrijving></xsl:if>
        </verblijfsadres>
    </xsl:template>

    <xsl:function name="zgw:toZgwDate">
        <xsl:param name="dateStr"/>
        <xsl:if test="string-length($dateStr) > 0">
            <xsl:value-of select="concat(substring($dateStr,1,4), '-', substring($dateStr,5,2), '-', substring($dateStr,7,2))"/>
        </xsl:if>
    </xsl:function>
</xsl:stylesheet>