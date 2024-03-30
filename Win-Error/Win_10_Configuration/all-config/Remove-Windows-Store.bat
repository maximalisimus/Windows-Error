@cd/d "%~dp0"
chcp 65001
@echo off

powershell -Command "& {Get-AppxPackage *Store | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove Win Store AppxPackage Error=%MYERROR%
echo Remove Win Store AppxPackage Error=%MYERROR% >> log.txt

powershell -Command "& {Get-AppxPackage *Store | Remove-AppxPackage -allusers}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove Win Store AppxPackage -allusers Error=%MYERROR%
echo Remove Win Store AppxPackage -allusers Error=%MYERROR% >> log.txt

powershell -Command "& {Get-AppXPackage *WindowsStore* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register '$($_.InstallLocation)\AppXManifest.xml'}}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove Win Store AppXManifest Error=%MYERROR%
echo Remove Win Store AppXManifest Error=%MYERROR% >> log.txt

chcp 866
