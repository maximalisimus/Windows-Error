@cd/d "%~dp0"
chcp 65001
@echo off

powershell -Command "& {Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register '$($_.InstallLocation)\AppXManifest.xml'}}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Restore All AppxPackage Error=%MYERROR%
echo Restore All AppxPackage Error=%MYERROR% >> log.txt

chcp 866
