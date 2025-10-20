@cd/d "%~dp0"
chcp 65001
@echo off

powershell -Command  "& {Get-appxpackage -allusers *Microsoft.549981C3F5F10* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove Cortana AppxPackage Error=%MYERROR%
echo Remove Cortana AppxPackage Error=%MYERROR% >> log.txt

chcp 866
