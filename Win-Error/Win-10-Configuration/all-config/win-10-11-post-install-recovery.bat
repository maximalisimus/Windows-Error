@cd/d "%~dp0"
chcp 65001
@echo off

powershell -Command "& {Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force Error=%MYERROR%
echo Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force Error=%MYERROR% >> log.txt

powershell -Command "& {Set-ProcessMitigation -PolicyFilePath Settings-enable.xml}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell -Command "& {Get-ProcessMitigation -RegistryConfigFilePath Settings-enable.xml}" 2^>^nul >> log.txt
echo improt Settings-enable.xml Error=%MYERROR%
echo improt Settings-enable.xml Error=%MYERROR% >> log.txt

reg DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /f 2>nul
echo reg DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /f 2>nul >> log.txt
echo reg DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /f 2>nul >> log.txt
SET MYERROR=%ERRORLEVEL%
echo EnableLUA
echo EnableLUA >> log.txt

reg DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableSecureUIAPaths /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo EnableSecureUIAPaths Error=%MYERROR%
echo EnableSecureUIAPaths Error=%MYERROR% >> log.txt

reg DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableUIADesktopToggle /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo EnableUIADesktopToggle Error=%MYERROR%
echo EnableUIADesktopToggle Error=%MYERROR% >> log.txt

reg DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /f 0>>log.txt 2>>log.txt
echo reg DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /f  Error=%MYERROR% >> log.txt
echo ConsentPromptBehaviorAdmin Error=%MYERROR%
echo ConsentPromptBehaviorAdmin Error=%MYERROR% >> log.txt

reg DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v PromptOnSecureDesktop /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo  PromptOnSecureDesktop Error=%MYERROR%
echo  PromptOnSecureDesktop Error=%MYERROR% >> log.txt

reg DELETE HKLM\SYSTEM\CurrentControlSet\Control\Print /v RpcAuthnLevelPrivacyEnabled /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo RpcAuthnLevelPrivacyEnabled Error=%MYERROR%
echo RpcAuthnLevelPrivacyEnabled Error=%MYERROR% >> log.txt

reg DELETE "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v RestrictDriverInstallationToAdministrators /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo RestrictDriverInstallationToAdministrators Error=%MYERROR%
echo RestrictDriverInstallationToAdministrators Error=%MYERROR% >> log.txt

reg DELETE HKLM\SOFTWARE\MICROSOFT\OLE /v EnableDCOM /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo EnableDCOM Error=%MYERROR%
echo EnableDCOM Error=%MYERROR% >> log.txt

reg DELETE HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters /v AllowInsecureGuestAuth /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo AllowInsecureGuestAuth Error=%MYERROR%
echo AllowInsecureGuestAuth Error=%MYERROR% >> log.txt

reg DELETE HKLM\Software\Microsoft\Wbem\Scripting /v "Default Impersonation Level" /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo Default Impersonation Level Error=%MYERROR%
echo Default Impersonation Level Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableAntiSpyware Error=%MYERROR%
echo DisableAntiSpyware Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v AlowFastServiceStartup /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo AlowFastServiceStartup Error=%MYERROR%
echo AlowFastServiceStartup Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v ServiceKeepAlive /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo ServiceKeepAlive Error=%MYERROR%
echo ServiceKeepAlive Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableIOAVProtection Error=%MYERROR%
echo DisableIOAVProtection Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableRealtimeMonitoring Error=%MYERROR%
echo DisableRealtimeMonitoring Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableBehaviorMonitoring Error=%MYERROR%
echo DisableBehaviorMonitoring Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableOnAccessProtection Error=%MYERROR%
echo DisableOnAccessProtection Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableScanOnRealtimeEnable Error=%MYERROR%
echo DisableScanOnRealtimeEnable Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableIOAVProtection Error=%MYERROR%
echo DisableIOAVProtection Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v LocalSettingsOverrideSpynetReporting /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo LocalSettingsOverrideSpynetReporting Error=%MYERROR%
echo LocalSettingsOverrideSpynetReporting Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v DisableBlockAtFirstSeen /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableBlockAtFirstSeen Error=%MYERROR%
echo DisableBlockAtFirstSeen Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v LocalSettingOverrideSpynetReporting /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo LocalSettingOverrideSpynetReporting Error=%MYERROR%
echo LocalSettingOverrideSpynetReporting Error=%MYERROR% >> log.txt

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo SubmitSamplesConsent Error=%MYERROR%
echo SubmitSamplesConsent Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo SubmitSamplesConsent Error=%MYERROR%
echo SubmitSamplesConsent Error=%MYERROR% >> log.txt

