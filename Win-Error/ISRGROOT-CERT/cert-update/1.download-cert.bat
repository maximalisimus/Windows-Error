@cd/d "%~dp0"
@echo off
SET MYDIR=%CD%
SET PATH=%MYDIR%\;%PATH%
rootsupd.exe /c /t:%MYDIR%\
pause

