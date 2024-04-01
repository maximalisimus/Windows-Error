@cd/d "%~dp0"
chcp 65001
@echo off

mkdir %Systemroot%\Windows-Update-Backup
SET backup=%Systemroot%\Windows-Update-Backup\Windows-Update-Reg-Backup.txt

reg QUERY HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate  >> %backup%
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo disable WindowsUpdate NoAutoUpdate Error=%MYERROR%
echo disable WindowsUpdate NoAutoUpdate Error=%MYERROR% >> log.txt

reg QUERY HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions  >> %backup%
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /t REG_DWORD /d 2 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo AUOptions Error=%MYERROR%
echo AUOptions Error=%MYERROR% >> log.txt

reg QUERY HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v DoNotConnectToWindowsUpdateInternetLocations  >> %backup%
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v DoNotConnectToWindowsUpdateInternetLocations  /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo DoNotConnectToWindowsUpdateInternetLocations Error=%MYERROR%
echo DoNotConnectToWindowsUpdateInternetLocations Error=%MYERROR% >> log.txt

reg QUERY HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v UpdateServiceUrlAlternate >> %backup%
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v UpdateServiceUrlAlternate /t reg_sz /d "server.wsus" /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo UpdateServiceUrlAlternate server.wsus Error=%MYERROR%
echo UpdateServiceUrlAlternate server.wsus Error=%MYERROR% >> log.txt

reg QUERY HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v WUServer >> %backup%
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v WUServer /t reg_sz /d "server.wsus" /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo WUServer server.wsus Error=%MYERROR%
echo WUServer server.wsus Error=%MYERROR% >> log.txt

reg QUERY HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v WUStatusServer >> %backup%
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v WUStatusServer /t reg_sz /d "server.wsus" /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo WUStatusServer server.wsus Error=%MYERROR%
echo WUStatusServer server.wsus Error=%MYERROR% >> log.txt

reg QUERY HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v UseWUServer >> %backup%
reg ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v UseWUServer  /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo UseWUServer Error=%MYERROR%
echo UseWUServer Error=%MYERROR% >> log.txt

reg QUERY HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc /v Start >> %backup%
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc /v Start /t REG_DWORD /d 4 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo disable UsoSvc 4 Error=%MYERROR%
echo disable UsoSvc 4 Error=%MYERROR% >> log.txt

echo The regedit parameters query is backup to files %backup% >> log.txt
echo The regedit parameters query is backup to files %backup% >> %backup%
echo The regedit parameters query is backup to files %backup%

chcp 866
