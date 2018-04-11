@echo off
set name=%1
set workdir="C:\Zabbix\Script\zabbix_win_service_mem"

cd %workdir%
C:
sc query %1 | findstr STATE | findstr 4 > nul
if %errorlevel%==0 ( FOR /F "usebackq skip=5 tokens=3 " %%A IN (`tasklist /FI "SERVICES eq %name%" /FO list`) DO set var1=%%A 
) else (
echo 0 
exit
)
echo %var1% | %workdir%\sed.exe -e "s/\.//g" | %workdir%\sed.exe -e "s/\,//g"
