#!/usr/bin/env bash
# Samples the CPU and memory usage of a running container until the script is stopped.
#
# Usage: sample-container-stats.sh <container> <output-file> [interval-in-seconds]
#
# Every line of the output file contains: <epoch seconds>;<cpu percentage>;<memory usage / memory limit>
set -u

container="${1:?Usage: $0 <container> <output-file> [interval-in-seconds]}"
output="${2:?Usage: $0 <container> <output-file> [interval-in-seconds]}"
interval="${3:-5}"

: > "${output}"
trap 'exit 0' INT TERM

while true; do
  # 'docker stats' takes a couple of seconds on its own to take a sample
  if stats=$(docker stats --no-stream --format '{{.CPUPerc}};{{.MemUsage}}' "${container}" 2>/dev/null); then
    echo "$(date +%s);${stats}" >> "${output}"
  fi
  sleep "${interval}"
done
