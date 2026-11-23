import http from 'k6/http';
import { check } from 'k6';
import { ZAAKBRUG_ZDS_URL } from './config.js';
import { uuid } from './auth.js';

const NAMESPACES =
  'xmlns:BG="http://www.egem.nl/StUF/sector/bg/0310" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" ' +
  'xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" xmlns:xmime="http://www.w3.org/2005/05/xmlmime" ' +
  'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"';
const SOAP_ACTION_PREFIX = 'http://www.egem.nl/StUF/sector/zkn/0310/';

const pad = (value, length = 2) => String(value).padStart(length, '0');

// ZDS timestamps are in UTC (zaakbrug.zds.timezone) and have the format yyyyMMddHHmmssSS
function tijdstipBericht() {
  const now = new Date();
  return (
    `${now.getUTCFullYear()}${pad(now.getUTCMonth() + 1)}${pad(now.getUTCDate())}` +
    `${pad(now.getUTCHours())}${pad(now.getUTCMinutes())}${pad(now.getUTCSeconds())}` +
    `${pad(Math.floor(now.getUTCMilliseconds() / 10))}`
  );
}

function datum() {
  const now = new Date();
  return `${now.getUTCFullYear()}${pad(now.getUTCMonth() + 1)}${pad(now.getUTCDate())}`;
}

function stuurgegevens(berichtcode, extra) {
  return `<ZKN:stuurgegevens>
      <StUF:berichtcode>${berichtcode}</StUF:berichtcode>
      <StUF:zender>
        <StUF:organisatie>1900</StUF:organisatie>
        <StUF:applicatie>TOP</StUF:applicatie>
        <StUF:gebruiker>g.bruiker</StUF:gebruiker>
      </StUF:zender>
      <StUF:ontvanger>
        <StUF:organisatie>1900</StUF:organisatie>
        <StUF:applicatie>CDR</StUF:applicatie>
      </StUF:ontvanger>
      <StUF:referentienummer>${uuid()}</StUF:referentienummer>
      <StUF:tijdstipBericht>${tijdstipBericht()}</StUF:tijdstipBericht>
      ${extra}
    </ZKN:stuurgegevens>`;
}

function envelope(body) {
  return `<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"><SOAP-ENV:Header/><SOAP-ENV:Body>${body}</SOAP-ENV:Body></SOAP-ENV:Envelope>`;
}

// 'name' is used as the name of the step in the k6 metrics, so every step gets its own statistics
function send(service, operation, body) {
  const response = http.post(`${ZAAKBRUG_ZDS_URL}/${service}`, envelope(body), {
    headers: { 'Content-Type': 'text/xml;charset=UTF-8', SOAPAction: `${SOAP_ACTION_PREFIX}${operation}` },
    tags: { name: operation },
    timeout: '300s',
  });
  // ZaakBrug answers SOAP faults with HTTP status 200
  check(response, {
    [`${operation} succeeded`]: (r) => r.status === 200 && !r.body.includes('Fault>'),
  });
  return response;
}

function firstIdentificatie(response) {
  const match = /<(?:\w+:)?identificatie>([^<]+)</.exec(response.body);
  return match ? match[1] : null;
}

export function genereerZaakIdentificatie() {
  const response = send(
    'VrijBericht',
    'genereerZaakIdentificatie_Di02',
    `<ZKN:genereerZaakIdentificatie_Di02 ${NAMESPACES}>${stuurgegevens('Di02', '<StUF:functie>genereerZaakidentificatie</StUF:functie>')}</ZKN:genereerZaakIdentificatie_Di02>`,
  );
  return firstIdentificatie(response);
}

export function genereerDocumentIdentificatie() {
  const response = send(
    'VrijBericht',
    'genereerDocumentIdentificatie_Di02',
    `<ZKN:genereerDocumentIdentificatie_Di02 ${NAMESPACES}>${stuurgegevens('Di02', '<StUF:functie>genereerDocumentidentificatie</StUF:functie>')}</ZKN:genereerDocumentIdentificatie_Di02>`,
  );
  return firstIdentificatie(response);
}

