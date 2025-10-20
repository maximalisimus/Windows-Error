@cd/d "%~dp0"
chcp 65001
@echo off

:: Включить и запустить службу Windows Defender
sc config WinDefend start=auto 2>nul
sc start WinDefend 2>nul

:: Включить службы Sense, WdFilter, WdNisDrv, WdNisSvc (компоненты защиты)
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\Sense /v Start /t REG_DWORD /d 2 /f 2>nul
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdFilter /v Start /t REG_DWORD /d 2 /f 2>nul
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv /v Start /t REG_DWORD /d 2 /f 2>nul
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc /v Start /t REG_DWORD /d 2 /f 2>nul

:: Включить Защиту Windows Defender (отменить политики отключения)
reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /f 2>nul
reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v AlowFastServiceStartup /f 2>nul
reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v ServiceKeepAlive /f 2>nul

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /f 2>nul
reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /f 2>nul
reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /f 2>nul
reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /f 2>nul
reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /f 2>nul

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v LocalSettingsOverrideSpynetReporting /f 2>nul
reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v DisableBlockAtFirstSeen /f 2>nul
reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v LocalSettingOverrideSpynetReporting /f 2>nul
reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent /f 2>nul

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" /v ErrorAction /f 2>nul
reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" /v DisableEmailScanning /f 2>nul

reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v ErrorAction /f 2>nul
reg DELETE "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SpynetReporting /f 2>nul

:: Включить SmartScreen
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v EnableSmartScreen /t REG_DWORD /d 1 /f 2>nul
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v SmartScreenEnabled /t reg_sz /d "RequireAdmin" /f 2>nul

:: Включить PhishingFilter и WebContentEvaluation
reg ADD HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter /v EnabledV9 /t REG_DWORD /d 1 /f 2>nul
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost /v EnableWebContentEvaluation /t REG_DWORD /d 1 /f 2>nul

:: Включить уведомления Центра уведомлений
reg DELETE HKCU\Software\Policies\Microsoft\Windows\Explorer /v DisableNotificationCenter /f 2>nul
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications /v ToastEnabled /t REG_DWORD /d 1 /f 2>nul

:: Включить Firewall
netsh advfirewall set allprofiles state on 2>nul

:: Включить Cortana
reg ADD "HKLM\SOFTWARE\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 1 /f 2>nul

:: Включить UAC (EnableLUA = 1)
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f 2>nul

:: Включить seclogon (служба "Вход в систему")
sc config seclogon start=auto 2>nul
sc start seclogon 2>nul

:: Включить EnableSecureUIAPaths = 1
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableSecureUIAPaths /t REG_DWORD /d 1 /f 2>nul

:: Включить EnableUIADesktopToggle = 0 (оставляем как в вашем скрипте)
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableUIADesktopToggle /t REG_DWORD /d 0 /f 2>nul

:: Восстановить ConsentPromptBehaviorAdmin = 5 (максимальный уровень запроса UAC)
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 5 /f 2>nul

:: Восстановить PromptOnSecureDesktop = 1 (включить безопасный рабочий стол для UAC)
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v PromptOnSecureDesktop /t REG_DWORD /d 1 /f 2>nul

:: Включить RpcAuthnLevelPrivacyEnabled = 1 (для печати)
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\Print /v RpcAuthnLevelPrivacyEnabled /t REG_DWORD /d 1 /f 2>nul

:: Включить RestrictDriverInstallationToAdministrators = 1
reg ADD "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v RestrictDriverInstallationToAdministrators /t REG_DWORD /d 1 /f 2>nul

:: Включить DCOM
reg ADD HKLM\SOFTWARE\MICROSOFT\OLE /v EnableDCOM /t reg_sz /d y /f 2>nul

:: Включить AllowInsecureGuestAuth = 0 (отключить небезопасный гостевой доступ)
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters /v AllowInsecureGuestAuth /t reg_dword /d 0 /f 2>nul

:: Включить Default Impersonation Level = 3
reg ADD HKLM\Software\Microsoft\Wbem\Scripting /v "Default Impersonation Level" /t REG_DWORD /d 3 /f 2>nul

:: Включить иконки рабочего стола "Мой компьютер" и "Корзина"
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f 2>nul
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f 2>nul

reg ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}" /v "@" /t reg_sz /d "Recycle Bin" /f 2>nul
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{645FF040-5081-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f 2>nul
reg ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v "{645FF040-5081-9F08-00AA002F954E}" /t REG_DWORD /d 0 /f 2>nul

:: Восстановить политику выполнения PowerShell (RemoteSigned)
powershell -Command "& {Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force}" 2>nul

:: Включить параметры защиты от экплоитов
powershell -Command "& {Set-ProcessMitigation -PolicyFilePath Settings-enable.xml}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell -Command "& {Get-ProcessMitigation -RegistryConfigFilePath Settings-enable.xml}" 2^>^nul >> log.txt
echo improt Settings.xml Error=%MYERROR%
echo improt Settings.xml Error=%MYERROR% >> log.txt

:: Обновить политики
gpupdate /force

chcp 866

pause
