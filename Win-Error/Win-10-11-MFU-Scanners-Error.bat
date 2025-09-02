@cd/d "%~dp0"
chcp 65001
@echo off

:: Set Policy
powershell -Command Set-ExecutionPolicy RemoteSigned

:: Модуль запуска процессов DCOM-сервера
sc config DcomLaunch start=auto 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config DcomLaunch start=auto Error=%MYERROR%
echo sc config DcomLaunch start=auto Error=%MYERROR% >> log.txt
sc start DcomLaunch 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc start DcomLaunch Error=%MYERROR%
echo sc start DcomLaunch Error=%MYERROR% >> log.txt

:: Удаленный вызов процедур (RPC)
sc config RpcSs start=auto 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config RpcSs start=auto Error=%MYERROR%
echo sc config RpcSs start=auto Error=%MYERROR% >> log.txt
sc start RpcSs 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc start RpcSs Error=%MYERROR%
echo sc start RpcSs Error=%MYERROR% >> log.txt

:: Сопоставитель конечных точек RPC
sc config RpcEptMapper start=auto 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config RpcEptMapper start=auto Error=%MYERROR%
echo sc config RpcEptMapper start=auto Error=%MYERROR% >> log.txt
sc start RpcEptMapper 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc start RpcEptMapper Error=%MYERROR%
echo sc start RpcEptMapper Error=%MYERROR% >> log.txt

:: Определение оборудования оболочки
sc config ShellHWDetection start=auto 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config ShellHWDetection start=auto Error=%MYERROR%
echo sc config ShellHWDetection start=auto Error=%MYERROR% >> log.txt
sc start ShellHWDetection 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc start ShellHWDetection Error=%MYERROR%
echo sc start ShellHWDetection Error=%MYERROR% >> log.txt

:: Служба загрузки изображений Windows (WIA)
sc config stisvc start=auto 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc config stisvc start=auto Error=%MYERROR%
echo sc config stisvc start=auto Error=%MYERROR% >> log.txt
sc start stisvc 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc start stisvc Error=%MYERROR%
echo sc start stisvc Error=%MYERROR% >> log.txt

gpupdate /force
echo gpupdate /force Error=%MYERROR%
echo gpupdate /force Error=%MYERROR% >> log.txt

chcp 866

pause
