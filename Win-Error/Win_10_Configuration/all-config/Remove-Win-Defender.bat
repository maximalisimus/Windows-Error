@cd/d "%~dp0"
chcp 65001
@echo off

powershell -Command "& {Get-ScheduledTask 'Windows Defender Cache Maintenance' | Disable-ScheduledTask}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Windows Defender Cache Maintenance Error=%MYERROR%
echo Windows Defender Cache Maintenance Error=%MYERROR% >> log.txt

powershell -Command "& {Get-ScheduledTask 'Windows Defender Cleanup' | Disable-ScheduledTask}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Windows Defender Cleanup Error=%MYERROR%
echo Windows Defender Cleanup Error=%MYERROR% >> log.txt

powershell -Command "& {Get-ScheduledTask 'Windows Defender Scheduled Scan' | Disable-ScheduledTask}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Windows Defender Scheduled Scan Error=%MYERROR%
echo Windows Defender Scheduled Scan Error=%MYERROR% >> log.txt

powershell -Command "& {Get-ScheduledTask 'Windows Defender Verification' | Disable-ScheduledTask}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Windows Defender Verification Error=%MYERROR%
echo Windows Defender Verification Error=%MYERROR% >> log.txt

chcp 866
