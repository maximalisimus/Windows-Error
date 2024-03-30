@cd/d "%~dp0"
chcp 65001
@echo off

dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >find-gpedit.txt
dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>find-gpedit.txt
SET MYERROR=%ERRORLEVEL%
echo Search gpedit.msc AppxPackage Error=%MYERROR%
echo Search gpedit.msc AppxPackage Error=%MYERROR% >> log.txt
(
	for /f %%i in ('findstr /i . find-gpedit.txt 2^>nul') do dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"
) 2>nul
SET MYERROR=%ERRORLEVEL%
echo Setup gpedit.msc AppxPackage Error=%MYERROR%
echo Setup gpedit.msc AppxPackage Error=%MYERROR% >> log.txt

chcp 866
