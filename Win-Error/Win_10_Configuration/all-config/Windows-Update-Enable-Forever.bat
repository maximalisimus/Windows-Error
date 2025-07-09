@cd/d "%~dp0"
chcp 65001
@echo off

mkdir %Systemroot%\Windows-Update-Backup
SET backup=%Systemroot%\Windows-Update-Backup\Windows-Update-Reg-Backup.txt

:: Резервное копирование текущих значений
reg QUERY HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate  >> %backup%
reg QUERY HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions  >> %backup%
reg QUERY HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v DoNotConnectToWindowsUpdateInternetLocations  >> %backup%
reg QUERY HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v UpdateServiceUrlAlternate >> %backup%
reg QUERY HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v WUServer >> %backup%
reg QUERY HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v WUStatusServer >> %backup%
reg QUERY HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v UseWUServer >> %backup%
reg QUERY HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc /v Start >> %backup%

:: Удаляем или сбрасываем параметры, блокирующие обновления
reg DELETE HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo delete NoAutoUpdate Error=%MYERROR%
echo delete NoAutoUpdate Error=%MYERROR% >> log.txt

reg DELETE HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo delete AUOptions Error=%MYERROR%
echo delete AUOptions Error=%MYERROR% >> log.txt

reg DELETE HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v DoNotConnectToWindowsUpdateInternetLocations /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo delete DoNotConnectToWindowsUpdateInternetLocations Error=%MYERROR%
echo delete DoNotConnectToWindowsUpdateInternetLocations Error=%MYERROR% >> log.txt

reg DELETE HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v UpdateServiceUrlAlternate /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo delete UpdateServiceUrlAlternate Error=%MYERROR%
echo delete UpdateServiceUrlAlternate Error=%MYERROR% >> log.txt

reg DELETE HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v WUServer /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo delete WUServer Error=%MYERROR%
echo delete WUServer Error=%MYERROR% >> log.txt

reg DELETE HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v WUStatusServer /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo delete WUStatusServer Error=%MYERROR%
echo delete WUStatusServer Error=%MYERROR% >> log.txt

reg DELETE HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v UseWUServer /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo delete UseWUServer Error=%MYERROR%
echo delete UseWUServer Error=%MYERROR% >> log.txt

:: Восстанавливаем запуск службы UsoSvc (3 = manual, 2 = automatic)
reg ADD HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc /v Start /t REG_DWORD /d 3 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo restore UsoSvc Start=3 Error=%MYERROR%
echo restore UsoSvc Start=3 Error=%MYERROR% >> log.txt

echo The regedit parameters query is backup to files %backup% >> log.txt
echo The regedit parameters query is backup to files %backup% >> %backup%
echo The regedit parameters query is backup to files %backup%

chcp 866
