import http from 'k6/http';
import { sleep } from 'k6';
import { Rate } from 'k6/metrics';
import { PROMETHEUS_SCRAPE_INTERVAL_SECONDS, PROMETHEUS_URL } from './config.js';

// Every assertion on the metrics of ZaakBrug adds a sample to this rate, the threshold requires all of them to pass.
const metricAssertions = new Rate('prometheus_assertions');

// Only add the threshold when the metrics are available, a Rate without samples fails its threshold.
export function prometheusThresholds() {
  return PROMETHEUS_URL ? { prometheus_assertions: ['rate==1'] } : {};
}

function query(expression) {
  const response = http.get(`${PROMETHEUS_URL}/api/v1/query?query=${encodeURIComponent(expression)}`, {
    tags: { name: 'prometheus' },
  });
  if (response.status !== 200) {
    console.error(`Querying Prometheus for '${expression}' returned ${response.status}: ${response.body}`);
    return null;
  }
  const value = response.json('data.result.0.value.1');
  return value === undefined ? 0 : parseFloat(value);
}

function assertThat(description, passed) {
  metricAssertions.add(passed);
  console[passed ? 'info' : 'error'](`Metric assertion ${passed ? 'passed' : 'FAILED'}: ${description}`);
}

// Asserts on the metrics ZaakBrug exposes (scraped by Prometheus) in the period between the start of the test and now:
// - no adapter had messages in error
// - the given adapters processed messages and, when 'maxAverageMs' is given, did so within that average duration
// Call it at the end of the test, e.g. in teardown().
export function assertAdapterMetrics(startedAtMs, adapters) {
  if (!PROMETHEUS_URL) {
    console.warn('PROMETHEUS_URL is not set, skipping the assertions on the metrics of ZaakBrug');
    return;
  }

  // Wait for the last scrape, and also include the sample just before the start, increase() needs it as its starting point
  sleep(PROMETHEUS_SCRAPE_INTERVAL_SECONDS + 1);
  const window = `${Math.ceil((Date.now() - startedAtMs) / 1000) + PROMETHEUS_SCRAPE_INTERVAL_SECONDS}s`;

  const messagesInError = query(`sum(increase(frank_pipeline_messagesInError_total[${window}]))`);
  assertThat(`no messages in error in the last ${window} (found ${messagesInError})`, messagesInError === 0);

  adapters.forEach(({ adapter, maxAverageMs }) => {
    const processed = query(`sum(increase(frank_pipeline_messagesProcessed_total{adapter="${adapter}"}[${window}]))`);
    assertThat(`adapter ${adapter} processed messages (found ${processed})`, processed !== null && processed > 0);

    if (maxAverageMs !== undefined) {
      const averageMs = query(
        `sum(increase(frank_pipeline_duration_ms_sum{adapter="${adapter}"}[${window}])) / ` +
          `sum(increase(frank_pipeline_duration_ms_count{adapter="${adapter}"}[${window}]))`,
      );
      assertThat(
        `adapter ${adapter} averaged below ${maxAverageMs} ms (found ${averageMs} ms)`,
        averageMs !== null && averageMs <= maxAverageMs,
      );
    }
  });
}
