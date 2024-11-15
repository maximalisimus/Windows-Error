@cd/d "%~dp0"
chcp 65001
@echo off

REM *** Планировщик отправки телеметрии ***

REM *** Task that collects data for SmartScreen in Windows ***
schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable Error=%MYERROR%  >> log.txt

REM *** Collects program telemetry information if opted-in to the Microsoft Customer Experience Improvement Program ***
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable Error=%MYERROR%  >> log.txt

REM *** Collects program telemetry information if opted-in to the Microsoft Customer Experience Improvement Program ***
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable Error=%MYERROR% >> log.txt

REM *** Aggregates and uploads Application Telemetry information if opted-in to the Microsoft Customer Experience Improvement Program ***
schtasks /Change /TN "Microsoft\Windows\Application Experience\AitAgent" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\Application Experience\AitAgent" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\Application Experience\AitAgent" /Disable Error=%MYERROR%  >> log.txt

REM *** This task collects and uploads autochk SQM data if opted-in to the Microsoft Customer Experience Improvement Program ***
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable Error=%MYERROR%  >> log.txt

REM *** If the user has consented to participate in the Windows Customer Experience Improvement Program, this job collects and sends usage data to Microsoft ***
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable Error=%MYERROR%  >> log.txt

REM *** The Kernel CEIP (Customer Experience Improvement Program) task collects additional information about the system and sends this data to Microsoft. *** 
REM *** If the user has not consented to participate in Windows CEIP, this task does nothing ***
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable Error=%MYERROR%  >> log.txt

REM *** The Bluetooth CEIP (Customer Experience Improvement Program) task collects Bluetooth related statistics and information about your machine and sends it to Microsoft ***
REM *** The information received is used to help improve the reliability, stability, and overall functionality of Bluetooth in Windows ***
REM *** If the user has not consented to participate in Windows CEIP, this task does not do anything.***
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\BthSQM" Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\BthSQM" Error=%MYERROR%  >> log.txt

REM *** Create Object Task ***
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable Error=%MYERROR%  >> log.txt

REM *** The Windows Disk Diagnostic reports general disk and system information to Microsoft for users participating in the Customer Experience Program ***
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable Error=%MYERROR%  >> log.txt

REM *** Measures a system's performance and capabilities ***
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable Error=%MYERROR%  >> log.txt

REM *** Network information collector ***
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable Error=%MYERROR%  >> log.txt

REM *** Initializes Family Safety monitoring and enforcement ***
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable Error=%MYERROR%  >> log.txt

REM *** Synchronizes the latest settings with the Family Safety website ***
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyRefresh" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyRefresh" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyRefresh" /Disable Error=%MYERROR%  >> log.txt

REM *** SQM (Software Quality Management) ***
schtasks /Change /TN "Microsoft\Windows\IME\SQM data sender" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Windows\IME\SQM data sender" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Windows\IME\SQM data sender" /Disable Error=%MYERROR%  >> log.txt

REM *** This task initiates the background task for Office Telemetry Agent, which scans and uploads usage and error information for Office solutions ***
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /Disable Error=%MYERROR%  >> log.txt

REM *** This task initiates Office Telemetry Agent, which scans and uploads usage and error information for Office solutions when a user logs on to the computer ***
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /Disable 2>nul
SET MYERROR=%ERRORLEVEL%
echo schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /Disable Error=%MYERROR%
echo schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /Disable Error=%MYERROR%  >> log.txt

chcp 866

pause
