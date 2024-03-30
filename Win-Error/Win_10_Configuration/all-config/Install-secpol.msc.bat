@cd/d "%~dp0"
chcp 65001
@echo off

(
	FOR %F IN ("%SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~*.mum") DO ( DISM /Online /NoRestart /Add-Package:"%F" ) 
) 2>nul
SET MYERROR=%ERRORLEVEL%
echo Setup secpol.msc AppxPackage Error=%MYERROR%
echo Setup secpol.msc AppxPackage Error=%MYERROR% >> log.txt

chcp 866
