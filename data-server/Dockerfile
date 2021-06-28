FROM store/oracle/jdk:11
ADD data-server/server.data /app/jennifer5
EXPOSE 5000
ENV JENNIFER_DATA_SERVER_HOME=/app/jennifer5
ENV JENNIFER_DATA_SERVER_CONF=${JENNIFER_DATA_SERVER_HOME}/conf/server_data.conf
ENV JENNIFER_DATA_SERVER_LOG_CONF=${JENNIFER_DATA_SERVER_HOME}/conf/logback.xml
ENV PATH=${JAVA_HOME}/bin:${PATH}
ENV JAVA_OPTS=" ${JAVA_OPTS} -Xms2g -Xmx2g"
ENV JAVA_OPTS=" ${JAVA_OPTS} -XX:+AlwaysPreTouch"
ENV JAVA_OPTS=" ${JAVA_OPTS} -XX:PermSize=64m -XX:MaxPermSize=64m"
ENV JAVA_OPTS=" ${JAVA_OPTS} -XX:+HeapDumpOnOutOfMemoryError"
ENV JAVA_OPTS=" ${JAVA_OPTS} -Dfile.encoding=UTF-8"
ENV JAVA_OPTS=" ${JAVA_OPTS} -Djennifer.lib=${JENNIFER_DATA_SERVER_HOME}/lib"
ENV JAVA_OPTS=" ${JAVA_OPTS} -Djennifer.dataserver.plugin=${JENNIFER_DATA_SERVER_HOME}/plugin"
ENV JAVA_OPTS=" ${JAVA_OPTS} -Djennifer.dataserver.config=${JENNIFER_DATA_SERVER_CONF}"
ENV JAVA_OPTS=" ${JAVA_OPTS} -Dlogback.configurationFile=${JENNIFER_DATA_SERVER_LOG_CONF}"
ENV JAVA_OPTS=" ${JAVA_OPTS} -XX:-OmitStackTraceInFastThrow"
ENV JAVA_OPTS=" ${JAVA_OPTS} -XX:+IgnoreUnrecognizedVMOptions"
ENV JENNIFER_JAR=${JENNIFER_DATA_SERVER_HOME}/lib/jennifer.launcher.jar
ENV JENNIFER_MAIN_CLASS=com.aries.data.Main
CMD java ${JAVA_OPTS} -jar ${JENNIFER_JAR} ${JENNIFER_MAIN_CLASS} start