export function creeerZaak(zaakIdentificatie, zaaktypeCode) {
  return send(
    'OntvangAsynchroon',
    'creeerZaak_Lk01',
    `<ZKN:zakLk01 ${NAMESPACES}>
    ${stuurgegevens('Lk01', '<StUF:entiteittype>ZAK</StUF:entiteittype>')}
    <ZKN:parameters>
      <StUF:mutatiesoort>T</StUF:mutatiesoort>
      <StUF:indicatorOvername>V</StUF:indicatorOvername>
    </ZKN:parameters>
    <ZKN:object StUF:sleutelVerzendend="${zaakIdentificatie}" StUF:entiteittype="ZAK" StUF:verwerkingssoort="T">
      <ZKN:identificatie>${zaakIdentificatie}</ZKN:identificatie>
      <ZKN:omschrijving>Performance test zaak</ZKN:omschrijving>
      <ZKN:startdatum>${datum()}</ZKN:startdatum>
      <ZKN:registratiedatum>${datum()}</ZKN:registratiedatum>
      <ZKN:einddatumGepland>20300101</ZKN:einddatumGepland>
      <ZKN:isVan StUF:entiteittype="ZAKZKT" StUF:verwerkingssoort="T">
        <ZKN:gerelateerde StUF:entiteittype="ZKT" StUF:verwerkingssoort="T">
          <ZKN:omschrijving>Performance test zaaktype</ZKN:omschrijving>
          <ZKN:code>${zaaktypeCode}</ZKN:code>
          <ZKN:ingangsdatumObject xsi:nil="true" StUF:noValue="geenWaarde"/>
        </ZKN:gerelateerde>
      </ZKN:isVan>
    </ZKN:object>
  </ZKN:zakLk01>`,
  );
}

export function voegZaakdocumentToe(documentIdentificatie, zaakIdentificatie, documentTypeOmschrijving, documentBase64) {
  return send(
    'OntvangAsynchroon',
    'voegZaakdocumentToe_Lk01',
    `<ZKN:edcLk01 ${NAMESPACES}>
    ${stuurgegevens('Lk01', '<StUF:entiteittype>EDC</StUF:entiteittype>')}
    <ZKN:parameters>
      <StUF:mutatiesoort>T</StUF:mutatiesoort>
      <StUF:indicatorOvername>V</StUF:indicatorOvername>
    </ZKN:parameters>
    <ZKN:object StUF:entiteittype="EDC" StUF:verwerkingssoort="T">
      <ZKN:identificatie>${documentIdentificatie}</ZKN:identificatie>
      <ZKN:dct.omschrijving>${documentTypeOmschrijving}</ZKN:dct.omschrijving>
      <ZKN:creatiedatum>${datum()}</ZKN:creatiedatum>
      <ZKN:ontvangstdatum>${datum()}</ZKN:ontvangstdatum>
      <ZKN:titel>Performance test document.pdf</ZKN:titel>
      <ZKN:formaat>pdf</ZKN:formaat>
      <ZKN:taal>dut</ZKN:taal>
      <ZKN:status>Definitief</ZKN:status>
      <ZKN:vertrouwelijkAanduiding>ZAAKVERTROUWELIJK</ZKN:vertrouwelijkAanduiding>
      <ZKN:auteur>Ge Bruiker</ZKN:auteur>
      <ZKN:inhoud StUF:bestandsnaam="Performance test document.pdf" xmime:contentType="application/pdf">${documentBase64}</ZKN:inhoud>
      <ZKN:isRelevantVoor StUF:entiteittype="EDCZAK" StUF:verwerkingssoort="T">
        <ZKN:gerelateerde StUF:entiteittype="ZAK" StUF:verwerkingssoort="T">
          <ZKN:identificatie>${zaakIdentificatie}</ZKN:identificatie>
        </ZKN:gerelateerde>
      </ZKN:isRelevantVoor>
    </ZKN:object>
  </ZKN:edcLk01>`,
  );
}

const BEANTWOORD_VRAAG_PARAMETERS = `<ZKN:parameters>
      <StUF:sortering>0</StUF:sortering>
      <StUF:indicatorVervolgvraag>false</StUF:indicatorVervolgvraag>
      <StUF:indicatorAfnemerIndicatie>false</StUF:indicatorAfnemerIndicatie>
      <StUF:indicatorAantal>false</StUF:indicatorAantal>
    </ZKN:parameters>`;

