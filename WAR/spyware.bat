@echo off
set Address=IP ADDRESS HERE
:Loop
PING -n 5 IP ADDRESS HERE>nul
echo Pinging %Address%
%SystemRoot%\system32\ping.exe -n 1 %Address% | %SystemRoot%\system32\find.exe "TTL=" > NUL >> C:\pingtest\logfile.log
if %ERRORLEVEL% EQU 0 goto :Loop
echo Trace route %Address% at %date% %time% >> C:\pingtest\logfile.log
tracert %Address% >> C:\pingtest\logfile.log
goto Loop