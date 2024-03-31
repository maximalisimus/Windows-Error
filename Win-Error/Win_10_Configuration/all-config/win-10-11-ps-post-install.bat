@cd/d "%~dp0"
chcp 65001
@echo off

powershell -Command "& {Set-MpPreference -DisableRealtimeMonitoring $true}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell DisableRealtimeMonitoring Error=%MYERROR%
echo powershell DisableRealtimeMonitoring Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference -PUAProtection 0}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell PUAProtection Error=%MYERROR%
echo powershell PUAProtection Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference DisableArchiveScanning $true}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell DisableArchiveScanning Error=%MYERROR%
echo powershell DisableArchiveScanning Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference DisableBehaviorMonitoring $true}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell DisableBehaviorMonitoring Error=%MYERROR%
echo powershell DisableBehaviorMonitoring Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference DisableBlockAtFirstSeen $true}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell DisableBlockAtFirstSeen Error=%MYERROR%
echo powershell DisableBlockAtFirstSeen Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference DisableIOAVProtection $true}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell DisableIOAVProtection Error=%MYERROR%
echo powershell DisableIOAVProtection Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference DisablePrivacyMode $true}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell DisablePrivacyMode Error=%MYERROR%
echo powershell DisablePrivacyMode Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference DisableScanningNetworkFiles}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell DisableScanningNetworkFiles Error=%MYERROR%
echo powershell DisableScanningNetworkFiles Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference DisableScriptScanning $true}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell DisableScriptScanning Error=%MYERROR%
echo powershell DisableScriptScanning Error=%MYERROR% >> log.txt

chcp 866

pause