export function geefZaakdocumentLezen(documentIdentificatie) {
  return send(
    'BeantwoordVraag',
    'geefZaakdocumentLezen_Lv01',
    `<ZKN:edcLv01 ${NAMESPACES}>
    ${stuurgegevens('Lv01', '<StUF:entiteittype>EDC</StUF:entiteittype>')}
    ${BEANTWOORD_VRAAG_PARAMETERS}
    <ZKN:gelijk StUF:entiteittype="EDC">
      <ZKN:identificatie>${documentIdentificatie}</ZKN:identificatie>
    </ZKN:gelijk>
    <ZKN:scope>
      <ZKN:object StUF:entiteittype="EDC">
        <ZKN:identificatie xsi:nil="true"/>
        <ZKN:dct.omschrijving xsi:nil="true"/>
        <ZKN:creatiedatum xsi:nil="true"/>
        <ZKN:ontvangstdatum xsi:nil="true"/>
        <ZKN:titel xsi:nil="true"/>
        <ZKN:beschrijving xsi:nil="true"/>
        <ZKN:formaat xsi:nil="true"/>
        <ZKN:taal xsi:nil="true"/>
        <ZKN:versie xsi:nil="true"/>
        <ZKN:status xsi:nil="true"/>
        <ZKN:verzenddatum xsi:nil="true"/>
        <ZKN:vertrouwelijkAanduiding xsi:nil="true"/>
        <ZKN:auteur xsi:nil="true"/>
        <ZKN:link xsi:nil="true"/>
        <ZKN:inhoud/>
        <ZKN:isRelevantVoor StUF:entiteittype="EDCZAK">
          <ZKN:gerelateerde StUF:entiteittype="ZAK">
            <ZKN:identificatie xsi:nil="true"/>
          </ZKN:gerelateerde>
        </ZKN:isRelevantVoor>
      </ZKN:object>
    </ZKN:scope>
  </ZKN:edcLv01>`,
  );
}

export function geefLijstZaakdocumenten(zaakIdentificatie) {
  return send(
    'BeantwoordVraag',
    'geefLijstZaakdocumenten_Lv01',
    `<ZKN:zakLv01 ${NAMESPACES}>
    ${stuurgegevens('Lv01', '<StUF:entiteittype>ZAK</StUF:entiteittype>')}
    ${BEANTWOORD_VRAAG_PARAMETERS}
    <ZKN:gelijk StUF:entiteittype="ZAK">
      <ZKN:identificatie>${zaakIdentificatie}</ZKN:identificatie>
    </ZKN:gelijk>
    <ZKN:scope>
      <ZKN:object StUF:entiteittype="ZAK">
        <ZKN:heeftRelevant StUF:entiteittype="ZAKEDC">
          <ZKN:gerelateerde StUF:entiteittype="EDC">
            <ZKN:identificatie xsi:nil="true"/>
            <ZKN:creatiedatum xsi:nil="true"/>
            <ZKN:ontvangstdatum xsi:nil="true"/>
            <ZKN:titel xsi:nil="true"/>
            <ZKN:beschrijving xsi:nil="true"/>
            <ZKN:formaat xsi:nil="true"/>
            <ZKN:taal xsi:nil="true"/>
            <ZKN:versie xsi:nil="true"/>
            <ZKN:status xsi:nil="true"/>
            <ZKN:verzenddatum xsi:nil="true"/>
            <ZKN:vertrouwelijkAanduiding xsi:nil="true"/>
            <ZKN:auteur xsi:nil="true"/>
            <ZKN:link xsi:nil="true"/>
          </ZKN:gerelateerde>
          <ZKN:titel xsi:nil="true"/>
          <ZKN:beschrijving xsi:nil="true"/>
          <ZKN:registratiedatum xsi:nil="true"/>
          <ZKN:stt.volgnummer xsi:nil="true"/>
          <ZKN:stt.omschrijving xsi:nil="true"/>
          <ZKN:sta.datumStatusGezet xsi:nil="true"/>
        </ZKN:heeftRelevant>
      </ZKN:object>
    </ZKN:scope>
  </ZKN:zakLv01>`,
  );
}
