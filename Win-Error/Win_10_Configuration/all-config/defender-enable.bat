@cd/d "%~dp0"
chcp 65001
@echo off

@echo off
:: ������������� ��� ������� ������ WinDefend � ��������������
sc config WinDefend start=auto
sc start WinDefend

:: � ������� ��������� �������� DisableAntiSpyware (������ 0)
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 0 /f

:: �������� ������ � �������� ������� (������ 0 ��� ���������� ����������)
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /t REG_DWORD /d 0 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 0 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 0 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 0 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 0 /f

:: ������������� ������ WinDefend � ��������� ����������� �� �������������� ������ (Start=2)
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WinDefend /v Start /t REG_DWORD /d 2 /f
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\Sense /v Start /t REG_DWORD /d 2 /f
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdFilter /v Start /t REG_DWORD /d 2 /f
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv /v Start /t REG_DWORD /d 2 /f
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc /v Start /t REG_DWORD /d 2 /f

:: ��������� ��������� ��������
gpupdate /force

pause


chcp 866

pause
