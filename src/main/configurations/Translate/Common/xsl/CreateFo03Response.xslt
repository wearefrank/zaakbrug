<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="UnwrapMessageResult"/>
    <xsl:param name="errorReason"/>
    <xsl:param name="errorCode"/>
    <xsl:param name="errorDetailText"/>
    <xsl:param name="errorDetailXML"/>
    
    <xsl:template match="/">
        <SOAP-ENV:Fault>
            <faultcode>SOAP-ENV:Server</faultcode>
            <faultstring><xsl:value-of select="$errorReason"/></faultstring>
            <detail>
                <StUF:Fo03Bericht>
                    <StUF:stuurgegevens>
                        <StUF:berichtcode>Fo03</StUF:berichtcode>
                        <StUF:zender>
                            <StUF:organisatie><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/ontvanger/organisatie"/></StUF:organisatie>
                            <StUF:applicatie><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/ontvanger/applicatie"/></StUF:applicatie>
                        </StUF:zender>
                        <StUF:ontvanger>
                            <StUF:organisatie><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/zender/organisatie"/></StUF:organisatie>
                            <StUF:applicatie><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/zender/applicatie"/></StUF:applicatie>
                            <StUF:gebruiker><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/zender/gebruiker"/></StUF:gebruiker>
                        </StUF:ontvanger>
                        <StUF:referentienummer><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/referentienummer"/></StUF:referentienummer>
                        <StUF:tijdstipBericht><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/tijdstipBericht"/></StUF:tijdstipBericht>
                        <StUF:crossRefnummer><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/referentienummer"/></StUF:crossRefnummer>
                    </StUF:stuurgegevens>
                    <StUF:body>
                        <StUF:code><xsl:value-of select="$errorCode"/></StUF:code>
                        <StUF:plek>server</StUF:plek>
                        <StUF:omschrijving><xsl:value-of select="$errorReason"/></StUF:omschrijving>
                        <StUF:details><xsl:value-of select="$errorDetailText"/></StUF:details>
                        <StUF:detailsXML><xsl:value-of select="$errorDetailXML"/></StUF:detailsXML>
                    </StUF:body>
                </StUF:Fo03Bericht>
            </detail>
        </SOAP-ENV:Fault>
    </xsl:template>
</xsl:stylesheet>