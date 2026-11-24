import http from 'k6/http';
import { fail } from 'k6';
import { PERFORMANCE_ZAAKTYPE_CODE, ZAKEN_API } from './config.js';
import { createJwt } from './auth.js';
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

// Creates a zaak of the performance zaaktype (loaded into OpenZaak by contrib/compose.openzaak.perf-tests.yaml), the zaak
// identificatie is returned.
export function createZaak() {
  const zaakIdentificatie = genereerZaakIdentificatie();
  creeerZaak(zaakIdentificatie, PERFORMANCE_ZAAKTYPE_CODE);
  return zaakIdentificatie;
}

// Removes the zaak and the documents added to it. OpenZaak does not remove the documents with the zaak.
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
