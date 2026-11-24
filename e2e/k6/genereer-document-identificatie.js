// Load test of the generation of document identificaties through ZaakBrug, ramping up from 1 to 10 concurrent users.
//
// Run: k6 run e2e/k6/genereer-document-identificatie.js
import { check } from 'k6';
import { genereerDocumentIdentificatie } from './lib/zds.js';
import { assertAdapterMetrics, prometheusThresholds } from './lib/prometheus.js';

export const options = {
  scenarios: {
    genereerDocumentIdentificatie: {
      executor: 'ramping-vus',
      startVUs: 1,
      stages: [
        { duration: '30s', target: 10 },
        { duration: '30s', target: 10 },
      ],
    },
  },
  thresholds: {
    checks: ['rate>0.99'],
    'http_req_duration{name:genereerDocumentIdentificatie_Di02}': ['p(95)<2000'],
    ...prometheusThresholds(),
  },
};

export function setup() {
  return { startedAt: Date.now() };
}

export default function () {
  const documentIdentificatie = genereerDocumentIdentificatie();
  check(documentIdentificatie, { 'a documentIdentificatie is returned': (value) => !!value });
}

export function teardown(data) {
  assertAdapterMetrics(data.startedAt, [{ adapter: 'GenereerIdentificatieEmulator', maxAverageMs: 1000 }]);
}
