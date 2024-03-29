@cd/d "%~dp0"
Goto :Label1
Пост команды полной настройки Win 10 и 11.
Отключение Win Defender, Cortana, UA, LUA, Локальные политики безопасности, NetBIOS, общие папки и многое много другое.
Данный командлет необходимо запускать от имени Администратора. 
После даного командлета можете спокойно устанавливать CCLeaner. Он у вас точно запустится в России.
Осторожно в конце командлета долгая установка 2 оснасток системы - secpol.msc - локальные политики безопасности, и gpedit.msc - редактор групповых политик безопасности.
Если у вас что-нибудь не установилось - перезагрузите ПК и повторите запуск командлета от имени администратора.
:label1
@echo off

reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableSecureUIAPaths /t REG_DWORD /d 1 /f
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableUIADesktopToggle /t REG_DWORD /d 0 /f

REM reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 5 /f

reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f

reg ADD HKLM\SOFTWARE\Policies\Microsoft\WindowsStore /v RemoveWindowsStore /t REG_DWORD /d 1 /f
reg ADD HKCU\Software\Policies\Microsoft\WindowsStore /v RemoveWindowsStore /t REG_DWORD /d 1 /f

reg ADD HKLM\SYSTEM\CurrentControlSet\Control\Print /v RpcAuthnLevelPrivacyEnabled /t REG_DWORD /d 0 /f

reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v RestrictDriverInstallationToAdministrators /t REG_DWORD /d 0 /f

reg add HKLM\SOFTWARE\MICROSOFT\OLE /v EnableDCOM /t reg_sz /d y /f

reg add HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters /v AllowInsecureGuestAuth /t reg_dword /d 00000001 /f


reg add HKLM\Software\Microsoft\Wbem\Scripting /v "Default Impersonation Level" /t REG_DWORD /d 3 /f

setlocal
for /f "tokens=*" %%k in ('reg query HKLM\SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces') do (
	reg add %%k /v NetbiosOptions /t REG_DWORD /d 1 /f
)
endlocal

reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v AlowFastServiceStartup /t REG_DWORD /d 0 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v ServiceKeepAlive /t REG_DWORD /d 0 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /t REG_DWORD /d 1 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 1 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /t REG_DWORD /d 1 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v LocalSettingsOverrideSpynetReporting /t REG_DWORD /d 0 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WinDefend /v Start /t REG_DWORD /d 4 /f

reg ADD HKCU\Software\Piriform\CCleaner /v Language /t reg_sz /d 1049 /f
reg ADD HKCU\Software\Piriform\CCleaner /v UpdateBackground /t REG_DWORD /d 0 /f
reg ADD HKCU\Software\Piriform\CCleaner /v UpdateCheck /t REG_DWORD /d 0 /f
reg ADD HKCU\Software\Piriform\CCleaner /v HelpImproveCCleaner /t REG_DWORD /d 0 /f
reg ADD HKCU\Software\Piriform\CCleaner /v PrefsPrivacyShowOffers1stParty /t REG_DWORD /d 0 /f
reg ADD HKCU\Software\Piriform\CCleaner /v PrefsPrivacyShowOffers3rdParty /t REG_DWORD /d 0 /f
reg ADD HKCU\SOFTWARE\Piriform\CCleaner /v "(Cfg)PC" /t reg_sz /d 0 /f
reg ADD HKCU\SOFTWARE\Piriform\CCleaner /v "(Cfg)PE" /t reg_sz /d 0 /f

echo 0.0.0.0 alpha-crap.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 0.0.0.0 analytics.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 0.0.0.0 ip-info.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 0.0.0.0 ipm-provider.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 0.0.0.0 license-api.ccleaner.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 0.0.0.0 license.piriform.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 0.0.0.0 ncc.avast.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 0.0.0.0 ncc.avast.com.edgesuite.net >> %SystemRoot%\System32\drivers\etc\hosts
echo 0.0.0.0 shepherd.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 0.0.0.0 www.ccleaner.com >> %SystemRoot%\System32\drivers\etc\hosts

reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f
reg ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}" /v "@" /t reg_sz /d "Recycle Bin" /f
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f

reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v EnableSmartScreen /t REG_DWORD /d 0 /f
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v SmartScreenEnabled /t reg_sz /d "Off" /f
reg ADD HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter /v EnabledV9 /t REG_DWORD /d 0 /f

netsh advfirewall set allprofiles state off
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\mpssvc /v Start /t REG_DWORD /d 4 /f
reg ADD "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 1 /f

powershell -Command Get-AppxPackage *Store | Remove-AppxPackage
powershell -Command Get-AppxPackage *Store | Remove-AppxPackage -allusers

powershell -Command Get-AppXPackage *WindowsStore* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

REM Cortana off
powershell -Command  Get-appxpackage -allusers *Microsoft.549981C3F5F10* | Remove-AppxPackage
REM or
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f

sc config wuauserv start= disabled
sc stop wuauserv
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /t REG_DWORD /d 1 /f
REM takeown /f c:\windows\system32\usoclient.exe /a
REM icacls c:\windows\system32\usoclient.exe" /reset

sc config UsoSvc start= disabled
sc stop UsoSvc
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc /v Start /t REG_DWORD /d 4 /f

gpupdate /force

wusa /uninstall /kb:5005565

sc config lmhosts start= auto?
sc config LanmanServer start= auto?
sc config fdPHost start= auto?
sc config FDResPub start= auto?
sc config SSDPSRV start= auto?
sc config upnphost start= auto?

sc start lmhosts
sc start LanmanServer
sc start fdPHost
sc start FDResPub
sc start SSDPSRV
sc start upnphost

powershell -Command Set-ExecutionPolicy RemoteSigned
certutil -addstore "CA" "all-ca-cert.p7b"
powershell -Command Import-Certificate -FilePath "all-ca-cert.p7b" -CertStoreLocation Cert:\LocalMachine\CA
certutil -addstore "Root" "all-root-cert.p7b"
powershell -Command Import-Certificate -FilePath "all-root-cert.p7b" -CertStoreLocation Cert:\LocalMachine\Root

powershell -Command Get-ProcessMitigation -RegistryConfigFilePath Settings.xml
powershell -Command Set-ProcessMitigation -PolicyFilePath Settings.xml

FOR %F IN (“%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~*.mum”) DO ( DISM /Online /NoRestart /Add-Package:”%F” )

dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >find-gpedit.txt
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>find-gpedit.txt
echo Ustanovka gpedit.msc
for /f %%i in ('findstr /i . find-gpedit.txt 2^>nul') do dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"
echo Gpedit is Setuped.

pause
