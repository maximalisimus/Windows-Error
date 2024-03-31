@cd/d "%~dp0"
chcp 65001
@echo off

sc config lmhosts start=auto 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config lmhosts start=auto Error=%MYERROR%
echo sc config lmhosts start=auto Error=%MYERROR% >> log.txt

sc config LanmanServer start=auto 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config LanmanServer start=auto Error=%MYERROR%
echo sc config LanmanServer start=auto Error=%MYERROR% >> log.txt

sc config fdPHost start=auto 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config fdPHost start=auto Error=%MYERROR%
echo sc config fdPHost start=auto Error=%MYERROR% >> log.txt

sc config FDResPub start=auto 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config FDResPub start=auto Error=%MYERROR%
echo sc config FDResPub start=auto Error=%MYERROR% >> log.txt

sc config SSDPSRV start=auto 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config SSDPSRV start=auto Error=%MYERROR%
echo sc config SSDPSRV start=auto Error=%MYERROR% >> log.txt

sc config upnphost start=auto 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config upnphost start=auto Error=%MYERROR%
echo sc config upnphost start=auto Error=%MYERROR% >> log.txt

sc start lmhosts 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc start lmhosts Error=%MYERROR%
echo sc start lmhosts Error=%MYERROR% >> log.txt

sc start LanmanServer 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc start LanmanServer Error=%MYERROR%
echo sc start LanmanServer Error=%MYERROR% >> log.txt

sc start fdPHost 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc start fdPHost Error=%MYERROR%
echo sc start fdPHost Error=%MYERROR% >> log.txt

sc start FDResPub 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc start FDResPub Error=%MYERROR%
echo sc start FDResPub Error=%MYERROR% >> log.txt

sc start SSDPSRV 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc start SSDPSRV Error=%MYERROR%
echo sc start SSDPSRV Error=%MYERROR% >> log.txt

sc start upnphost 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc start upnphost Error=%MYERROR%
echo sc start upnphost Error=%MYERROR% >> log.txt

sc config UsoSvc start=disabled 2>nul
SET MYERROR=%ERRORLEVEL%
echo disable UsoSvc Error=%MYERROR%
echo disable UsoSvc Error=%MYERROR% >> log.txt

sc stop UsoSvc 2>nul
SET MYERROR=%ERRORLEVEL%
echo stop UsoSvc Error=%MYERROR%
echo stop UsoSvc Error=%MYERROR% >> log.txt

sc config wuauserv start=disabled 2>nul
SET MYERROR=%ERRORLEVEL%
echo disable wuauserv Error=%MYERROR%
echo disable wuauserv Error=%MYERROR% >> log.txt

sc stop wuauserv 2>nul
SET MYERROR=%ERRORLEVEL%
echo stop wuauserv Error=%MYERROR%
echo stop wuauserv Error=%MYERROR% >> log.txt

sc stop WinDefend 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc stop WinDefend Error=%MYERROR%
echo sc stop WinDefend Error=%MYERROR% >> log.txt

sc config WinDefend start=disabled 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config WinDefend start=disabled Error=%MYERROR%
echo sc config WinDefend start=disabled Error=%MYERROR% >> log.txt

powershell -Command "& {Set-ExecutionPolicy RemoteSigned}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Set-ExecutionPolicy RemoteSigned Error=%MYERROR%
echo Set-ExecutionPolicy RemoteSigned Error=%MYERROR% >> log.txt

certutil -addstore "CA" "all-ca-cert.p7b" 2>nul
SET MYERROR=%ERRORLEVEL%
echo import all-ca-cert.p7b Error=%MYERROR%
echo import all-ca-cert.p7b Error=%MYERROR% >> log.txt

powershell -Command "& {Import-Certificate -FilePath all-ca-cert.p7b -CertStoreLocation Cert:\LocalMachine\CA}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo import all-ca-cert.p7b Error=%MYERROR%
echo import all-ca-cert.p7b Error=%MYERROR% >> log.txt

certutil -addstore "Root" "all-root-cert.p7b" 2>nul
SET MYERROR=%ERRORLEVEL%
echo import all-root-cert.p7b Error=%MYERROR%
echo import all-root-cert.p7b Error=%MYERROR% >> log.txt

