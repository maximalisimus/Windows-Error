@cd/d "%~dp0"
chcp 65001
@echo off

sc config UsoSvc start=auto
SET MYERROR=%ERRORLEVEL%
echo enable UsoSvc Error=%MYERROR%
echo enable UsoSvc Error=%MYERROR% >> log.txt

sc start UsoSvc
SET MYERROR=%ERRORLEVEL%
echo start UsoSvc Error=%MYERROR%
echo start UsoSvc Error=%MYERROR% >> log.txt

sc config wuauserv start=auto
SET MYERROR=%ERRORLEVEL%
echo enable wuauserv Error=%MYERROR%
echo enable wuauserv Error=%MYERROR% >> log.txt

sc start wuauserv
SET MYERROR=%ERRORLEVEL%
echo start wuauserv Error=%MYERROR%
echo start wuauserv Error=%MYERROR% >> log.txt

chcp 866
