#!/bin/sh

# ----------------------------------------------------------------------
# ----- Customizable Variables -----------------------------------------
# ----------------------------------------------------------------------
# JAVA_HOME=
JENNIFER_DATA_SERVER_HOME=$(dirname $(cd "$(dirname "$0")" && pwd)) # Must be absolute path.
JENNIFER_DATA_SERVER_CONF=${JENNIFER_DATA_SERVER_HOME}/conf/server_data.conf  # Must be absolute path. 
JENNIFER_DATA_SERVER_LOG_CONF=${JENNIFER_DATA_SERVER_HOME}/conf/logback.xml  # Must be absolute path. 
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# ----- Do not touch below this line!-----------------------------------
# ----------------------------------------------------------------------
export JENNIFER_DATA_SERVER_HOME
cd ${JENNIFER_DATA_SERVER_HOME}/bin
PATH=${JAVA_HOME}/bin:${PATH}
JAVA_OPTS=" ${JAVA_OPTS} -Xms2g -Xmx2g"
JAVA_OPTS=" ${JAVA_OPTS} -XX:+AlwaysPreTouch"
JAVA_OPTS=" ${JAVA_OPTS} -XX:PermSize=64m -XX:MaxPermSize=64m"
JAVA_OPTS=" ${JAVA_OPTS} -XX:+HeapDumpOnOutOfMemoryError"
JAVA_OPTS=" ${JAVA_OPTS} -Dfile.encoding=UTF-8"
JAVA_OPTS=" ${JAVA_OPTS} -Djennifer.lib=${JENNIFER_DATA_SERVER_HOME}/lib"
JAVA_OPTS=" ${JAVA_OPTS} -Djennifer.dataserver.plugin=${JENNIFER_DATA_SERVER_HOME}/plugin"
JAVA_OPTS=" ${JAVA_OPTS} -Djennifer.dataserver.config=${JENNIFER_DATA_SERVER_CONF}"
JAVA_OPTS=" ${JAVA_OPTS} -Dlogback.configurationFile=${JENNIFER_DATA_SERVER_LOG_CONF}"
JAVA_OPTS=" ${JAVA_OPTS} -XX:-OmitStackTraceInFastThrow"
JAVA_OPTS=" ${JAVA_OPTS} -XX:+IgnoreUnrecognizedVMOptions"
JENNIFER_JAR=${JENNIFER_DATA_SERVER_HOME}/lib/jennifer.launcher.jar
JENNIFER_MAIN_CLASS=com.aries.data.Main

if [ "$1" = "start" ]; then
        java ${JAVA_OPTS} -jar ${JENNIFER_JAR} ${JENNIFER_MAIN_CLASS} start > /dev/null 2>&1 &
        echo "Starting Jennifer5 data server is requested. For more information, see the log files."
elif [ "$1" = "run" ]; then
        java ${JAVA_OPTS} -jar ${JENNIFER_JAR} ${JENNIFER_MAIN_CLASS} start
elif [ "$1" = "stop" ]; then
        java ${JAVA_OPTS} -jar ${JENNIFER_JAR} ${JENNIFER_MAIN_CLASS} stop > /dev/null 2>&1 &
        echo "Stopping Jennifer5 data server is requested. For more information, see the log files."
elif [ "$1" = "version" ]; then
        java ${JAVA_OPTS} -jar ${JENNIFER_JAR} ${JENNIFER_MAIN_CLASS} version
elif [ "$1" = "benchmark" ]; then
        java ${JAVA_OPTS} -jar ${JENNIFER_JAR} ${JENNIFER_MAIN_CLASS} benchmark
else
        echo "Usage: jennifer_data.sh [command]"
        echo "Available command : start, stop, version, benchmark"
fi