reg DELETE HKLM\SYSTEM\CurrentControlSet\Services\WinDefend /v Start /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo WinDefend Error=%MYERROR%
echo WinDefend Error=%MYERROR% >> log.txt

reg DELETE "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" /v ErrorAction /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo ErrorAction Error=%MYERROR%
echo ErrorAction Error=%MYERROR% >> log.txt

reg DELETE "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" /v DisableEmailScanning /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableEmailScanning Error=%MYERROR%
echo DisableEmailScanning Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v ErrorAction /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo ErrorAction Error=%MYERROR%
echo ErrorAction Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SpynetReporting /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo SpynetReporting Error=%MYERROR%
echo SpynetReporting Error=%MYERROR% >> log.txt

reg DELETE HKLM\SYSTEM\CurrentControlSet\Services\Sense /v Start /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo WinDefend Sense Error=%MYERROR%
echo WinDefend Sense Error=%MYERROR% >> log.txt

reg DELETE HKLM\SYSTEM\CurrentControlSet\Services\WdFilter /v Start /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo WinDefend WdFilter Error=%MYERROR%
echo WinDefend WdFilter Error=%MYERROR% >> log.txt

reg DELETE HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv /v Start /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo WinDefend WdNisDrv Error=%MYERROR%
echo WinDefend WdNisDrv Error=%MYERROR% >> log.txt

reg DELETE HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo WinDefend WdNisSvc Error=%MYERROR%
echo WinDefend WdNisSvc Error=%MYERROR% >> log.txt

reg DELETE HKCU\Software\Piriform\CCleaner /v Language /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaer Language Error=%MYERROR%
echo CCleaer Language Error=%MYERROR% >> log.txt

reg DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo NewStartPanel My Computer Error=%MYERROR%
echo NewStartPanel My Computer Error=%MYERROR% >> log.txt

reg DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo ClassicStartMenu My Computer Error=%MYERROR%
echo ClassicStartMenu My Computer Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}" /v "@" /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo Desktop Icon Recycle Bin Error=%MYERROR%
echo Desktop Icon Recycle Bin Error=%MYERROR% >> log.txt

reg DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{645FF040-5081-101B-9F08-00AA002F954E}" /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo NewStartPanel Recycle Bin Error=%MYERROR%
echo NewStartPanel Recycle Bin Error=%MYERROR% >> log.txt

reg DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v "{645FF040-5081-101B-9F08-00AA002F954E}" /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo ClassicStartMenu Recycle Bin Error=%MYERROR%
echo ClassicStartMenu Recycle Bin Error=%MYERROR% >> log.txt

reg DELETE HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v EnableSmartScreen /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo EnableSmartScreen=0 Error=%MYERROR%
echo EnableSmartScreen=0 Error=%MYERROR% >> log.txt

reg DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v SmartScreenEnabled /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo SmartScreenEnabled=0 Error=%MYERROR%
echo SmartScreenEnabled=0 Error=%MYERROR% >> log.txt

reg DELETE HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter /v EnabledV9 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo EnabledV9 Error=%MYERROR%
echo EnabledV9 Error=%MYERROR% >> log.txt

reg DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost /v EnableWebContentEvaluation  /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo EnableWebContentEvaluation Error=%MYERROR%
echo EnableWebContentEvaluation Error=%MYERROR% >> log.txt

reg DELETE HKCU\Software\Policies\Microsoft\Windows\Explorer /v DisableNotificationCenter  /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DisableNotificationCenter Error=%MYERROR%
echo DisableNotificationCenter Error=%MYERROR% >> log.txt

