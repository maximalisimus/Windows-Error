@cd/d "%~dp0"
chcp 65001
@echo off
powershell -Command Get-AppxPackage Microsoft.SecHealthUI -AllUsers | Reset-AppxPackage 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell -Command Get-AppxPackage Microsoft.SecHealthUI -AllUsers | Reset-AppxPackage Error=%MYERROR%
echo powershell -Command Get-AppxPackage Microsoft.SecHealthUI -AllUsers | Reset-AppxPackage Error=%MYERROR% >> log.txt
chcp 866

pause
