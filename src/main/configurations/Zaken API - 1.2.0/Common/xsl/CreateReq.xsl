<xsl:stylesheet exclude-result-prefixes="xsl xs" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="dateTime" />
    
    <xsl:template match="/">
        <zakLv01 xmlns="http://www.egem.nl/StUF/sector/zkn/0310" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<stuurgegevens>
				<StUF:berichtcode>Lv01</StUF:berichtcode>
				<StUF:zender>
					<StUF:organisatie>1900</StUF:organisatie>
					<StUF:applicatie>ZaakDocumentManager</StUF:applicatie>
				</StUF:zender>
				<StUF:ontvanger>
					<StUF:organisatie>1900</StUF:organisatie>
					<StUF:applicatie>CDR</StUF:applicatie>
				</StUF:ontvanger>
				<StUF:referentienummer>c7121ea0-8329-472c-9ccb-29e781e498bf</StUF:referentienummer>
				<StUF:tijdstipBericht><xsl:value-of select="translate($dateTime,'-T:','')" /></StUF:tijdstipBericht>
				<StUF:entiteittype>ZAK</StUF:entiteittype>
			</stuurgegevens>
			<parameters>
				<StUF:sortering>0</StUF:sortering>
				<StUF:indicatorVervolgvraag>false</StUF:indicatorVervolgvraag>
			</parameters>
			<gelijk StUF:entiteittype="ZAK">
				<identificatie><xsl:value-of select="//identificatie"/></identificatie>
			</gelijk>
			<scope>
				<object StUF:entiteittype="ZAK">
					<identificatie xsi:nil="true"/>
					<omschrijving xsi:nil="true"/>
					<toelichting xsi:nil="true"/>
					<isVan StUF:entiteittype="ZAKZKT">
						<gerelateerde StUF:entiteittype="ZKT">
							<omschrijving xsi:nil="true"/>
							<code xsi:nil="true"/>
						</gerelateerde>
					</isVan>
					<heeftAlsInitiator StUF:entiteittype="ZAKBTRINI">
						<gerelateerde/>
					</heeftAlsInitiator>
				</object>
			</scope>
		</zakLv01>
    </xsl:template>
</xsl:stylesheet>