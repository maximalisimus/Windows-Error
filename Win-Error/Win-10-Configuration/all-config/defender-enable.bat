@cd/d "%~dp0"
chcp 65001
@echo off

@echo off
:: Устанавливаем тип запуска службы WinDefend в автоматический
sc config WinDefend start=auto
sc start WinDefend

:: В реестре отключаем параметр DisableAntiSpyware (ставим 0)
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 0 /f

:: Включаем защиту в реальном времени (ставим 0 для отключения отключений)
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /t REG_DWORD /d 0 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 0 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 0 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 0 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 0 /f

:: Устанавливаем службы WinDefend и связанных компонентов на автоматический запуск (Start=2)
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WinDefend /v Start /t REG_DWORD /d 2 /f
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\Sense /v Start /t REG_DWORD /d 2 /f
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdFilter /v Start /t REG_DWORD /d 2 /f
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv /v Start /t REG_DWORD /d 2 /f
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc /v Start /t REG_DWORD /d 2 /f

:: Обновляем групповые политики
gpupdate /force

pause


chcp 866

pause