reg DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications /v ToastEnabled  /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo ToastEnabled Error=%MYERROR%
echo ToastEnabled Error=%MYERROR% >> log.txt

reg DELETE HKLM\SYSTEM\CurrentControlSet\Services\mpssvc /v Start /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo mpssvc Start 4 Error=%MYERROR%
echo mpssvc Start 4 Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo Windows Defender DisableNotifications Error=%MYERROR%
echo Windows Defender DisableNotifications Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Microsoft\Windows\Windows Search" /v AllowCortana /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo Disable Cortana Error=%MYERROR%
echo Disable Cortana Error=%MYERROR% >> log.txt

netsh advfirewall set allprofiles state on 2>nul
SET MYERROR=%ERRORLEVEL%
echo Disable Firewall Error=%MYERROR%
echo Disable Firewall Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /f 0>>log.txt 2>>log.txt
SET MYERROR=%ERRORLEVEL%
echo DisableAntiSpyware Error=%MYERROR%
echo DisableAntiSpyware Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /f 0>>log.txt 2>>log.txt
SET MYERROR=%ERRORLEVEL%
echo DisableIOAVProtection Error=%MYERROR%
echo DisableIOAVProtection Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /f 0>>log.txt 2>>log.txt
SET MYERROR=%ERRORLEVEL%
echo DisableRealtimeMonitoring Error=%MYERROR%
echo DisableRealtimeMonitoring Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /f 0>>log.txt 2>>log.txt
SET MYERROR=%ERRORLEVEL%
echo DisableBehaviorMonitoring Error=%MYERROR%
echo DisableBehaviorMonitoring Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /f 0>>log.txt 2>>log.txt
SET MYERROR=%ERRORLEVEL%
echo DisableOnAccessProtection Error=%MYERROR%
echo DisableOnAccessProtection Error=%MYERROR% >> log.txt

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /f 0>>log.txt 2>>log.txt
SET MYERROR=%ERRORLEVEL%
echo DisableScanOnRealtimeEnable Error=%MYERROR%
echo DisableScanOnRealtimeEnable Error=%MYERROR% >> log.txt

reg DELETE HKLM\SYSTEM\CurrentControlSet\Services\WinDefend /v Start /f 0>>log.txt 2>>log.txt
SET MYERROR=%ERRORLEVEL%
echo WinDefend Start Error=%MYERROR%
echo WinDefend Start Error=%MYERROR% >> log.txt

reg DELETE HKLM\SYSTEM\CurrentControlSet\Services\Sense /v Start /f 0>>log.txt 2>>log.txt
SET MYERROR=%ERRORLEVEL%
echo Sense Start Error=%MYERROR% >> log.txt

reg DELETE HKLM\SYSTEM\CurrentControlSet\Services\WdFilter /v Start /f 0>>log.txt 2>>log.txt
SET MYERROR=%ERRORLEVEL%
echo WdFilter Start Error=%MYERROR%
echo WdFilter Start Error=%MYERROR% >> log.txt

reg DELETE HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv /v Start /f 0>>log.txt 2>>log.txt
SET MYERROR=%ERRORLEVEL%
echo WdNisDrv Start Error=%MYERROR%
echo WdNisDrv Start Error=%MYERROR% >> log.txt

reg DELETE HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc /v Start /f 0>>log.txt 2>>log.txt
SET MYERROR=%ERRORLEVEL%
echo WdNisSvc Start Error=%MYERROR%
echo WdNisSvc Start Error=%MYERROR% >> log.txt

sc start WinDefend 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc start WinDefend Error=%MYERROR%
echo sc start WinDefend Error=%MYERROR% >> log.txt

sc config WinDefend start=auto 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config WinDefend start=auto Error=%MYERROR%
echo sc config WinDefend start=auto Error=%MYERROR% >> log.txt

gpupdate /force
echo gpupdate /force Error=%MYERROR%
echo gpupdate /force Error=%MYERROR% >> log.txt

chcp 866

pause
