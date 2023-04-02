@cd/d "%~dp0"
@echo off
SET MYDIR=%CD%
SET PATH=%MYDIR%\;%PATH%
certutil.exe -generateSSTFromWU %MYDIR%\roots.sst
pause
