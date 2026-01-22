@cd/d "%~dp0"
chcp 65001
@echo off
SET PATH=%CD%\;%PATH%
powershell -Command Set-ExecutionPolicy RemoteSigned

reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v LmCompatibilityLevel /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v LmCompatibilityLevel /t REG_DWORD /d 1 /f 2>nul
echo reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v LmCompatibilityLevel /t REG_DWORD /d 1 /f 2>nul >> log.txt
echo LmCompatibilityLevel = 1 Error=%MYERROR%
echo LmCompatibilityLevel = 1 Error=%MYERROR% >> log.txt

echo PLEASE ENABLE "SMB 1.0/CIFS File Sharing Support" –> "SMB 1.0/CIFS Client"
echo PLEASE ENABLE "SMB 1.0/CIFS File Sharing Support" –> "SMB 1.0/CIFS Client" >> log.txt
echo optionalfeatures.exe >> log.txt
optionalfeatures.exe

powershell -Command Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol-Client 2>nul
SET MYERROR=%ERRORLEVEL%
echo powershell -Command Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol-Client Error=%MYERROR%
echo powershell -Command Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol-Client Error=%MYERROR% >> log.txt

reg add HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters /v AllowInsecureGuestAuth /t reg_dword /d 00000001 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo reg add HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters /v AllowInsecureGuestAuth /t reg_dword /d 00000001 /f 2>nul
echo reg add HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters /v AllowInsecureGuestAuth /t reg_dword /d 00000001 /f 2>nul >> log.txt
echo AllowInsecureGuestAuth = 00000001 Error=%MYERROR%
echo AllowInsecureGuestAuth = 00000001 Error=%MYERROR% >> log.txt

reg add HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\ /f /v RequireSecuritySignature /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo reg add HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\ /f /v RequireSecuritySignature /t REG_DWORD /d 0 /f 2>nul
echo reg add HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\ /f /v RequireSecuritySignature /t REG_DWORD /d 0 /f 2>nul >> log.txt
echo RequireSecuritySignature = 0 Error=%MYERROR%
echo RequireSecuritySignature = 0 Error=%MYERROR% >> log.txt

reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation /f /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation /f /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f 2>nul
echo reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation /f /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f 2>nul >> log.txt
echo AllowInsecureGuestAuth = 1 Error=%MYERROR%
echo AllowInsecureGuestAuth = 1 Error=%MYERROR% >> log.txt

sc.exe config lanmanworkstation depend= bowser/mrxsmb10/mrxsmb20/nsi 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc.exe config lanmanworkstation depend= bowser/mrxsmb10/mrxsmb20/nsi Error=%MYERROR%
echo sc.exe config lanmanworkstation depend= bowser/mrxsmb10/mrxsmb20/nsi Error=%MYERROR% >> log.txt

gpupdate /force

chcp 866

pause
