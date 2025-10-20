@cd/d "%~dp0"
chcp 65001
@echo off

wusa /uninstall /kb:5005565 2>nul
SET MYERROR=%ERRORLEVEL%
echo wusa /uninstall /kb:5005565 Error=%MYERROR%
echo wusa /uninstall /kb:5005565 Error=%MYERROR% >> log.txt

chcp 866
