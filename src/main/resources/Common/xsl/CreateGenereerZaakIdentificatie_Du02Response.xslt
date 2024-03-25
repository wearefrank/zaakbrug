<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="Stuurgegevens" as="node()?" />
    <xsl:param name="Identificatie" select="''" as="xs:string" />
   
	<xsl:template match="/">
        <ZKN:genereerZaakIdentificatie_Du02>
            <ZKN:stuurgegevens>
                <StUF:berichtcode>Du02</StUF:berichtcode>
                <StUF:zender>
                    <StUF:organisatie><xsl:value-of select="$Stuurgegevens/stuurgegevens/ontvanger/organisatie"/></StUF:organisatie>
                    <StUF:applicatie><xsl:value-of select="$Stuurgegevens/stuurgegevens/ontvanger/applicatie"/></StUF:applicatie>
                </StUF:zender>
                <StUF:ontvanger>
                    <StUF:organisatie><xsl:value-of select="$Stuurgegevens/stuurgegevens/zender/organisatie"/></StUF:organisatie>
                    <StUF:applicatie><xsl:value-of select="$Stuurgegevens/stuurgegevens/zender/applicatie"/></StUF:applicatie>
                    <StUF:gebruiker><xsl:value-of select="$Stuurgegevens/stuurgegevens/zender/gebruiker"/></StUF:gebruiker>
                </StUF:ontvanger>
                <StUF:referentienummer><xsl:value-of select="$Stuurgegevens/stuurgegevens/referentienummer"/></StUF:referentienummer>
                <StUF:tijdstipBericht><xsl:value-of select="$Stuurgegevens/stuurgegevens/tijdstipBericht"/></StUF:tijdstipBericht>
                <StUF:crossRefnummer><xsl:value-of select="$Stuurgegevens/stuurgegevens/referentienummer"/></StUF:crossRefnummer>
                <StUF:functie>genereerZaakidentificatie</StUF:functie>
            </ZKN:stuurgegevens>
            <ZKN:zaak StUF:entiteittype="ZAK" StUF:functie="entiteit">
                <ZKN:identificatie><xsl:value-of select="$Identificatie"/></ZKN:identificatie>
            </ZKN:zaak>
        </ZKN:genereerZaakIdentificatie_Du02>
	</xsl:template>
</xsl:stylesheet>