powershell -Command "& {Import-Certificate -FilePath all-root-cert.p7b -CertStoreLocation Cert:\LocalMachine\Root}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo import all-root-cert.p7b Error=%MYERROR%
echo import all-root-cert.p7b Error=%MYERROR% >> log.txt

powershell -Command "& {Set-ProcessMitigation -PolicyFilePath Settings.xml}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell -Command "& {Get-ProcessMitigation -RegistryConfigFilePath Settings.xml}" 2^>^nul >> log.txt
echo improt Settings.xml Error=%MYERROR%
echo improt Settings.xml Error=%MYERROR% >> log.txt

reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f 2>nul
echo reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f 2>nul >> log.txt
echo reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f 2>nul >> log.txt
SET MYERROR=%ERRORLEVEL%
echo EnableLUA
echo EnableLUA >> log.txt

sc config seclogon start=auto 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config seclogon start=auto Error=%MYERROR%
echo sc config seclogon start=auto Error=%MYERROR% >> log.txt

sc start seclogon 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc start seclogon Error=%MYERROR%
echo sc start seclogon Error=%MYERROR% >> log.txt

reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableSecureUIAPaths /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo EnableSecureUIAPaths Error=%MYERROR%
echo EnableSecureUIAPaths Error=%MYERROR% >> log.txt

reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableUIADesktopToggle /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo EnableUIADesktopToggle Error=%MYERROR%
echo EnableUIADesktopToggle Error=%MYERROR% >> log.txt

reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 5 /f 0>>log.txt 2>>log.txt
echo reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 1 /f  Error=%MYERROR% >> log.txt
echo ConsentPromptBehaviorAdmin Error=%MYERROR%
echo ConsentPromptBehaviorAdmin Error=%MYERROR% >> log.txt

reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo  PromptOnSecureDesktop Error=%MYERROR%
echo  PromptOnSecureDesktop Error=%MYERROR% >> log.txt

reg ADD HKLM\SYSTEM\CurrentControlSet\Control\Print /v RpcAuthnLevelPrivacyEnabled /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo RpcAuthnLevelPrivacyEnabled Error=%MYERROR%
echo RpcAuthnLevelPrivacyEnabled Error=%MYERROR% >> log.txt

reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v RestrictDriverInstallationToAdministrators /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo RestrictDriverInstallationToAdministrators Error=%MYERROR%
echo RestrictDriverInstallationToAdministrators Error=%MYERROR% >> log.txt

reg add HKLM\SOFTWARE\MICROSOFT\OLE /v EnableDCOM /t reg_sz /d y /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo EnableDCOM Error=%MYERROR%
echo EnableDCOM Error=%MYERROR% >> log.txt

reg add HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters /v AllowInsecureGuestAuth /t reg_dword /d 00000001 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo AllowInsecureGuestAuth Error=%MYERROR%
echo AllowInsecureGuestAuth Error=%MYERROR% >> log.txt

reg add HKLM\Software\Microsoft\Wbem\Scripting /v "Default Impersonation Level" /t REG_DWORD /d 3 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo Default Impersonation Level Error=%MYERROR%
echo Default Impersonation Level Error=%MYERROR% >> log.txt

