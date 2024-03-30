@cd/d "%~dp0"
chcp 65001
@echo off

echo sc config lmhosts start=auto >> log.txt
sc config lmhosts start=auto 2>nul
echo sc config LanmanServer start=auto >> log.txt
sc config LanmanServer start=auto 2>nul
echo sc config fdPHost start=auto >> log.txt
sc config fdPHost start=auto 2>nul
echo sc config FDResPub start=auto >> log.txt
sc config FDResPub start=auto 2>nul
echo sc config SSDPSRV start=auto >> log.txt
sc config SSDPSRV start=auto 2>nul
echo sc config upnphost start=auto >> log.txt
sc config upnphost start=auto 2>nul

echo sc start lmhosts >> log.txt
sc start lmhosts 2>nul
echo sc start LanmanServer >> log.txt
sc start LanmanServer 2>nul
echo sc start fdPHost >> log.txt
sc start fdPHost 2>nul
echo sc start FDResPub >> log.txt
sc start FDResPub 2>nul
echo sc start SSDPSRV >> log.txt
sc start SSDPSRV 2>nul
echo sc start upnphost >> log.txt
sc start upnphost 2>nul

echo disable UsoSvc >> log.txt
sc config UsoSvc start=disabled 2>nul
echo stop UsoSvc >> log.txt
sc stop UsoSvc 2>nul

echo disable wuauserv >> log.txt
sc config wuauserv start=disabled 2>nul
echo stop wuauserv >> log.txt
sc stop wuauserv 2>nul

echo sc stop WinDefend >> log.txt
sc stop WinDefend 2>nul
echo sc config WinDefend start=disabled >> log.txt
sc config WinDefend start=disabled 2>nul

echo Set-ExecutionPolicy RemoteSigned >> log.txt
powershell -Command Set-ExecutionPolicy RemoteSigned 2>nul
echo import all-ca-cert.p7b >> log.txt
certutil -addstore "CA" "all-ca-cert.p7b" 2>nul
echo import all-ca-cert.p7b >> log.txt
powershell -Command Import-Certificate -FilePath "all-ca-cert.p7b" -CertStoreLocation Cert:\LocalMachine\CA 2>nul
echo import all-root-cert.p7b >> log.txt
certutil -addstore "Root" "all-root-cert.p7b" 2>nul
echo import all-root-cert.p7b >> log.txt
powershell -Command Import-Certificate -FilePath "all-root-cert.p7b" -CertStoreLocation Cert:\LocalMachine\Root 2>nul

echo powershell -Command Get-ProcessMitigation -RegistryConfigFilePath Settings.xml 2>nul
echo improt Settings.xml >> log.txt
powershell -Command Set-ProcessMitigation -PolicyFilePath Settings.xml 2>nul

echo EnableLUA >> log.txt
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f 2>nul
echo EnableSecureUIAPaths >> log.txt
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableSecureUIAPaths /t REG_DWORD /d 1 /f 2>nul
echo EnableUIADesktopToggle >> log.txt
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableUIADesktopToggle /t REG_DWORD /d 0 /f 2>nul

echo reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f  >> log.txt
echo ConsentPromptBehaviorAdmin >> log.txt
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 5 /f 2>nul

echo  PromptOnSecureDesktop >> log.txt
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f 2>nul

echo RemoveWindowsStore >> log.txt
reg ADD HKLM\SOFTWARE\Policies\Microsoft\WindowsStore /v RemoveWindowsStore /t REG_DWORD /d 1 /f 2>nul
echo RemoveWindowsStore >> log.txt
reg ADD HKCU\Software\Policies\Microsoft\WindowsStore /v RemoveWindowsStore /t REG_DWORD /d 1 /f 2>nul

echo RpcAuthnLevelPrivacyEnabled >> log.txt
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\Print /v RpcAuthnLevelPrivacyEnabled /t REG_DWORD /d 0 /f 2>nul

echo RestrictDriverInstallationToAdministrators >> log.txt
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v RestrictDriverInstallationToAdministrators /t REG_DWORD /d 0 /f 2>nul

echo EnableDCOM >> log.txt
reg add HKLM\SOFTWARE\MICROSOFT\OLE /v EnableDCOM /t reg_sz /d y /f 2>nul

echo AllowInsecureGuestAuth >> log.txt
reg add HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters /v AllowInsecureGuestAuth /t reg_dword /d 00000001 /f 2>nul

echo Default Impersonation Level >> log.txt
reg add HKLM\Software\Microsoft\Wbem\Scripting /v "Default Impersonation Level" /t REG_DWORD /d 3 /f 2>nul

echo Config Net Interfaces >> log.txt
setlocal
for /f "tokens=*" %%k in ('reg query HKLM\SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces') do (
	reg add %%k /v NetbiosOptions /t REG_DWORD /d 1 /f 2>nul
	echo %%k >> log.txt
) 2>nul
endlocal

