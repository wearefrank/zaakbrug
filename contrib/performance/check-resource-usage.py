#!/usr/bin/env python3
"""Reports the sampled resource usage of the ZaakBrug container and compares it with a baseline.

Usage: check-resource-usage.py <samples-file> <baseline-file>

The samples file is created by sample-container-stats.sh. The baseline file is a JSON file with the keys
'maxMemoryMiB', 'avgCpuPercent', 'tolerancePercent' and 'enforce'. Usage above the baseline plus the tolerance is
always reported, but only fails the run when 'enforce' is true.
"""
import json
import os
import re
import sys

UNIT_IN_MIB = {"B": 1 / 1024 / 1024, "KB": 1 / 1024, "KIB": 1 / 1024, "MB": 1, "MIB": 1, "GB": 1024, "GIB": 1024}


def to_mib(usage):
    value, unit = re.match(r"([\d.]+)\s*([A-Za-z]+)", usage).groups()
    return float(value) * UNIT_IN_MIB[unit.upper()]


def read_samples(path):
    samples = []
    with open(path) as file:
        for line in file:
            _, cpu, memory = line.strip().split(";")
            samples.append((float(cpu.rstrip("%")), to_mib(memory.split("/")[0].strip())))
    return samples


def main():
    samples = read_samples(sys.argv[1])
    with open(sys.argv[2]) as file:
        baseline = json.load(file)

    if not samples:
        print("No resource usage samples found")
        return 1

    measured = {
        "maxMemoryMiB": max(memory for _, memory in samples),
        "avgCpuPercent": sum(cpu for cpu, _ in samples) / len(samples),
    }
    limit_factor = 1 + baseline["tolerancePercent"] / 100

    rows = ["| Metric | Measured | Baseline | Limit | Status |", "| --- | --- | --- | --- | --- |"]
    exceeded = False
    for metric, label in (("maxMemoryMiB", "Peak memory (MiB)"), ("avgCpuPercent", "Average CPU (%)")):
        limit = baseline[metric] * limit_factor
        status = "OK" if measured[metric] <= limit else "ABOVE LIMIT"
        exceeded = exceeded or status != "OK"
        rows.append(f"| {label} | {measured[metric]:.1f} | {baseline[metric]:.1f} | {limit:.1f} | {status} |")

    report = "\n".join(
        ["## ZaakBrug resource usage during the performance tests", "", f"{len(samples)} samples.", ""] + rows
    )
    print(report)
    if "GITHUB_STEP_SUMMARY" in os.environ:
        with open(os.environ["GITHUB_STEP_SUMMARY"], "a") as summary:
            summary.write(report + "\n")

    if exceeded:
        print("::warning::The resource usage of ZaakBrug during the performance tests is above the baseline limit")
        return 1 if baseline.get("enforce") else 0
    return 0


if __name__ == "__main__":
    sys.exit(main())