setlocal
for /f "tokens=*" %%k in ('reg query HKLM\SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces') do (
	reg add %%k /v NetbiosOptions /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
	echo %%k Error=%MYERROR%
	echo %%k Error=%MYERROR% >> log.txt
) 2>nul
SET MYERROR=%ERRORLEVEL%
endlocal
echo Config Net Interfaces Error=%MYERROR%
echo Config Net Interfaces Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableAntiSpyware Error=%MYERROR%
echo DisableAntiSpyware Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v AlowFastServiceStartup /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo AlowFastServiceStartup Error=%MYERROR%
echo AlowFastServiceStartup Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v ServiceKeepAlive /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo ServiceKeepAlive Error=%MYERROR%
echo ServiceKeepAlive Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableIOAVProtection Error=%MYERROR%
echo DisableIOAVProtection Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableRealtimeMonitoring Error=%MYERROR%
echo DisableRealtimeMonitoring Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableBehaviorMonitoring Error=%MYERROR%
echo DisableBehaviorMonitoring Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableOnAccessProtection Error=%MYERROR%
echo DisableOnAccessProtection Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableScanOnRealtimeEnable Error=%MYERROR%
echo DisableScanOnRealtimeEnable Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableIOAVProtection Error=%MYERROR%
echo DisableIOAVProtection Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v LocalSettingsOverrideSpynetReporting /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo LocalSettingsOverrideSpynetReporting Error=%MYERROR%
echo LocalSettingsOverrideSpynetReporting Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v DisableBlockAtFirstSeen /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableBlockAtFirstSeen Error=%MYERROR%
echo DisableBlockAtFirstSeen Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v LocalSettingOverrideSpynetReporting /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo LocalSettingOverrideSpynetReporting Error=%MYERROR%
echo LocalSettingOverrideSpynetReporting Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo SubmitSamplesConsent Error=%MYERROR%
echo SubmitSamplesConsent Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo SubmitSamplesConsent Error=%MYERROR%
echo SubmitSamplesConsent Error=%MYERROR% >> log.txt

reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WinDefend /v Start /t REG_DWORD /d 4 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo WinDefend Start 4 Error=%MYERROR%
echo WinDefend Start 4 Error=%MYERROR% >> log.txt

reg add "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" /v ErrorAction /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo ErrorAction Start 4 Error=%MYERROR%
echo ErrorAction Start 4 Error=%MYERROR% >> log.txt

reg add "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" /v DisableEmailScanning /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableEmailScanning Start 4 Error=%MYERROR%
echo DisableEmailScanning Start 4 Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v ErrorAction /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo ErrorAction Start 4 Error=%MYERROR%
echo ErrorAction Start 4 Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SpynetReporting /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo SpynetReporting Start 4 Error=%MYERROR%
echo SpynetReporting Start 4 Error=%MYERROR% >> log.txt

reg ADD HKLM\SYSTEM\CurrentControlSet\Services\Sense /v Start /t REG_DWORD /d 4 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo WinDefend Sense Start 4 Error=%MYERROR%
echo WinDefend Sense Start 4 Error=%MYERROR% >> log.txt

reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdFilter /v Start /t REG_DWORD /d 4 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo WinDefend WdFilter Start 4 Error=%MYERROR%
echo WinDefend WdFilter Start 4 Error=%MYERROR% >> log.txt

reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv /v Start /t REG_DWORD /d 4 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo WinDefend WdNisDrv Start 4 Error=%MYERROR%
echo WinDefend WdNisDrv Start 4 Error=%MYERROR% >> log.txt

reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc /v Start /t REG_DWORD /d 4 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo WinDefend WdNisSvc Start 4 Error=%MYERROR%
echo WinDefend WdNisSvc Start 4 Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Piriform\CCleaner /v Language /t reg_sz /d 1049 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaer Language Error=%MYERROR%
echo CCleaer Language Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Piriform\CCleaner /v UpdateBackground /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaner UpdateBackground Error=%MYERROR%
echo CCleaner UpdateBackground Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Piriform\CCleaner /v UpdateCheck /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaner UpdateCheck Error=%MYERROR%
echo CCleaner UpdateCheck Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Piriform\CCleaner /v HelpImproveCCleaner /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaner HelpImproveCCleaner Error=%MYERROR%
echo CCleaner HelpImproveCCleaner Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Piriform\CCleaner /v PrefsPrivacyShowOffers1stParty /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaner PrefsPrivacyShowOffers1stParty Error=%MYERROR%
echo CCleaner PrefsPrivacyShowOffers1stParty Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Piriform\CCleaner /v PrefsPrivacyShowOffers3rdParty /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaner PrefsPrivacyShowOffers3rdParty Error=%MYERROR%
echo CCleaner PrefsPrivacyShowOffers3rdParty Error=%MYERROR% >> log.txt

reg ADD HKCU\SOFTWARE\Piriform\CCleaner /v "(Cfg)PC" /t reg_sz /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaner (Cfg)PC Error=%MYERROR%
echo CCleaner (Cfg)PC Error=%MYERROR% >> log.txt

