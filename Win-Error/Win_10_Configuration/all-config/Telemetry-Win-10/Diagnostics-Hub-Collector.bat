@cd/d "%~dp0"
chcp 65001
@echo off

REM *** stop Microsoft (R) Diagnostics Hub Standard Collector ***
sc config diagnosticshub.standardcollector.service start= disabled 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config diagnosticshub.standardcollector.service start= disabled Error=%MYERROR%
echo sc config diagnosticshub.standardcollector.service start= disabled Error=%MYERROR% >> log.txt

chcp 866

pause
