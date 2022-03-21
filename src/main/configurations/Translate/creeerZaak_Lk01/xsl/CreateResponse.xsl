<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="UnwrapMessageResult"/>
   
	<xsl:template match="/">
        <status>OK</status>
        <Bv03Bericht>
            <stuurgegevens>
                <berichtcode>Bv03</berichtcode>
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
        </Bv03Bericht>
	</xsl:template>
</xsl:stylesheet>