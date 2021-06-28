#!/bin/sh

# ----------------------------------------------------------------------
# ----- Customizable Variables -----------------------------------------
# ----------------------------------------------------------------------
# JAVA_HOME=
JENNIFER_VIEW_SERVER_HOME=$(dirname $(cd "$(dirname "$0")" && pwd))
JENNIFER_VIEW_SERVER_CONF=${JENNIFER_VIEW_SERVER_HOME}/conf/server_view.conf # Must be absolute path. 
JENNIFER_VIEW_SERVER_LOG_CONF=${JENNIFER_VIEW_SERVER_HOME}/conf/logback.xml # Must be absolute path.

# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# ----- Do not touch below this line!-----------------------------------
# ----------------------------------------------------------------------
export JENNIFER_VIEW_SERVER_HOME
cd ${JENNIFER_VIEW_SERVER_HOME}/bin
PATH=${JAVA_HOME}/bin:${PATH}

JAVA_OPTS=" ${JAVA_OPTS} -Dfile.encoding=UTF-8"
JAVA_OPTS=" ${JAVA_OPTS} -Djennifer.lib=${JENNIFER_VIEW_SERVER_HOME}/lib"
JAVA_OPTS=" ${JAVA_OPTS} -Djennifer.viewserver.config=${JENNIFER_VIEW_SERVER_CONF}"
JAVA_OPTS=" ${JAVA_OPTS} -Dlogback.configurationFile=${JENNIFER_VIEW_SERVER_LOG_CONF}"
JAVA_OPTS=" ${JAVA_OPTS} -Djennifer.help=${JENNIFER_VIEW_SERVER_HOME}/help"
JENNIFER_JAR=${JENNIFER_VIEW_SERVER_HOME}/lib/jennifer.launcher.jar
JENNIFER_MAIN_CLASS=com.jennifersoft.view.AdminUtil

if [ "$1" = "-userReset" ]; then
        echo "Run jennifer_admintool -userReset"
        java ${JAVA_OPTS} -jar ${JENNIFER_JAR} ${JENNIFER_MAIN_CLASS} $1 $2
elif [ "$1" = "-userDelete" ]; then
        echo "Run jennifer_admintool -userDelete"
        java ${JAVA_OPTS} -jar ${JENNIFER_JAR} ${JENNIFER_MAIN_CLASS} $1 $2
elif [ "$1" = "-domainsAdd" ]; then
        echo "Run jennifer_admintool -domainsAdd"
        java ${JAVA_OPTS} -jar ${JENNIFER_JAR} ${JENNIFER_MAIN_CLASS} $1 $2
else
        echo "Usage: jennifer_admintool [command] [value]"
        echo "Available command : -userReset, -userDelete, -domainsAdd"
fi