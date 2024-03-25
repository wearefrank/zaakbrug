<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8"
		indent="yes" omit-xml-declaration="yes" />
	<xsl:param name="dateTime" />
	<xsl:param name="ZaakTypeCode" />
	<xsl:param name="uuid" />

	<xsl:template match="/">

		<soapenv:Envelope
			xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
			xmlns:ns="http://www.egem.nl/StUF/sector/zkn/0310"
			xmlns:StUF="http://www.egem.nl/StUF/StUF0301"
			xmlns:xlink="http://www.w3.org/1999/xlink"
			xmlns:gml="http://www.opengis.net/gml"
			xmlns:ns1="http://www.egem.nl/StUF/sector/bg/0310">
			<soapenv:Header />
			<soapenv:Body>
				<ns:zakLk01>
					<ns:stuurgegevens>
						<StUF:berichtcode>Lk01</StUF:berichtcode>
						<StUF:zender>
							<!--Optional: -->
							<StUF:organisatie>1900</StUF:organisatie>
							<StUF:applicatie>GWS4all</StUF:applicatie>
							<!--Optional: -->
							<StUF:gebruiker>Gebruiker</StUF:gebruiker>
						</StUF:zender>
						<StUF:ontvanger>
							<!--Optional: -->
							<StUF:organisatie>1900</StUF:organisatie>
							<StUF:applicatie>CDR</StUF:applicatie>
						</StUF:ontvanger>
						<StUF:referentienummer>
							<xsl:value-of select="$uuid" />
						</StUF:referentienummer> <!-- TODO -->
						<StUF:tijdstipBericht>
							<xsl:value-of select="translate($dateTime,'-T:','')" />
						</StUF:tijdstipBericht>
						<StUF:entiteittype>ZAK</StUF:entiteittype>
					</ns:stuurgegevens>
					<ns:parameters>
						<StUF:mutatiesoort>T</StUF:mutatiesoort>
						<StUF:indicatorOvername>V</StUF:indicatorOvername>
					</ns:parameters>

					<ns:object StUF:entiteittype="ZAK" StUF:sleutelVerzendend="ZK2023-00024" StUF:verwerkingssoort="T">
						<ns:identificatie>ZK2023-00024</ns:identificatie>
						<ns:omschrijving>Aanvraag minimaregelingen (Z)</ns:omschrijving>
						<ns:kenmerk>
							<ns:kenmerk>273846</ns:kenmerk>
							<ns:bron>GWS4all</ns:bron>
						</ns:kenmerk>
						<ns:startdatum>
							<xsl:value-of select="substring(translate($dateTime,'-T:',''),1,8)" />
						</ns:startdatum>
						<ns:registratiedatum>
							<xsl:value-of select="substring(translate($dateTime,'-T:',''),1,8)" />
						</ns:registratiedatum>
						<ns:einddatumGepland>20210101</ns:einddatumGepland>
						<ns:verlenging>
							<ns:duur>99</ns:duur>
							<ns:reden>Overig</ns:reden>
						</ns:verlenging>
						<ns:archiefnominatie>J</ns:archiefnominatie>
						<ns:zaakniveau>1</ns:zaakniveau>
						<ns:deelzakenIndicatie>N</ns:deelzakenIndicatie>
						<ns:isVan StUF:entiteittype="ZAKZKT" StUF:verwerkingssoort="T">
							<ns:gerelateerde StUF:entiteittype="ZKT" StUF:verwerkingssoort="T">
								<ns:omschrijving>Aanvraag minima</ns:omschrijving>
								<!--Optional: -->
								<ns:code>
									<xsl:value-of select="$ZaakTypeCode" />
								</ns:code>
								<!-- <ns:ingangsdatumObject StUF:noValue="geenWaarde"
									 /> -->
							</ns:gerelateerde>

						</ns:isVan>
						<!-- <ns:heeftBetrekkingOp StUF:entiteittype="ZAKOBJ" StUF:verwerkingssoort="T">
							<ns:gerelateerde>
								<ns:natuurlijkPersoon StUF:entiteittype="NPS" StUF:verwerkingssoort="T">
									<ns1:inp.bsn>111111110</ns1:inp.bsn>
									<ns1:authentiek metagegeven="true">J</ns1:authentiek>
									<ns1:geslachtsnaam>Precies</ns1:geslachtsnaam>
									<ns1:voorvoegselGeslachtsnaam StUF:noValue="geenWaarde"  />
									<ns1:voorletters>P</ns1:voorletters>
									<ns1:voornamen>Pietje</ns1:voornamen>
									<ns1:geslachtsaanduiding>M</ns1:geslachtsaanduiding>
									<ns1:geboortedatum StUF:indOnvolledigeDatum="V">19010101</ns1:geboortedatum>
									<ns1:verblijfsadres>
										<ns1:aoa.identificatie StUF:noValue="geenWaarde"  />
										<ns1:authentiek metagegeven="true">J</ns1:authentiek>
										<ns1:wpl.woonplaatsNaam>Bolsward</ns1:wpl.woonplaatsNaam>
										<ns1:gor.openbareRuimteNaam StUF:noValue="geenWaarde"  />
										<ns1:gor.straatnaam>Kerkstraat</ns1:gor.straatnaam>
										<ns1:aoa.postcode>8701HP</ns1:aoa.postcode>
										<ns1:aoa.huisnummer>1</ns1:aoa.huisnummer>
										<ns1:aoa.huisletter StUF:noValue="geenWaarde"  />
										<ns1:aoa.huisnummertoevoeging StUF:noValue="geenWaarde"  />
										<ns1:inp.locatiebeschrijving StUF:noValue="geenWaarde"  />
									</ns1:verblijfsadres>
								</ns:natuurlijkPersoon>
							</ns:gerelateerde>
							<ns:omschrijving>Client</ns:omschrijving>
						</ns:heeftBetrekkingOp>
						<ns:heeftAlsBelanghebbende StUF:entiteittype="ZAKBTRBLH" StUF:verwerkingssoort="T">
							<ns:gerelateerde>
								<ns:natuurlijkPersoon StUF:entiteittype="NPS" StUF:verwerkingssoort="T">
									<ns1:inp.bsn>111111110</ns1:inp.bsn>
									<ns1:authentiek metagegeven="true">J</ns1:authentiek>
									<ns1:geslachtsnaam>Precies</ns1:geslachtsnaam>
									<ns1:voorvoegselGeslachtsnaam StUF:noValue="geenWaarde"  />
									<ns1:voorletters>P</ns1:voorletters>
									<ns1:voornamen>Pietje</ns1:voornamen>
									<ns1:geslachtsaanduiding>M</ns1:geslachtsaanduiding>
									<ns1:geboortedatum StUF:indOnvolledigeDatum="V">19010101</ns1:geboortedatum>
									<ns1:verblijfsadres>
										<ns1:aoa.identificatie StUF:noValue="geenWaarde"  />
										<ns1:authentiek metagegeven="true">J</ns1:authentiek>
										<ns1:wpl.woonplaatsNaam>Bolsward</ns1:wpl.woonplaatsNaam>
										<ns1:gor.openbareRuimteNaam StUF:noValue="geenWaarde"  />
										<ns1:gor.straatnaam>Kerkstraat</ns1:gor.straatnaam>
										<ns1:aoa.postcode>8701HP</ns1:aoa.postcode>
										<ns1:aoa.huisnummer>1</ns1:aoa.huisnummer>
										<ns1:aoa.huisletter StUF:noValue="geenWaarde"  />
										<ns1:aoa.huisnummertoevoeging StUF:noValue="geenWaarde"  />
										<ns1:inp.locatiebeschrijving StUF:noValue="geenWaarde"  />
									</ns1:verblijfsadres>
								</ns:natuurlijkPersoon>
							</ns:gerelateerde>
							<ns:omschrijving>Client</ns:omschrijving>
						</ns:heeftAlsBelanghebbende>
						<ns:heeftAlsInitiator StUF:entiteittype="ZAKBTRINI" StUF:verwerkingssoort="T">
							<ns:gerelateerde>
								<ns:natuurlijkPersoon StUF:entiteittype="NPS" StUF:verwerkingssoort="T">
									<ns1:inp.bsn>111111110</ns1:inp.bsn>
									<ns1:authentiek metagegeven="true">J</ns1:authentiek>
									<ns1:geslachtsnaam>Precies</ns1:geslachtsnaam>
									<ns1:voorvoegselGeslachtsnaam StUF:noValue="geenWaarde"  />
									<ns1:voorletters>P</ns1:voorletters>
									<ns1:voornamen>Pietje</ns1:voornamen>
									<ns1:geslachtsaanduiding>M</ns1:geslachtsaanduiding>
									<ns1:geboortedatum StUF:indOnvolledigeDatum="V">19010101
									</ns1:geboortedatum>
									<ns1:verblijfsadres>
										<ns1:aoa.identificatie StUF:noValue="geenWaarde"  />
										<ns1:authentiek metagegeven="true">J</ns1:authentiek>
										<ns1:wpl.woonplaatsNaam>Bolsward</ns1:wpl.woonplaatsNaam>
										<ns1:gor.openbareRuimteNaam StUF:noValue="geenWaarde"  />
										<ns1:gor.straatnaam>Kerkstraat</ns1:gor.straatnaam>
										<ns1:aoa.postcode>8701HP</ns1:aoa.postcode>
										<ns1:aoa.huisnummer>1</ns1:aoa.huisnummer>
										<ns1:aoa.huisletter StUF:noValue="geenWaarde"  />
										<ns1:aoa.huisnummertoevoeging StUF:noValue="geenWaarde"  />
										<ns1:inp.locatiebeschrijving StUF:noValue="geenWaarde"  />
									</ns1:verblijfsadres>
								</ns:natuurlijkPersoon>
							</ns:gerelateerde>
						</ns:heeftAlsInitiator>
						<ns:heeftAlsUitvoerende StUF:entiteittype="ZAKBTRUTV" StUF:verwerkingssoort="T">
							<ns:gerelateerde>
								<ns:medewerker StUF:entiteittype="MDW" StUF:verwerkingssoort="T">
									<ns:identificatie>012345678901234567890123</ns:identificatie>
									<ns:achternaam>G. Bruiker</ns:achternaam>
									<ns:voorletters StUF:noValue="geenWaarde"  />
								</ns:medewerker>
							</ns:gerelateerde>
							<ns:heeftAlsAanspreekpunt StUF:entiteittype="ZAKBTRUTVCTP" StUF:verwerkingssoort="T">
								<ns:gerelateerde StUF:entiteittype="CTP" StUF:verwerkingssoort="T">
									<ns:identificatie>012345678901234567890123</ns:identificatie>
									<ns:naam>G. Bruiker</ns:naam>
									<ns:telefoonnummer>0515489000</ns:telefoonnummer>
									<ns:emailadres>info@sudwestfryslan.nl</ns:emailadres>
								</ns:gerelateerde>
							</ns:heeftAlsAanspreekpunt>
						</ns:heeftAlsUitvoerende>
						<ns:heeftAlsVerantwoordelijke StUF:entiteittype="ZAKBTRVRA" StUF:verwerkingssoort="T">
							<ns:gerelateerde>
								<ns:medewerker StUF:entiteittype="MDW" StUF:verwerkingssoort="T">
									<ns:identificatie>012345678901234567890123</ns:identificatie>
									<ns:achternaam>G. Bruiker</ns:achternaam>
									<ns:voorletters StUF:noValue="geenWaarde"  />
								</ns:medewerker>
							</ns:gerelateerde>
							<ns:heeftAlsAanspreekpunt StUF:entiteittype="ZAKBTRVRACTP" StUF:verwerkingssoort="T">
								<ns:gerelateerde StUF:entiteittype="CTP" StUF:verwerkingssoort="T">
									<ns:identificatie>012345678901234567890123</ns:identificatie>
									<ns:naam>G. Bruiker</ns:naam>
									<ns:telefoonnummer>0515489000</ns:telefoonnummer>
									<ns:emailadres>info@sudwestfryslan.nl</ns:emailadres>
								</ns:gerelateerde>
							</ns:heeftAlsAanspreekpunt>
						</ns:heeftAlsVerantwoordelijke>
						<ns:heeft StUF:entiteittype="ZAKSTT" StUF:verwerkingssoort="T">
							<ns:gerelateerde StUF:entiteittype="STT" StUF:verwerkingssoort="T">
								<ns:zkt.code>B1026</ns:zkt.code>
								<ns:zkt.omschrijving>Aanvraag minima</ns:zkt.omschrijving>
								<ns:volgnummer>0001</ns:volgnummer>
								<ns:code>ontv</ns:code>
								<ns:omschrijving>Ontvangen</ns:omschrijving>
								<ns:ingangsdatumObject StUF:noValue="geenWaarde"  />
							</ns:gerelateerde>
							<ns:datumStatusGezet>20230606055639283</ns:datumStatusGezet>
							<ns:isGezetDoor StUF:entiteittype="ZAKSTTBTR" StUF:verwerkingssoort="T">
								<ns:gerelateerde>
									<ns:medewerker StUF:entiteittype="MDW" StUF:verwerkingssoort="T">
										<ns:identificatie>012345678901234567890123</ns:identificatie>
										<ns:achternaam>G. Bruiker</ns:achternaam>
										<ns:voorletters StUF:noValue="geenWaarde"  />
									</ns:medewerker>
								</ns:gerelateerde>
							</ns:isGezetDoor>
						</ns:heeft> -->
					</ns:object>
				</ns:zakLk01>

			</soapenv:Body>
		</soapenv:Envelope>

	</xsl:template>
</xsl:stylesheet>