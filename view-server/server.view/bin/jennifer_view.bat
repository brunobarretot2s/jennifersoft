@echo off

rem ----------------------------------------------------------------------
rem ----- Customizable Variables -----------------------------------------
rem ----------------------------------------------------------------------
rem set JAVA_HOME=

rem ----------------------------------------------------------------------
rem ----- You can choose platform 'java' or 'php' or 'net' ---------------
rem ----------------------------------------------------------------------
set JENNIFER_PLATFORM=java
set JENNIFER_VIEW_SERVER_HOME=%~dp0\..
set JENNIFER_VIEW_SERVER_CONF=%JENNIFER_VIEW_SERVER_HOME%\conf\server_view.conf
set JENNIFER_VIEW_SERVER_LOG_CONF=%JENNIFER_VIEW_SERVER_HOME%\conf\logback.xml
rem ----------------------------------------------------------------------

rem ----------------------------------------------------------------------
rem ----- Do not touch below this line!-----------------------------------
rem ----------------------------------------------------------------------

cd %JENNIFER_VIEW_SERVER_HOME%\bin
set PATH=%JAVA_HOME%\bin;%PATH%

set JAVA_OPTS=%JAVA_OPTS% -Xms2g -Xmx2g
set JAVA_OPTS=%JAVA_OPTS% -XX:+HeapDumpOnOutOfMemoryError
set JAVA_OPTS=%JAVA_OPTS% -Dfile.encoding=UTF-8
set JAVA_OPTS=%JAVA_OPTS% "-Djennifer.lib=%JENNIFER_VIEW_SERVER_HOME%\lib"
set JAVA_OPTS=%JAVA_OPTS% "-Djennifer.viewserver.config=%JENNIFER_VIEW_SERVER_CONF%"
set JAVA_OPTS=%JAVA_OPTS% "-Dlogback.configurationFile=%JENNIFER_VIEW_SERVER_LOG_CONF%"
set JAVA_OPTS=%JAVA_OPTS% "-Djennifer.help=%JENNIFER_VIEW_SERVER_HOME%\help"
set JAVA_OPTS=%JAVA_OPTS% -XX:+IgnoreUnrecognizedVMOptions
set JAVA_OPTS=%JAVA_OPTS% -XX:-OmitStackTraceInFastThrow
set JENNIFER_JAR=%JENNIFER_VIEW_SERVER_HOME%\lib\jennifer.launcher.jar
set JENNIFER_MAIN_CLASS=com.jennifersoft.view.Main

if "%1"=="start" (
start cmd /c call jennifer_view.bat run
) else if "%1"=="run" (
title Jennifer5 View Server
java %JAVA_OPTS% -jar "%JENNIFER_JAR%" %JENNIFER_MAIN_CLASS% start %JENNIFER_PLATFORM%
) else if "%1"=="stop" (
java %JAVA_OPTS% -jar "%JENNIFER_JAR%" %JENNIFER_MAIN_CLASS% stop
) else if "%1"=="version" (
java %JAVA_OPTS% -jar "%JENNIFER_JAR%" %JENNIFER_MAIN_CLASS% version
) else (
echo Usage: jennifer_view [command]
echo Available command : start, stop, version
)
