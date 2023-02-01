<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" xmlns:xmime="http://www.w3.org/2005/05/xmlmime" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="UnwrapMessageResult"/>
    <xsl:param name="CheckOutZaakDocument"/>
   
	<xsl:template match="/">
        <ZKN:geefZaakdocumentbewerken_Du02>
            <ZKN:stuurgegevens>
                <StUF:berichtcode>Du02</StUF:berichtcode>
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
                <StUF:functie>geefZaakdocumentbewerken</StUF:functie>
            </ZKN:stuurgegevens>
            <ZKN:parameters>
                <ZKN:checkedOutId><xsl:value-of select="$CheckOutZaakDocument/root/lock"/></ZKN:checkedOutId>
            </ZKN:parameters>
            <ZKN:edcLa01 StUF:entiteittype="EDC" StUF:functie="antwoord">
                <ZKN:parameters/>
                <ZKN:antwoord>
                    <ZKN:object StUF:entiteittype="EDC">
                        <ZKN:identificatie><xsl:value-of select="ZdsZaakDocumentInhoud/identificatie"/></ZKN:identificatie>
                        <xsl:if test="ZdsZaakDocumentInhoud/omschrijving">
                            <ZKN:dct.omschrijving><xsl:value-of select="ZdsZaakDocumentInhoud/omschrijving"/></ZKN:dct.omschrijving>
                        </xsl:if>
                        <ZKN:creatiedatum><xsl:value-of select="ZdsZaakDocumentInhoud/creatiedatum"/></ZKN:creatiedatum>
                        <xsl:if test="ZdsZaakDocumentInhoud/ontvangstdatum">
                            <ZKN:ontvangstdatum><xsl:value-of select="ZdsZaakDocumentInhoud/ontvangstdatum"/></ZKN:ontvangstdatum>
                        </xsl:if>
                        <ZKN:titel><xsl:value-of select="ZdsZaakDocumentInhoud/titel"/></ZKN:titel>
                        <xsl:if test="ZdsZaakDocumentInhoud/beschrijving">
                            <ZKN:beschrijving><xsl:value-of select="ZdsZaakDocumentInhoud/beschrijving"/></ZKN:beschrijving>
                        </xsl:if>
                        <ZKN:formaat><xsl:value-of select="ZdsZaakDocumentInhoud/formaat"/></ZKN:formaat>
                        <ZKN:taal><xsl:value-of select="ZdsZaakDocumentInhoud/taal"/></ZKN:taal>
                        <xsl:if test="ZdsZaakDocumentInhoud/versie">
                            <ZKN:versie><xsl:value-of select="ZdsZaakDocumentInhoud/versie"/></ZKN:versie>
                        </xsl:if>
                        <xsl:if test="ZdsZaakDocumentInhoud/status">
                            <ZKN:status><xsl:value-of select="ZdsZaakDocumentInhoud/status"/></ZKN:status>
                        </xsl:if>
                        <xsl:if test="ZdsZaakDocumentInhoud/verzenddatum">
                            <ZKN:verzenddatum><xsl:value-of select="ZdsZaakDocumentInhoud/verzenddatum"/></ZKN:verzenddatum>
                        </xsl:if>
                        <ZKN:vertrouwelijkAanduiding><xsl:value-of select="ZdsZaakDocumentInhoud/vertrouwelijkAanduiding"/></ZKN:vertrouwelijkAanduiding>
                        <ZKN:auteur><xsl:value-of select="ZdsZaakDocumentInhoud/auteur"/></ZKN:auteur>
                        <ZKN:link/>
                        <ZKN:inhoud StUF:bestandsnaam="" xmime:contentType="unknown"><xsl:value-of select="ZdsZaakDocumentInhoud/inhoud"/></ZKN:inhoud>
                        <xsl:apply-templates select="ZdsZaakDocumentInhoud/isRelevantVoor"/>
                    </ZKN:object>
                </ZKN:antwoord>
            </ZKN:edcLa01>
        </ZKN:geefZaakdocumentbewerken_Du02>
	</xsl:template>

    <xsl:template match="ZdsZaakDocumentInhoud/isRelevantVoor">
        <ZKN:isRelevantVoor StUF:entiteittype="EDCZAK">
            <ZKN:gerelateerde StUF:entiteittype="ZAK">
                <ZKN:identificatie><xsl:value-of select="gerelateerde/identificatie"/></ZKN:identificatie>
                <ZKN:omschrijving><xsl:value-of select="gerelateerde/omschrijving"/></ZKN:omschrijving>
            </ZKN:gerelateerde>
        </ZKN:isRelevantVoor>
    </xsl:template>
</xsl:stylesheet>