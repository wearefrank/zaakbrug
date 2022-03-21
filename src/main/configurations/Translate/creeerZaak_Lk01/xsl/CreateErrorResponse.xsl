<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="UnwrapMessageResult"/>
    <xsl:param name="errorReason"/>
    <xsl:param name="errorCode"/>
    <xsl:param name="errorDetailText"/>
    <xsl:param name="errorDetailXML"/>

   
	<xsl:template match="/">
        <Fault>
         <faultcode><xsl:value-of select="$errorCode"/></faultcode>
         <faultstring><xsl:value-of select="$errorReason"/></faultstring>
         <detail>
            <Fo03Bericht>
               <stuurgegevens>
                    <berichtcode>Fo03</berichtcode>
                    <zender>
                        <organisatie><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/ontvanger/organisatie"/></organisatie>
                        <applicatie><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/ontvanger/applicatie"/></applicatie>
                    </zender>
                    <ontvanger>
                        <organisatie><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/zender/organisatie"/></organisatie>
                        <applicatie><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/zender/applicatie"/></applicatie>
                        <gebruiker><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/zender/gebruiker"/></gebruiker>
                    </ontvanger>
                    <referentienummer><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/referentienummer"/></referentienummer>
                    <tijdstipBericht><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/tijdstipBericht"/></tijdstipBericht>
                    <crossRefnummer><xsl:value-of select="$UnwrapMessageResult/zakLk01/stuurgegevens/referentienummer"/></crossRefnummer>
                </stuurgegevens>
               <body>
                  <code><xsl:value-of select="$errorCode"/></code>
                  <plek>server</plek>
                  <omschrijving><xsl:value-of select="$errorReason"/></omschrijving>
                  <details><xsl:value-of select="$errorDetailText"/></details>
                  <detailsXML><xsl:value-of select="$errorDetailXML"/></detailsXML>
	</xsl:template>
</xsl:stylesheet>