echo DisableAntiSpyware >> log.txt
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f 2>nul
echo AlowFastServiceStartup >> log.txt
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v AlowFastServiceStartup /t REG_DWORD /d 0 /f 2>nul
echo ServiceKeepAlive >> log.txt
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v ServiceKeepAlive /t REG_DWORD /d 0 /f 2>nul
echo DisableIOAVProtection >> log.txt
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /t REG_DWORD /d 1 /f 2>nul
echo DisableRealtimeMonitoring >> log.txt
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f 2>nul
echo DisableBehaviorMonitoring >> log.txt
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f 2>nul
echo DisableOnAccessProtection >> log.txt
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f 2>nul
echo DisableScanOnRealtimeEnable >> log.txt
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 1 /f 2>nul
echo DisableIOAVProtection >> log.txt
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /t REG_DWORD /d 1 /f 2>nul
echo LocalSettingsOverrideSpynetReporting >> log.txt
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v LocalSettingsOverrideSpynetReporting /t REG_DWORD /d 0 /f 2>nul
echo DisableBlockAtFirstSeen >> log.txt
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v DisableBlockAtFirstSeen /t REG_DWORD /d 1 /f 2>nul
echo LocalSettingOverrideSpynetReporting >> log.txt
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v LocalSettingOverrideSpynetReporting /t REG_DWORD /d 0 /f 2>nul
echo SubmitSamplesConsent >> log.txt
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f 2>nul
echo SubmitSamplesConsent >> log.txt
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f 2>nul
echo WinDefend Start 4 >> log.txt
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WinDefend /v Start /t REG_DWORD /d 4 /f 2>nul
echo WinDefend Sense Start 4 >> log.txt
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\Sense /v Start /t REG_DWORD /d 4 /f 2>nul
echo WinDefend WdFilter Start 4 >> log.txt
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdFilter /v Start /t REG_DWORD /d 4 /f 2>nul
echo WinDefend WdNisDrv Start 4 >> log.txt
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv /v Start /t REG_DWORD /d 4 /f 2>nul
echo WinDefend WdNisSvc Start 4 >> log.txt
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc /v Start /t REG_DWORD /d 4 /f 2>nul

echo CCleaer Language >> log.txt
reg ADD HKCU\Software\Piriform\CCleaner /v Language /t reg_sz /d 1049 /f 2>nul
echo CCleaner UpdateBackground >> log.txt
reg ADD HKCU\Software\Piriform\CCleaner /v UpdateBackground /t REG_DWORD /d 0 /f 2>nul
echo CCleaner UpdateCheck >> log.txt
reg ADD HKCU\Software\Piriform\CCleaner /v UpdateCheck /t REG_DWORD /d 0 /f 2>nul
echo CCleaner HelpImproveCCleaner >> log.txt
reg ADD HKCU\Software\Piriform\CCleaner /v HelpImproveCCleaner /t REG_DWORD /d 0 /f 2>nul
echo CCleaner PrefsPrivacyShowOffers1stParty >> log.txt
reg ADD HKCU\Software\Piriform\CCleaner /v PrefsPrivacyShowOffers1stParty /t REG_DWORD /d 0 /f 2>nul
echo CCleaner PrefsPrivacyShowOffers3rdParty >> log.txt
reg ADD HKCU\Software\Piriform\CCleaner /v PrefsPrivacyShowOffers3rdParty /t REG_DWORD /d 0 /f 2>nul
echo CCleaner (Cfg)PC >> log.txt
reg ADD HKCU\SOFTWARE\Piriform\CCleaner /v "(Cfg)PC" /t reg_sz /d 0 /f 2>nul
echo CCleaner (Cfg)PE >> log.txt
reg ADD HKCU\SOFTWARE\Piriform\CCleaner /v "(Cfg)PE" /t reg_sz /d 0 /f 2>nul

echo hosts config on CCleaner >> log.txt
echo 0.0.0.0 alpha-crap.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts >> log.txt
echo 0.0.0.0 analytics.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts >> log.txt
echo 0.0.0.0 ip-info.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts >> log.txt
echo 0.0.0.0 ipm-provider.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts >> log.txt
echo 0.0.0.0 license-api.ccleaner.com >> %SystemRoot%\System32\drivers\etc\hosts >> log.txt
echo 0.0.0.0 license.piriform.com >> %SystemRoot%\System32\drivers\etc\hosts >> log.txt
echo 0.0.0.0 ncc.avast.com >> %SystemRoot%\System32\drivers\etc\hosts >> log.txt
echo 0.0.0.0 ncc.avast.com.edgesuite.net >> %SystemRoot%\System32\drivers\etc\hosts >> log.txt
echo 0.0.0.0 shepherd.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts >> log.txt
echo 0.0.0.0 www.ccleaner.com >> %SystemRoot%\System32\drivers\etc\hosts >> log.txt

