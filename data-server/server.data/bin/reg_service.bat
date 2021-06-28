cls

FOR /F "delims=;" %%I IN ("%0") DO SET CURRENTDIR=%%~dpI

SET viewBatchFile="%CURRENTDIR%jennifer_view.bat"
IF NOT EXIST %viewBatchFile% goto END_OF_VIEW_REG

if NOT '%PROCESSOR_ARCHITECTURE%' == 'AMD64' goto ENDVIEWx64
SET EXENAME=jenniferview64.exe
goto ENDVIEWNAME
:ENDVIEWx64
SET EXENAME=jenniferview32.exe

:ENDVIEWNAME

:END_OF_VIEW_REG

SET dataBatchFile="%CURRENTDIR%jennifer_data.bat"
IF NOT EXIST %dataBatchFile% goto END_OF_REG

if NOT '%PROCESSOR_ARCHITECTURE%' == 'AMD64' goto ENDDATAx64
SET EXENAME=jenniferdata64.exe
goto ENDDATANAME
:ENDDATAx64
SET EXENAME=jenniferdata32.exe

:ENDDATANAME

:END_OF_REG

echo %EXENAME%
if '%EXENAME%' == '' goto END_REG

for /f %%i in ('"%CURRENTDIR%%EXENAME%" -admin') do set ADMINRIGHTS=%%i
if NOT '%ADMINRIGHTS%' == 'ON' goto ErrorOfAdminRights

IF '%1' == '-nc' GOTO NoCheckJava

for /f %%i in ('"%CURRENTDIR%%EXENAME%" -java') do set HASJAVA=%%i
if NOT '%HASJAVA%' == 'ON' goto NoJavaInstalled

:NoCheckJava

"%CURRENTDIR%%EXENAME%" -i

for /f %%i in ('"%CURRENTDIR%%EXENAME%" -servicename') do set SERVICENAME=%%i

net start %SERVICENAME%

:END_REG
goto END_OF_FILE

:ErrorOfAdminRights
Echo Error! You must have admin rights to install
goto END_OF_FILE

:NoJavaInstalled
Echo Error! No java.exe path in SYSTEM Environment PATH Variables. (HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment)
goto END_OF_FILE

:END_OF_FILE