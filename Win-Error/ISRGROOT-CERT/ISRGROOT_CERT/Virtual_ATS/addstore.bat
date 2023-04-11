@cd/d "%~dp0"
@echo off
SET MYDIR=%CD%
SET PATH=%MYDIR%\;%PATH%
certutil -addstore "Root" "russian_trusted_root_ca.cer"
certutil -addstore "CA" "russian_trusted_sub_ca.cer"
pause
