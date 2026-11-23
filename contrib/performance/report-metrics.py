#!/usr/bin/env python3
"""Reports the metrics ZaakBrug exposed during a period (JVM and per adapter) from Prometheus and compares the JVM usage
with a baseline.

Usage: report-metrics.py --prometheus-url URL --start EPOCH_SECONDS --end EPOCH_SECONDS [--baseline FILE]

The baseline file is a JSON file with the keys 'maxHeapMiB', 'avgCpuCores', 'tolerancePercent' and 'enforce'. Usage above the
baseline plus the tolerance is always reported, but only fails the run when 'enforce' is true.
Micrometer timers expose a count, sum and maximum, but no minimum, so the minimum duration of an adapter is not reported.
"""
import argparse
import json
import os
import sys
import urllib.parse
import urllib.request

MIB = 1024 * 1024


def query(prometheus_url, expression, at):
    url = f"{prometheus_url}/api/v1/query?" + urllib.parse.urlencode({"query": expression, "time": at})
    with urllib.request.urlopen(url, timeout=30) as response:
        return json.load(response)["data"]["result"]


def scalar(prometheus_url, expression, at):
    result = query(prometheus_url, expression, at)
    return float(result[0]["value"][1]) if result else float("nan")


def by_adapter(prometheus_url, expression, at):
    return {series["metric"]["adapter"]: float(series["value"][1]) for series in query(prometheus_url, expression, at)}


def jvm_section(prometheus_url, window, at):
    heap = 'sum(jvm_memory_used_bytes{area="heap"})'
    cpu = "process_cpu_usage * system_cpu_count"
    threads = "jvm_threads_live_threads"
    stats = {}
    for name, expression, factor in (("heap", heap, MIB), ("cpu", cpu, 1), ("threads", threads, 1)):
        stats[name] = {
            kind: scalar(prometheus_url, f"{kind}_over_time(({expression})[{window}s:5s])", at) / factor
            for kind in ("min", "avg", "max")
        }
    gc_seconds = scalar(prometheus_url, f"sum(increase(jvm_gc_pause_seconds_sum[{window}s]))", at)
    return stats, gc_seconds


def adapter_rows(prometheus_url, window, at):
    count = by_adapter(prometheus_url, f"sum by (adapter) (increase(frank_pipeline_duration_ms_count[{window}s]))", at)
    total = by_adapter(prometheus_url, f"sum by (adapter) (increase(frank_pipeline_duration_ms_sum[{window}s]))", at)
    maximum = by_adapter(prometheus_url, f"max by (adapter) (max_over_time(frank_pipeline_duration_ms_max[{window}s]))", at)
    errors = by_adapter(prometheus_url, f"sum by (adapter) (increase(frank_pipeline_messagesInError_total[{window}s]))", at)
    rows = [
        (adapter, round(count[adapter]), total[adapter] / count[adapter], maximum.get(adapter, float("nan")), errors.get(adapter, 0))
        for adapter in count
        if count[adapter] >= 0.5
    ]
    return sorted(rows, key=lambda row: row[1] * row[2], reverse=True)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--prometheus-url", required=True)
    parser.add_argument("--start", type=float, required=True)
    parser.add_argument("--end", type=float, required=True)
    parser.add_argument("--baseline")
    args = parser.parse_args()

    window = int(args.end - args.start)
    stats, gc_seconds = jvm_section(args.prometheus_url, window, args.end)
    adapters = adapter_rows(args.prometheus_url, window, args.end)

    lines = ["## ZaakBrug metrics during the performance tests", "", f"Period: {window} seconds", "", "### JVM", ""]
    lines += ["| Metric | Min | Mean | Max |", "| --- | --- | --- | --- |"]
    for label, name in (("Heap used (MiB)", "heap"), ("CPU (cores)", "cpu"), ("Live threads", "threads")):
        values = stats[name]
        lines.append(f"| {label} | {values['min']:.1f} | {values['avg']:.1f} | {values['max']:.1f} |")
    lines += ["", f"Time spent in GC pauses: {gc_seconds:.2f} s", "", "### Adapters", ""]
    lines += ["| Adapter | Messages | Mean (ms) | Max (ms) | In error |", "| --- | --- | --- | --- | --- |"]
    lines += [f"| {a} | {n} | {mean:.1f} | {maximum:.1f} | {errors:.0f} |" for a, n, mean, maximum, errors in adapters]

    exceeded = False
    if args.baseline:
        with open(args.baseline) as file:
            baseline = json.load(file)
        factor = 1 + baseline["tolerancePercent"] / 100
        lines += ["", f"### Baseline (tolerance {baseline['tolerancePercent']}%)", ""]
        lines += ["| Metric | Measured | Baseline | Limit | Status |", "| --- | --- | --- | --- | --- |"]
        for label, measured, expected in (
            ("Peak heap used (MiB)", stats["heap"]["max"], baseline["maxHeapMiB"]),
            ("Mean CPU (cores)", stats["cpu"]["avg"], baseline["avgCpuCores"]),
        ):
            limit = expected * factor
            status = "OK" if measured <= limit else "ABOVE LIMIT"
            exceeded = exceeded or status != "OK"
            lines.append(f"| {label} | {measured:.1f} | {expected:.1f} | {limit:.1f} | {status} |")

    report = "\n".join(lines)
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
