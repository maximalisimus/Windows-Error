@cd/d "%~dp0"
chcp 65001
@echo off

sc config UsoSvc start=disabled 2>nul
SET MYERROR=%ERRORLEVEL%
echo disable UsoSvc Error=%MYERROR%
echo disable UsoSvc Error=%MYERROR% >> log.txt

sc stop UsoSvc 2>nul
SET MYERROR=%ERRORLEVEL%
echo stop UsoSvc Error=%MYERROR%
echo stop UsoSvc Error=%MYERROR% >> log.txt

sc config wuauserv start=disabled 2>nul
SET MYERROR=%ERRORLEVEL%
echo disable wuauserv Error=%MYERROR%
echo disable wuauserv Error=%MYERROR% >> log.txt

sc stop wuauserv 2>nul
SET MYERROR=%ERRORLEVEL%
echo stop wuauserv Error=%MYERROR%
echo stop wuauserv Error=%MYERROR% >> log.txt

chcp 866
