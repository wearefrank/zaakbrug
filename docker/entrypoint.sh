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
	-XX:MaxMetaspaceSize=256m \
	-XX:G1HeapRegionSize=16m \
	-XX:G1NewSizePercent=30 \
    -XX:+PrintFlagsFinal \
    -XshowSettings"

# Enables writing of GC logs to /usr/local/tomcat/logs. Impacts performance!
if [ ${GC_LOGGING_ENABLED:-false} == true ]
	then
		export JAVA_OPTS="$JAVA_OPTS -Xlog:codecache+sweep*=trace,class+unload,class+load,os+thread,safepoint,gc*,gc+stringdedup=debug,gc+ergo=trace,gc+age=trace,gc+phases=trace,gc+humongous=trace,jit+compilation=debug:file=/usr/local/tomcat/logs/zaakbrug-gc-log.log:level,tags,time,uptime:filesize=104857600,filecount=5"
fi

exec "$@"