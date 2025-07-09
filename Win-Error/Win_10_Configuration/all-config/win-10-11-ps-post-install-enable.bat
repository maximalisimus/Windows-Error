@cd/d "%~dp0"
chcp 65001
@echo off

powershell -Command "& {Set-MpPreference -DisableRealtimeMonitoring $false}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell EnableRealtimeMonitoring Error=%MYERROR%
echo powershell EnableRealtimeMonitoring Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference -PUAProtection 1}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell EnablePUAProtection Error=%MYERROR%
echo powershell EnablePUAProtection Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference DisableArchiveScanning $false}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell EnableArchiveScanning Error=%MYERROR%
echo powershell EnableArchiveScanning Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference DisableBehaviorMonitoring $false}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell EnableBehaviorMonitoring Error=%MYERROR%
echo powershell EnableBehaviorMonitoring Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference DisableBlockAtFirstSeen $false}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell EnableBlockAtFirstSeen Error=%MYERROR%
echo powershell EnableBlockAtFirstSeen Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference DisableIOAVProtection $false}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell EnableIOAVProtection Error=%MYERROR%
echo powershell EnableIOAVProtection Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference DisablePrivacyMode $false}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell EnablePrivacyMode Error=%MYERROR%
echo powershell EnablePrivacyMode Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference DisableScanningNetworkFiles $false}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell EnableScanningNetworkFiles Error=%MYERROR%
echo powershell EnableScanningNetworkFiles Error=%MYERROR% >> log.txt

powershell -Command "& {Set-MpPreference DisableScriptScanning $false}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell EnableScriptScanning Error=%MYERROR%
echo powershell EnableScriptScanning Error=%MYERROR% >> log.txt

chcp 866

pause
