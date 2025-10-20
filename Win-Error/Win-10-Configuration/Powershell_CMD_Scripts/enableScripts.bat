@echo off
powershell -Command Set-ExecutionPolicy RemoteSigned
echo %USERNAME% %DATE% %TIME% >>logfile.txt
IF ERRORLEVEL 1 ECHO error %USERNAME% %DATE% %TIME% >>logfile.txt
pause
exit
