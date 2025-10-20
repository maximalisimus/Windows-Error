@echo off
Powershell -File ./MS.Win_Photos_Remove.ps1
echo %USERNAME% %DATE% %TIME% >>logfile.txt
IF ERRORLEVEL 1 ECHO error %USERNAME% %DATE% %TIME% >>logfile.txt
pause
exit
