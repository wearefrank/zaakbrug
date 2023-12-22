#!/usr/bin/env bash
set -e

# Append HeapDump and GC properties to existing JAVA_OPTS
export JAVA_OPTS="$JAVA_OPTS \
	-XX:HeapDumpPath=/usr/local/tomcat/logs \
	-XX:+HeapDumpOnOutOfMemoryError \
	-XX:+UseG1GC \
	-XX:-ShrinkHeapInSteps \
	-XX:+UnlockExperimentalVMOptions \
	-XX:G1ReservePercent=20 \
	-XX:InitiatingHeapOccupancyPercent=25 \
	-XX:SurvivorRatio=32 \
	-XX:+PerfDisableSharedMem \
	-XX:+ParallelRefProcEnabled \
	-XX:MaxTenuringThreshold=3 \
	-XX:MaxGCPauseMillis=200 \
	-XX:+UseStringDeduplication \
	-XX:ConcGCThreads=4 \
	-XX:MaxMetaspaceSize=256m \
	-XX:G1HeapRegionSize=16m \
	-XX:G1NewSizePercent=30 \
    -XX:+PrintFlagsFinal \
    -XshowSettings"

exec "$@"