echo NewStartPanel >> log.txt
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f 2>nul
echo ClassicStartMenu >> log.txt
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f 2>nul
echo Recycle Bin >> log.txt
reg ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}" /v "@" /t reg_sz /d "Recycle Bin" /f 2>nul
echo NewStartPanel >> log.txt
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f 2>nul
echo ClassicStartMenu >> log.txt
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f 2>nul

echo EnableSmartScreen >> log.txt
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v EnableSmartScreen /t REG_DWORD /d 0 /f 2>nul
echo SmartScreenEnabled >> log.txt
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v SmartScreenEnabled /t reg_sz /d "Off" /f 2>nul
echo EnabledV9 >> log.txt
reg ADD HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter /v EnabledV9 /t REG_DWORD /d 0 /f 2>nul
echo EnableWebContentEvaluation >> log.txt
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost /v EnableWebContentEvaluation  /t REG_DWORD /d 0 /f 2>nul

echo DisableNotificationCenter >> log.txt
reg ADD HKCU\Software\Policies\Microsoft\Windows\Explorer /v DisableNotificationCenter  /t REG_DWORD /d 1 /f 2>nul

echo ToastEnabled >> log.txt
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications /v ToastEnabled  /t REG_DWORD /d 1 /f 2>nul

echo mpssvc Start 4 >> log.txt
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\mpssvc /v Start /t REG_DWORD /d 4 /f 2>nul
echo Windows Defender DisableNotifications >> log.txt
reg ADD "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 1 /f 2>nul

echo Disable Cortana >> log.txt
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f 2>nul

echo disable WindowsUpdate >> log.txt
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /t REG_DWORD /d 1 /f 2>nul
echo AUOptions >> log.txt
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /t REG_DWORD /d 2 /f 2>nul
echo DoNotConnectToWindowsUpdateInternetLocations >> log.txt
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v DoNotConnectToWindowsUpdateInternetLocations  /t REG_DWORD /d 1 /f 2>nul
echo UpdateServiceUrlAlternate server.wsus >> log.txt
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v UpdateServiceUrlAlternate /t reg_sz /d "server.wsus" /f 2>nul
echo WUServer server.wsus >> log.txt
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v WUServer /t reg_sz /d "server.wsus" /f 2>nul
echo WUStatusServer server.wsus >> log.txt
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v WUStatusServer /t reg_sz /d "server.wsus" /f 2>nul
echo UseWUServer >> log.txt
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v UseWUServer  /t REG_DWORD /d 1 /f 2>nul
echo disable UsoSvc 4 >> log.txt
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc /v Start /t REG_DWORD /d 4 /f 2>nul

echo Disable Firewall >> log.txt
netsh advfirewall set allprofiles state off 2>nul

echo gpupdate /force >> log.txt
gpupdate /force

echo wusa /uninstall /kb:5005565 >> log.txt
wusa /uninstall /kb:5005565 2>nul

echo Remove Win Store >> log.txt
powershell -Command Get-AppxPackage *Store | Remove-AppxPackage 2>nul
echo Remove Win Store >> log.txt
powershell -Command Get-AppxPackage *Store | Remove-AppxPackage -allusers 2>nul

echo Remove Win Store >> log.txt
powershell -Command Get-AppXPackage *WindowsStore* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"} 2>nul

echo Remove Cortana >> log.txt
powershell -Command  Get-appxpackage -allusers *Microsoft.549981C3F5F10* | Remove-AppxPackage 2>nul

echo DisableRealtimeMonitoring >> log.txt
powershell -Command Set-MpPreference -DisableRealtimeMonitoring $true 2>nul

echo Windows Defender Cache Maintenance >> log.txt
powershell -Command Get-ScheduledTask "Windows Defender Cache Maintenance" | Disable-ScheduledTask 2>nul
echo Windows Defender Cleanup >> log.txt
powershell -Command Get-ScheduledTask "Windows Defender Cleanup" | Disable-ScheduledTask 2>nul
echo Windows Defender Scheduled Scan >> log.txt
powershell -Command Get-ScheduledTask "Windows Defender Scheduled Scan" | Disable-ScheduledTask 2>nul
echo Windows Defender Verification >> log.txt
powershell -Command Get-ScheduledTask "Windows Defender Verification" | Disable-ScheduledTask 2>nul

echo start %SystemRoot%\UpdaterDisabler\UpdaterDisabler.exe -install >> log.txt
start %SystemRoot%\UpdaterDisabler\UpdaterDisabler.exe -install 2>nul

REM echo Setup secpol.msc >> log.txt
REM FOR %F IN ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~*.mum") DO ( DISM /Online /NoRestart /Add-Package:"%F" )

REM echo Search gpedit.msc >> log.txt
REM dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >find-gpedit.txt
REM dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>find-gpedit.txt
REM echo Setup gpedit.msc >> log.txt
REM for /f %%i in ('findstr /i . find-gpedit.txt 2^>nul') do dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"
REM echo gpedit.msc is Setuped >> log.txt

chcp 866

pause

