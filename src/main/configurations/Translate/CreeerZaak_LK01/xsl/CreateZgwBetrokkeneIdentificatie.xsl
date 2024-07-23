<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" xmlns:zgw="http://google.com/zgw" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:BG="http://www.egem.nl/StUF/sector/bg/0310" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" exclude-result-prefixes="array fn map math xhtml xs err zgw" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="TypeRolOmschrijving"/>
    
	<xsl:template match="/">
        <zgwRol>
            <xsl:apply-templates select="role/gerelateerde/medewerker[@entiteittype='MDW']"/>
            <xsl:apply-templates select="role/gerelateerde/natuurlijkPersoon[@entiteittype='NPS']"/>
            <xsl:apply-templates select="role/gerelateerde/nietNatuurlijkPersoon[@entiteittype='NNP']"/>
            <xsl:apply-templates select="role/gerelateerde/vestiging[@entiteittype='VES']"/>
            <xsl:apply-templates select="role/gerelateerde/organisatorischeEenheid[@entiteittype='OEH']"/>
        </zgwRol>
    </xsl:template>
	
    <xsl:template match="role/gerelateerde/medewerker[@entiteittype='MDW']">
        <betrokkeneType>medewerker</betrokkeneType>
        <roltoelichting>
            <xsl:choose>
                <xsl:when test="string-length(achternaam) > 0">
                    <xsl:value-of select="concat($TypeRolOmschrijving, ':', achternaam)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($TypeRolOmschrijving, ':', identificatie)"/>
                </xsl:otherwise>
            </xsl:choose>
        </roltoelichting>
        <betrokkeneIdentificatie>
            <identificatie><xsl:value-of select="identificatie"/></identificatie>
            <achternaam><xsl:value-of select="achternaam"/></achternaam>
            <voorletters><xsl:value-of select="voorletters"/></voorletters>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="role/gerelateerde/natuurlijkPersoon[@entiteittype='NPS']">
        <betrokkeneType>natuurlijk_persoon</betrokkeneType>
        <roltoelichting><xsl:value-of select="concat($TypeRolOmschrijving, ':', geslachtsnaam)"/></roltoelichting>
        <betrokkeneIdentificatie>
            <inpBsn><xsl:value-of select="inp.bsn"/></inpBsn>
            <authentiek><xsl:value-of select="authentiek"/></authentiek>
            <geslachtsnaam><xsl:value-of select="geslachtsnaam"/></geslachtsnaam>
            <voorvoegselGeslachtsnaam><xsl:value-of select="voorvoegselGeslachtsnaam"/></voorvoegselGeslachtsnaam>
            <voorletters><xsl:value-of select="voorletters"/></voorletters>
            <voornamen><xsl:value-of select="voornamen"/></voornamen>
            <geslachtsaanduiding><xsl:value-of select="lower-case(geslachtsaanduiding)"/></geslachtsaanduiding>
            <geboortedatum><xsl:value-of select="zgw:toZgwDate(geboortedatum)"/></geboortedatum>
            <xsl:if test="verblijfsadres/aoa.identificatie != '' and verblijfsadres/wpl.woonplaatsNaam != '' and verblijfsadres/gor.openbareRuimteNaam != '' and verblijfsadres/aoa.huisnummer != ''">
                <xsl:apply-templates select="verblijfsadres"/>
            </xsl:if>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="role/gerelateerde/nietNatuurlijkPersoon[@entiteittype='NNP']">
        <betrokkeneType>niet_natuurlijk_persoon</betrokkeneType>
        <roltoelichting><xsl:value-of select="concat($TypeRolOmschrijving, ':', statutaireNaam)"/></roltoelichting>
        <betrokkeneIdentificatie>
            <innNnpId><xsl:value-of select="inn.nnpId"/></innNnpId>
            <authentiek><xsl:value-of select="authentiek"/></authentiek>
            <annIdentificatie><xsl:value-of select="ann.identificatie"/></annIdentificatie>
            <statutaireNaam><xsl:value-of select="statutaireNaam"/></statutaireNaam>
            <innRechtsvorm>
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
            </innRechtsvorm>
            <xsl:if test="verblijfsadres/aoa.identificatie != '' and verblijfsadres/wpl.woonplaatsNaam != '' and verblijfsadres/gor.openbareRuimteNaam != '' and verblijfsadres/aoa.huisnummer != ''">
                <xsl:apply-templates select="verblijfsadres"/>
            </xsl:if>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="role/gerelateerde/vestiging[@entiteittype='VES']">
        <betrokkeneType>vestiging</betrokkeneType>
        <roltoelichting><xsl:value-of select="concat($TypeRolOmschrijving, ':', handelsnaam)"/></roltoelichting>
        <betrokkeneIdentificatie>
            <vestigingsNummer><xsl:value-of select="vestigingsNummer"/></vestigingsNummer>
            <authentiek><xsl:value-of select="authentiek"/></authentiek>
            <handelsnaam><xsl:value-of select="handelsnaam"/></handelsnaam>
            <xsl:if test="verblijfsadres/aoa.identificatie != '' and verblijfsadres/wpl.woonplaatsNaam != '' and verblijfsadres/gor.openbareRuimteNaam != '' and verblijfsadres/aoa.huisnummer != ''">
                <xsl:apply-templates select="verblijfsadres"/>
            </xsl:if>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="role/gerelateerde/organisatorischeEenheid[@entiteittype='OEH']">
        <betrokkeneType>organisatorische_eenheid</betrokkeneType>
        <roltoelichting>
            <xsl:choose>
                <xsl:when test="string-length(naam) > 0">
                    <xsl:value-of select="concat($TypeRolOmschrijving, ':', naam)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($TypeRolOmschrijving, ':', identificatie)"/>
                </xsl:otherwise>
            </xsl:choose>
        </roltoelichting>
        <betrokkeneIdentificatie>
            <identificatie><xsl:value-of select="identificatie"/></identificatie>
            <naam><xsl:value-of select="naam"/></naam>
            <isGehuisvestIn><xsl:value-of select="isGehuisvestIn[. != '']"/></isGehuisvestIn>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="verblijfsadres">
        <verblijfsadres>
            <aoaIdentificatie><xsl:value-of select="aoa.identificatie"/></aoaIdentificatie>
            <authentiek><xsl:value-of select="authentiek"/></authentiek>
            <wplWoonplaatsNaam><xsl:value-of select="wpl.woonplaatsNaam"/></wplWoonplaatsNaam>
            <gorOpenbareRuimteNaam><xsl:value-of select="gor.openbareRuimteNaam"/></gorOpenbareRuimteNaam>
            <aoaPostcode><xsl:value-of select="aoa.postcode"/></aoaPostcode>
            <aoaHuisnummer><xsl:value-of select="aoa.huisnummer"/></aoaHuisnummer>
            <aoaHuisletter><xsl:value-of select="aoa.huisletter"/></aoaHuisletter>
            <aoaHuisnummertoevoeging><xsl:value-of select="aoa.huisnummertoevoeging"/></aoaHuisnummertoevoeging>
            <inpLocatiebeschrijving><xsl:value-of select="inp.locatiebeschrijving"/></inpLocatiebeschrijving>
        </verblijfsadres>
    </xsl:template>

    <xsl:function name="zgw:toZgwDate">
        <xsl:param name="dateStr"/>
        <xsl:if test="string-length($dateStr) > 0">
            <xsl:value-of select="concat(substring($dateStr,1,4), '-', substring($dateStr,5,2), '-', substring($dateStr,7,2))"/>
        </xsl:if>
    </xsl:function>
</xsl:stylesheet>