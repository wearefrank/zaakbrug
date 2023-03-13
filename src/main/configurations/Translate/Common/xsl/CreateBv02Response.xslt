<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="UnwrapMessageResult" as="node()?"/>
   
	<xsl:template match="/">
        <StUF:Bv02Bericht>
            <StUF:stuurgegevens>
                <StUF:berichtcode>Bv02</StUF:berichtcode>
            </StUF:stuurgegevens>
        </StUF:Bv02Bericht>
	</xsl:template>
</xsl:stylesheet>