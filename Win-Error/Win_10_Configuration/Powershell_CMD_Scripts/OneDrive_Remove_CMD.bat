@echo off
taskkill /f /im OneDrive.exe
If "%PROCESSOR_ARCHITECTURE%"=="x86" (
 C:\Windows\System32\OneDriveSetup.exe /uninstall
 echo %USERNAME% %DATE% %TIME% >>logfile.txt
IF ERRORLEVEL 1 ECHO error %USERNAME% %DATE% %TIME% >>logfile.txt
) Else (
  C:\Windows\SysWOW64\OneDriveSetup.exe /uninstall
 echo %USERNAME% %DATE% %TIME% >>logfile.txt
IF ERRORLEVEL 1 ECHO error %USERNAME% %DATE% %TIME% >>logfile.txt
)
pause
exit
