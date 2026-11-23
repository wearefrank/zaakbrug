// Load test of adding, reading and listing documents of a zaak through ZaakBrug.
//
// Every iteration generates a documentIdentificatie, adds a document of DOCUMENT_SIZE_MB to a zaak, reads the document and lists
// the documents of the zaak. The zaak is created in setup() and removed in teardown(). The zaaktype and informatieobjecttype
// are loaded into OpenZaak as fixtures (contrib/open-zaak-perf-tests, see contrib/compose.openzaak.perf-tests.yaml).
//
// Environment variables:
//  - SCENARIO:         'single' (1 user, 5 iterations, default) or 'multi' (ramping up from 1 to 10 users for 180 seconds)
//  - DOCUMENT_SIZE_MB: size of the documents, default 1
//
// Run: k6 run -e SCENARIO=single -e DOCUMENT_SIZE_MB=4 e2e/k6/documents.js
import { check, sleep } from 'k6';
import encoding from 'k6/encoding';
import {
  genereerDocumentIdentificatie,
  geefLijstZaakdocumenten,
  geefZaakdocumentLezen,
  voegZaakdocumentToe,
} from './lib/zds.js';
import { createZaak, deleteZaakWithDocuments } from './lib/openzaak.js';
import { PERFORMANCE_INFORMATIEOBJECTTYPE_OMSCHRIJVING } from './lib/config.js';
import { assertAdapterMetrics, prometheusThresholds } from './lib/prometheus.js';

const multi = (__ENV.SCENARIO || 'single') === 'multi';
const documentSizeMb = parseFloat(__ENV.DOCUMENT_SIZE_MB || '1');

export const options = {
  scenarios: {
    documents: multi
      ? { executor: 'ramping-vus', startVUs: 1, stages: [{ duration: '180s', target: 10 }], gracefulStop: '60s' }
      : { executor: 'per-vu-iterations', vus: 1, iterations: 5, maxDuration: '10m' },
  },
  setupTimeout: '120s',
  teardownTimeout: '600s',
  // The durations depend on the machine, the thresholds only catch big problems. The documents of the 'multi' scenario all
  // end up in one zaak, so listing them gets slower while the test runs.
  thresholds: {
    checks: ['rate>0.95'],
    'http_req_duration{name:voegZaakdocumentToe_Lk01}': [`p(95)<${multi ? 15000 : 10000}`],
    'http_req_duration{name:geefZaakdocumentLezen_Lv01}': [`p(95)<${multi ? 15000 : 10000}`],
    'http_req_duration{name:geefLijstZaakdocumenten_Lv01}': [`p(95)<${multi ? 60000 : 10000}`],
    ...prometheusThresholds(),
  },
};

// A document of the requested size once per user, instead of generating one every iteration
function generateDocumentBase64() {
  const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  let chunk = '';
  for (let i = 0; i < 1024; i++) {
    chunk += characters.charAt(Math.floor(Math.random() * characters.length));
  }
  // base64 makes the content a third larger
  const bytes = Math.floor(documentSizeMb * 1024 * 1024 * 0.75);
  return encoding.b64encode(chunk.repeat(Math.ceil(bytes / chunk.length)).substring(0, bytes));
}
const documentBase64 = generateDocumentBase64();

export function setup() {
  const startedAt = Date.now();
  const zaakIdentificatie = createZaak();
  return { startedAt, zaakIdentificatie };
}

export default function (data) {
  const documentIdentificatie = genereerDocumentIdentificatie();
  check(documentIdentificatie, { 'a documentIdentificatie is returned': (value) => !!value });

  voegZaakdocumentToe(
    documentIdentificatie,
    data.zaakIdentificatie,
    PERFORMANCE_INFORMATIEOBJECTTYPE_OMSCHRIJVING,
    documentBase64,
  );
  geefZaakdocumentLezen(documentIdentificatie);
  geefLijstZaakdocumenten(data.zaakIdentificatie);

  if (!multi) {
    sleep(1);
  }
}

export function teardown(data) {
  assertAdapterMetrics(data.startedAt, [
    { adapter: 'GenereerIdentificatieEmulator' },
    { adapter: 'VoegZaakdocumentToe_Lk01', maxAverageMs: multi ? 15000 : 10000 },
    { adapter: 'GeefZaakdocumentLezen_Lv01', maxAverageMs: multi ? 15000 : 10000 },
    { adapter: 'GeefLijstZaakdocumenten_Lv01', maxAverageMs: multi ? 60000 : 10000 },
  ]);

  deleteZaakWithDocuments(data.zaakIdentificatie);
}
