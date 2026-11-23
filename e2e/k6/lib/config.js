export const ZAAKBRUG_URL = __ENV.ZAAKBRUG_URL || 'http://localhost:8080';
export const OPENZAAK_URL = __ENV.OPENZAAK_URL || 'http://localhost:9001';
export const ZAAKBRUG_ZDS_URL = `${ZAAKBRUG_URL}/services/translate/generic/zds`;
export const CATALOGI_API = `${OPENZAAK_URL}/catalogi/api/v1`;
export const ZAKEN_API = `${OPENZAAK_URL}/zaken/api/v1`;

// Same credentials as the SoapUI project, see the OpenZaak fixtures in contrib/open-zaak
export const JWT_CLIENT_ID = __ENV.JWT_CLIENT_ID || 'ZaakBrug';
export const JWT_SECRET = __ENV.JWT_SECRET || 'secret1234';

// Optional, when set the tests also assert on the metrics ZaakBrug exposes during the test
export const PROMETHEUS_URL = __ENV.PROMETHEUS_URL || '';
export const PROMETHEUS_SCRAPE_INTERVAL_SECONDS = parseInt(__ENV.PROMETHEUS_SCRAPE_INTERVAL_SECONDS || '5', 10);
