<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="GetRoltypeResult"/>
    <xsl:param name="PostZgwZaakResult"/>
    <xsl:param name="RoltypeOmschrijving"/>

    <xsl:variable name="Omschrijving"><xsl:value-of select="/role/roltypeOmschrijving"/></xsl:variable>

    <xsl:template match="/">
        <rol>
            <zaak><xsl:value-of select="$PostZgwZaakResult/root/url"/></zaak>
            <xsl:for-each select="$GetRoltypeResult/root/results">
                <xsl:if test="omschrijving = $Omschrijving">
                    <roltype>
                        <xsl:value-of select="url"/>
                    </roltype>
                </xsl:if>
            </xsl:for-each>
            <xsl:apply-templates select="role/gerelateerde/medewerker[@entiteittype='MDW']"/>
            <xsl:apply-templates select="role/gerelateerde/natuurlijkPersoon[@entiteittype='NPS']"/>
        </rol>
    </xsl:template>

    <xsl:template match="role/gerelateerde/medewerker[@entiteittype='MDW']">
        <betrokkeneType>medewerker</betrokkeneType>
        <roltoelichting><xsl:value-of select="concat($RoltypeOmschrijving, ':', achternaam)"/></roltoelichting>
        <betrokkeneIdentificatie>
            <identificatie><xsl:value-of select="identificatie"/></identificatie>
            <achternaam><xsl:value-of select="achternaam"/></achternaam>
            <voorletters><xsl:value-of select="voorletters"/></voorletters>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="role/gerelateerde/natuurlijkPersoon[@entiteittype='NPS']">
        <betrokkeneType>natuurlijk_persoon</betrokkeneType>
        <roltoelichting><xsl:value-of select="concat($RoltypeOmschrijving, ':', achternaam)"/></roltoelichting>
        <betrokkeneIdentificatie>
            <inpBsn><xsl:value-of select="inp.bsn"/></inpBsn>
            <geslachtsnaam><xsl:value-of select="geslachtsnaam"/></geslachtsnaam>
            <voorvoegselGeslachtsnaam><xsl:value-of select="voorvoegselGeslachtsnaam"/></voorvoegselGeslachtsnaam>
            <voorletters><xsl:value-of select="voorletters"/></voorletters>
            <voornamen><xsl:value-of select="voornamen"/></voornamen>
            <geslachtsaanduiding><xsl:value-of select="lower-case(geslachtsaanduiding)"/></geslachtsaanduiding>
            <geboortedatum><xsl:value-of select="zgw:convertZdsDateToZgwDate(zgw:toDate(geboortedatum))"/></geboortedatum>
            <xsl:if test="not(verblijfsadres/aoa.identificatie = '' or verblijfsadres/wpl.woonplaatsNaam = '' or verblijfsadres/gor.openbareRuimteNaam = '' and verblijfsadres/aoa.huisnummer = '')">
            <xsl:apply-templates select="verblijfsadres"/>
            </xsl:if>
        </betrokkeneIdentificatie>
    </xsl:template>

    <xsl:template match="verblijfsadres">
        <verblijfsadres>
            <aoaIdentificatie><xsl:value-of select="aoa.identificatie"/></aoaIdentificatie>
            <wplWoonplaatsNaam><xsl:value-of select="wpl.woonplaatsNaam"/></wplWoonplaatsNaam>
            <gorOpenbareRuimteNaam><xsl:value-of select="gor.openbareRuimteNaam"/></gorOpenbareRuimteNaam>
            <aoaPostcode><xsl:value-of select="aoa.postcode"/></aoaPostcode>
            <aoaHuisnummer><xsl:value-of select="aoa.huisnummer"/></aoaHuisnummer>
            <aoaHuisletter><xsl:value-of select="aoa.huisletter"/></aoaHuisletter>
            <aoaHuisnummertoevoeging><xsl:value-of select="aoa.huisnummertoevoeging"/></aoaHuisnummertoevoeging>
            <inpLocatiebeschrijving><xsl:value-of select="inp.locatiebeschrijving"/></inpLocatiebeschrijving>
        </verblijfsadres>
    </xsl:template>

    <xsl:function name="zgw:toDate" as="xs:date">
    	<xsl:param name="dateStr" as="xs:string"/>
		<xsl:value-of select="xs:date(concat(
            substring($dateStr,1,4),'-',
            substring($dateStr,5,2),'-',
            substring($dateStr,7,2)))"/>
	</xsl:function>

    <xsl:function name="zgw:convertZdsDateToZgwDate" as="xs:string">
    	<xsl:param name="zdsDate" as="xs:date"/>
		<xsl:value-of select="format-date($zdsDate, '[Y0001]-[M01]-[D01]')"/>
	</xsl:function>
</xsl:stylesheet>