@echo off

rem ----------------------------------------------------------------------
rem ----- Customizable Variables -----------------------------------------
rem ----------------------------------------------------------------------
rem set JAVA_HOME=

set JENNIFER_VIEW_SERVER_HOME=%~dp0\..
set JENNIFER_VIEW_SERVER_CONF=%JENNIFER_VIEW_SERVER_HOME%\conf\server_view.conf
set JENNIFER_VIEW_SERVER_LOG_CONF=%JENNIFER_VIEW_SERVER_HOME%\conf\logback.xml
rem ----------------------------------------------------------------------

rem ----------------------------------------------------------------------
rem ----- Do not touch below this line!-----------------------------------
rem ----------------------------------------------------------------------

cd %JENNIFER_VIEW_SERVER_HOME%\bin
set PATH=%JAVA_HOME%\bin;%PATH%

set JAVA_OPTS=%JAVA_OPTS% -Dfile.encoding=UTF-8
set JAVA_OPTS=%JAVA_OPTS% "-Djennifer.lib=%JENNIFER_VIEW_SERVER_HOME%\lib"
set JAVA_OPTS=%JAVA_OPTS% "-Djennifer.viewserver.config=%JENNIFER_VIEW_SERVER_CONF%"
set JAVA_OPTS=%JAVA_OPTS% "-Dlogback.configurationFile=%JENNIFER_VIEW_SERVER_LOG_CONF%"
set JAVA_OPTS=%JAVA_OPTS% "-Djennifer.help=%JENNIFER_VIEW_SERVER_HOME%\help"
set JENNIFER_JAR=%JENNIFER_VIEW_SERVER_HOME%\lib\jennifer.launcher.jar
set JENNIFER_MAIN_CLASS=com.jennifersoft.view.AdminUtil

if "%1"=="-userReset" (
java %JAVA_OPTS% -jar %JENNIFER_JAR% %JENNIFER_MAIN_CLASS% %1 %2
) else if "%1"=="-userDelete" (
java %JAVA_OPTS% -jar %JENNIFER_JAR% %JENNIFER_MAIN_CLASS% %1 %2
) else if "%1"=="-domainsAdd" (
java %JAVA_OPTS% -jar %JENNIFER_JAR% %JENNIFER_MAIN_CLASS% %1 %2
) else (
echo Usage: jennifer_admintool [command] [value]
echo Available command : -userReset, -userDelete, -domainsAdd
)