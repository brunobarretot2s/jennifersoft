@echo off

rem ----------------------------------------------------------------------
rem ----- Customizable Variables -----------------------------------------
rem ----------------------------------------------------------------------
rem set JAVA_HOME=
set JENNIFER_DATA_SERVER_HOME=%~dp0\..
set JENNIFER_DATA_SERVER_CONF=%JENNIFER_DATA_SERVER_HOME%\conf\server_data.conf
set JENNIFER_DATA_SERVER_LOG_CONF=%JENNIFER_DATA_SERVER_HOME%\conf\logback.xml
rem ----------------------------------------------------------------------

rem ----------------------------------------------------------------------
rem ----- Do not touch below this line!-----------------------------------
rem ----------------------------------------------------------------------
cd %JENNIFER_DATA_SERVER_HOME%\bin
set PATH=%JAVA_HOME%\bin;%PATH%
set JAVA_OPTS=%JAVA_OPTS% -Xms2g -Xmx2g
set JAVA_OPTS=%JAVA_OPTS% -XX:+AlwaysPreTouch
set JAVA_OPTS=%JAVA_OPTS% -XX:PermSize=64m -XX:MaxPermSize=64m
set JAVA_OPTS=%JAVA_OPTS% -XX:+HeapDumpOnOutOfMemoryError
set JAVA_OPTS=%JAVA_OPTS% -Dfile.encoding=UTF-8
set JAVA_OPTS=%JAVA_OPTS% "-Djennifer.lib=%JENNIFER_DATA_SERVER_HOME%\lib"
set JAVA_OPTS=%JAVA_OPTS% "-Djennifer.dataserver.plugin=%JENNIFER_DATA_SERVER_HOME%\plugin"
set JAVA_OPTS=%JAVA_OPTS% "-Djennifer.dataserver.config=%JENNIFER_DATA_SERVER_CONF%"
set JAVA_OPTS=%JAVA_OPTS% "-Dlogback.configurationFile=%JENNIFER_DATA_SERVER_LOG_CONF%"
set JAVA_OPTS=%JAVA_OPTS% -XX:-OmitStackTraceInFastThrow
set JAVA_OPTS=%JAVA_OPTS% -XX:+IgnoreUnrecognizedVMOptions

set JENNIFER_JAR=%JENNIFER_DATA_SERVER_HOME%\lib\jennifer.launcher.jar
set JENNIFER_MAIN_CLASS=com.aries.data.Main

if "%1"=="start" (
start cmd /c call jennifer_data.bat run
) else if "%1"=="run" (
title Jennifer5 Data Server
java %JAVA_OPTS% -jar "%JENNIFER_JAR%" %JENNIFER_MAIN_CLASS% start
) else if "%1"=="stop" (
java %JAVA_OPTS% -jar "%JENNIFER_JAR%" %JENNIFER_MAIN_CLASS% stop
) else if "%1"=="version" (
java %JAVA_OPTS% -jar "%JENNIFER_JAR%" %JENNIFER_MAIN_CLASS% version
) else if "%1"=="benchmark" (
java %JAVA_OPTS% -jar "%JENNIFER_JAR%" %JENNIFER_MAIN_CLASS% benchmark
) else (
echo Usage: jennifer_data [command]
echo Available command : start, stop, version, benchmark
)