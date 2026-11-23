import http from 'k6/http';
import { fail } from 'k6';
import { CATALOGI_API, ZAKEN_API } from './config.js';
import { createJwt, uuid } from './auth.js';
import { creeerZaak, genereerZaakIdentificatie } from './zds.js';

function params() {
  return {
    headers: {
      Authorization: createJwt(),
      'Content-Type': 'application/json',
      'Accept-Crs': 'EPSG:4326',
      'Content-Crs': 'EPSG:4326',
    },
    tags: { name: 'openzaak' },
  };
}

function call(method, url, body, expectedStatus) {
  const response = http.request(method, url, body ? JSON.stringify(body) : null, params());
  if (response.status !== expectedStatus) {
    fail(`${method} ${url} returned ${response.status} instead of ${expectedStatus}: ${response.body}`);
  }
  return response;
}

const post = (path, body) => call('POST', `${CATALOGI_API}${path}`, body, 201).json();

// Creates the minimal catalog needed for the performance tests: a published zaaktype with a unique code (the ZDS code is
// limited to 10 characters) and a published informatieobjecttype with a unique omschrijving, so tests can run side by side.
export function createCatalog() {
  const suffix = uuid().substring(0, 8).toUpperCase();
  const zaaktypeCode = `PF${suffix}`;
  const informatieobjecttypeOmschrijving = `Brief PF${suffix}`;

  // The catalogus is shared with the other tests, create it when it does not exist yet
  http.post(
    `${CATALOGI_API}/catalogussen`,
    JSON.stringify({
      domein: 'ETESD',
      rsin: '548746485',
      contactpersoonBeheerNaam: 'ZaakBrug',
      contactpersoonBeheerTelefoonnummer: '0612345678',
      contactpersoonBeheerEmailadres: 'zaakbrug@example.com',
    }),
    params(),
  );
  const catalogus = call('GET', `${CATALOGI_API}/catalogussen?domein=ETESD`, null, 200).json('results.0.url');

  const zaaktype = post('/zaaktypen', {
    identificatie: zaaktypeCode,
    omschrijving: 'Performance test zaaktype',
    omschrijvingGeneriek: '',
    vertrouwelijkheidaanduiding: 'vertrouwelijk',
    doel: 'Zaaktype voor de performance tests.',
    aanleiding: 'Performance test',
    toelichting: '',
    indicatieInternOfExtern: 'intern',
    handelingInitiator: 'aanvragen',
    onderwerp: 'onderwerp',
    handelingBehandelaar: 'handelingBehandelaar',
    doorlooptijd: 'P30D',
    servicenorm: null,
    opschortingEnAanhoudingMogelijk: true,
    verlengingMogelijk: false,
    verlengingstermijn: null,
    trefwoorden: [],
    publicatieIndicatie: true,
    publicatietekst: '',
    verantwoordingsrelatie: [],
    productenOfDiensten: ['https://example.com/product'],
    selectielijstProcestype: 'https://selectielijst.openzaak.nl/api/v1/procestypen/aa8aa2fd-b9c6-4e34-9a6c-58a677f60ea0',
    referentieproces: {
      naam: 'Verzoeken behandelen',
      link: 'https://referentielijsten-api.vng.cloud/api/v1/procestypen/3030daa1-d516-4cd9-8276-ef0977e32b20',
    },
    verantwoordelijke: 'Projectleider',
    catalogus,
    besluittypen: [],
    deelzaaktypen: [],
    gerelateerdeZaaktypen: [],
    beginGeldigheid: '2021-03-29',
    eindeGeldigheid: null,
    versiedatum: '2021-03-29',
  });

  // OpenZaak only publishes a zaaktype with at least one resultaattype, one roltype and two statustypen
  post('/resultaattypen', {
    zaaktype: zaaktype.url,
    omschrijving: 'Buiten behandeling g',
    resultaattypeomschrijving:
      'https://selectielijst.openzaak.nl/api/v1/resultaattypeomschrijvingen/a6a0bd73-262a-401a-b629-9c4a908c69b5',
    selectielijstklasse: 'https://selectielijst.openzaak.nl/api/v1/resultaten/4811c2bc-3255-4cd4-a00a-7ed59223b8b1',
    toelichting: '',
    archiefnominatie: 'vernietigen',
    archiefactietermijn: 'P1826D',
    brondatumArchiefprocedure: {
      afleidingswijze: 'afgehandeld',
      datumkenmerk: '',
      einddatumBekend: false,
      objecttype: '',
      registratie: '',
      procestermijn: null,
    },
  });
  post('/roltypen', { zaaktype: zaaktype.url, omschrijving: 'Uitvoerende', omschrijvingGeneriek: 'belanghebbende' });
  [
    ['Ontvangen', 1],
    ['Geaccepteerd', 2],
  ].forEach(([omschrijving, volgnummer]) =>
    post('/statustypen', {
      omschrijving,
      omschrijvingGeneriek: omschrijving,
      statustekst: '',
      zaaktype: zaaktype.url,
      volgnummer,
      informeren: false,
    }),
  );

  const informatieobjecttype = post('/informatieobjecttypen', {
    catalogus,
    omschrijving: informatieobjecttypeOmschrijving,
    vertrouwelijkheidaanduiding: 'intern',
    beginGeldigheid: '2021-03-29',
    eindeGeldigheid: null,
    informatieobjectcategorie: 'Technische Handleidingen',
  });
  post('/zaaktype-informatieobjecttypen', {
    zaaktype: zaaktype.url,
    informatieobjecttype: informatieobjecttype.url,
    volgnummer: 1,
    richting: 'intern',
    statustype: null,
  });

  call('POST', `${informatieobjecttype.url}/publish`, null, 200);
  call('POST', `${zaaktype.url}/publish`, null, 200);

  return {
    zaaktypeUrl: zaaktype.url,
    zaaktypeCode,
    informatieobjecttypeUrl: informatieobjecttype.url,
    informatieobjecttypeOmschrijving,
  };
}

export function deleteCatalog(catalog) {
  call('DELETE', catalog.zaaktypeUrl, null, 204);
  call('DELETE', catalog.informatieobjecttypeUrl, null, 204);
}

// Creates a zaak of the performance zaaktype, the zaak identificatie is returned.
export function createZaak(catalog) {
  const zaakIdentificatie = genereerZaakIdentificatie();
  creeerZaak(zaakIdentificatie, catalog.zaaktypeCode);
  return zaakIdentificatie;
}

// Removes the zaak and the documents added to it. OpenZaak does not remove the documents with the zaak and does not allow
// removing the informatieobjecttype as long as documents of that type exist.
export function deleteZaakWithDocuments(zaakIdentificatie) {
  const zaakUrl = call('GET', `${ZAKEN_API}/zaken?identificatie=${zaakIdentificatie}`, null, 200).json('results.0.url');

  const documentUrls = [];
  let next = `${ZAKEN_API}/zaakinformatieobjecten?zaak=${encodeURIComponent(zaakUrl)}`;
  while (next) {
    const body = call('GET', next, null, 200).json();
    const items = Array.isArray(body) ? body : body.results;
    items.forEach((item) => documentUrls.push(item.informatieobject));
    next = Array.isArray(body) ? null : body.next;
  }

  call('DELETE', zaakUrl, null, 204);

  for (let i = 0; i < documentUrls.length; i += 10) {
    const requests = documentUrls.slice(i, i + 10).map((url) => ['DELETE', url, null, params()]);
    http.batch(requests).forEach((response, index) => {
      if (response.status !== 204) {
        fail(`DELETE ${requests[index][1]} returned ${response.status}: ${response.body}`);
      }
    });
  }
}