reg ADD HKCU\SOFTWARE\Piriform\CCleaner /v "(Cfg)PE" /t reg_sz /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaner (Cfg)PE Error=%MYERROR%
echo CCleaner (Cfg)PE Error=%MYERROR% >> log.txt

(
	echo 0.0.0.0 alpha-crap.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts Error=%MYERROR% >> log.txt
	echo 0.0.0.0 analytics.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts Error=%MYERROR% >> log.txt
	echo 0.0.0.0 ip-info.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts Error=%MYERROR% >> log.txt
	echo 0.0.0.0 ipm-provider.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts Error=%MYERROR% >> log.txt
	echo 0.0.0.0 license-api.ccleaner.com >> %SystemRoot%\System32\drivers\etc\hosts Error=%MYERROR% >> log.txt
	echo 0.0.0.0 license.piriform.com >> %SystemRoot%\System32\drivers\etc\hosts Error=%MYERROR% >> log.txt
	echo 0.0.0.0 ncc.avast.com >> %SystemRoot%\System32\drivers\etc\hosts Error=%MYERROR% >> log.txt
	echo 0.0.0.0 ncc.avast.com.edgesuite.net >> %SystemRoot%\System32\drivers\etc\hosts Error=%MYERROR% >> log.txt
	echo 0.0.0.0 shepherd.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts Error=%MYERROR% >> log.txt
	echo 0.0.0.0 www.ccleaner.com >> %SystemRoot%\System32\drivers\etc\hosts Error=%MYERROR% >> log.txt
) 2>nul
SET MYERROR=%ERRORLEVEL%
echo hosts config on CCleaner Error=%MYERROR%
echo hosts config on CCleaner Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo NewStartPanel My Computer Error=%MYERROR%
echo NewStartPanel My Computer Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo ClassicStartMenu My Computer Error=%MYERROR%
echo ClassicStartMenu My Computer Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}" /v "@" /t reg_sz /d "Recycle Bin" /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo Desktop Icon Recycle Bin Error=%MYERROR%
echo Desktop Icon Recycle Bin Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo NewStartPanel Recycle Bin Error=%MYERROR%
echo NewStartPanel Recycle Bin Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo ClassicStartMenu Recycle Bin Error=%MYERROR%
echo ClassicStartMenu Recycle Bin Error=%MYERROR% >> log.txt

reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v EnableSmartScreen /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo EnableSmartScreen=0 Error=%MYERROR%
echo EnableSmartScreen=0 Error=%MYERROR% >> log.txt

reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v SmartScreenEnabled /t reg_sz /d "Off" /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo SmartScreenEnabled=0 Error=%MYERROR%
echo SmartScreenEnabled=0 Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter /v EnabledV9 /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo EnabledV9 Error=%MYERROR%
echo EnabledV9 Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost /v EnableWebContentEvaluation  /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo EnableWebContentEvaluation Error=%MYERROR%
echo EnableWebContentEvaluation Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Policies\Microsoft\Windows\Explorer /v DisableNotificationCenter  /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableNotificationCenter Error=%MYERROR%
echo DisableNotificationCenter Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications /v ToastEnabled  /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo ToastEnabled Error=%MYERROR%
echo ToastEnabled Error=%MYERROR% >> log.txt

reg ADD HKLM\SYSTEM\CurrentControlSet\Services\mpssvc /v Start /t REG_DWORD /d 4 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo mpssvc Start 4 Error=%MYERROR%
echo mpssvc Start 4 Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo Windows Defender DisableNotifications Error=%MYERROR%
echo Windows Defender DisableNotifications Error=%MYERROR% >> log.txt

reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo Disable Cortana Error=%MYERROR%
echo Disable Cortana Error=%MYERROR% >> log.txt

netsh advfirewall set allprofiles state off 2>nul
SET MYERROR=%ERRORLEVEL%
echo Disable Firewall Error=%MYERROR%
echo Disable Firewall Error=%MYERROR% >> log.txt

gpupdate /force
echo gpupdate /force Error=%MYERROR%
echo gpupdate /force Error=%MYERROR% >> log.txt

::start Remove-OneDrive-Programs.bat
::start Remove-Select-Soft.bat

chcp 866

pause
