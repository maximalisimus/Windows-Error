@cd/d "%~dp0"
@echo off
SET MYDIR=%CD%
SET PATH=%MYDIR%\;%PATH%
updroots.exe %MYDIR%\roots.sst
pause
