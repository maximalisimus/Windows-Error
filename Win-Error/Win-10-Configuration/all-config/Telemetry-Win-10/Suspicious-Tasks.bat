@cd/d "%~dp0"
chcp 65001
@echo off

REM *** Подозрительные задачи ***

REM *** Scans startup entries and raises notification to the user if there are too many startup entries ***
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable Error=%MYERROR%  >> log.txt

REM *** Protects user files from accidental loss by copying them to a backup location when the system is unattended ***
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable Error=%MYERROR%  >> log.txt

REM *** This task gathers information about the Trusted Platform Module (TPM), Secure Boot, and Measured Boot ***
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable Error=%MYERROR%  >> log.txt

REM *** This task analyzes the system looking for conditions that may cause high energy use ***
schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable Error=%MYERROR%  >> log.txt

chcp 866

pause
