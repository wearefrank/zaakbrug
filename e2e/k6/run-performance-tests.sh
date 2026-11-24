#!/bin/sh
# Runs all k6 performance tests one after the other, every test creates and removes its own catalog and zaak.
# A failing test does not stop the others, but makes the script fail.
#
# Environment variables: see lib/config.js. The k6 summary of every test is exported to REPORTS_DIR (default: /reports).
dir="$(cd "$(dirname "$0")" && pwd)"
reports="${REPORTS_DIR:-/reports}"
status=0

mkdir -p "${reports}"

run() {
  name="$1"
  shift
  echo "=== ${name}"
  k6 run --summary-export="${reports}/${name}.json" "$@" || status=1
}

run genereer-document-identificatie "${dir}/genereer-document-identificatie.js"

for size in 0.25 1 4 16; do
  run "documents-single-${size}mb" -e SCENARIO=single -e DOCUMENT_SIZE_MB="${size}" "${dir}/documents.js"
done

run documents-multi-0.25mb -e SCENARIO=multi -e DOCUMENT_SIZE_MB=0.25 "${dir}/documents.js"

exit "${status}"
