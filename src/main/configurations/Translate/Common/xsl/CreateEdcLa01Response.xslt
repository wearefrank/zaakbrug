<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="UnwrapMessageResult"/>
   
	<xsl:template match="/">
        <StUF:edcLa01>
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
                <StUF:entiteittype>EDC</StUF:entiteittype>
            </StUF:stuurgegevens>
            <StUF:antwoord>
                <StUF:object>
                    <StUF:identificatie><xsl:value-of select="ZdsZaakDocumentInhoud/identificatie"/></StUF:identificatie>
                    <StUF:dct.omschrijving><xsl:value-of select="ZdsZaakDocumentInhoud/omschrijving"/></StUF:dct.omschrijving>
                    <StUF:creatiedatum><xsl:value-of select="ZdsZaakDocumentInhoud/creatiedatum"/></StUF:creatiedatum>
                    <StUF:ontvangstdatum><xsl:value-of select="ZdsZaakDocumentInhoud/ontvangstdatum"/></StUF:ontvangstdatum>
                    <StUF:titel><xsl:value-of select="ZdsZaakDocumentInhoud/titel"/></StUF:titel>
                    <StUF:beschrijving><xsl:value-of select="ZdsZaakDocumentInhoud/beschrijving"/></StUF:beschrijving>
                    <StUF:formaat><xsl:value-of select="ZdsZaakDocumentInhoud/formaat"/></StUF:formaat>
                    <StUF:taal><xsl:value-of select="ZdsZaakDocumentInhoud/taal"/></StUF:taal>
                    <StUF:versie><xsl:value-of select="ZdsZaakDocumentInhoud/versie"/></StUF:versie>
                    <StUF:status><xsl:value-of select="ZdsZaakDocumentInhoud/status"/></StUF:status>
                    <StUF:verzenddatum><xsl:value-of select="ZdsZaakDocumentInhoud/verzenddatum"/></StUF:verzenddatum>
                    <StUF:vertrouwelijkAanduiding><xsl:value-of select="ZdsZaakDocumentInhoud/vertrouwelijkAanduiding"/></StUF:vertrouwelijkAanduiding>
                    <StUF:auteur><xsl:value-of select="ZdsZaakDocumentInhoud/auteur"/></StUF:auteur>
                    <StUF:link><xsl:value-of select="ZdsZaakDocumentInhoud/link"/></StUF:link>
                    <StUF:inhoud><xsl:value-of select="ZdsZaakDocumentInhoud/inhoud"/></StUF:inhoud>
                    <xsl:apply-templates select="ZdsZaakDocumentInhoud/isRelevantVoor"/>
                </StUF:object>
            </StUF:antwoord>
        </StUF:edcLa01>
	</xsl:template>

    <xsl:template match="ZdsZaakDocumentInhoud/isRelevantVoor">
        <StUF:isRelevantVoor>
            <StUF:gerelateerde>
                <StUF:identificatie><xsl:value-of select="gerelateerde/identificatie"/></StUF:identificatie>
                <StUF:omschrijving><xsl:value-of select="gerelateerde/omschrijving"/></StUF:omschrijving>
            </StUF:gerelateerde>
        </StUF:isRelevantVoor>
    </xsl:template>
</xsl:stylesheet>