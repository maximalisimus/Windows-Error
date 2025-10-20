@cd/d "%~dp0"
chcp 65001
@echo off

powershell -Command "& {Get-AppxPackage *OneNote* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove OneNote AppxPackage Error=%MYERROR%
echo Remove OneNote AppxPackage Error=%MYERROR% >> log.txt

chcp 866
