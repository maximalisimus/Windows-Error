@cd/d "%~dp0"
@echo off
SET MYDIR=%CD%
SET PATH=%MYDIR%\;%PATH%
certutil -addstore "Root" "_.ryazanszn.ru_Russian_Trusted_Root_CA.crt"
certutil -addstore "CA" "_.ryazanszn.ru_Russian_Trusted_Sub_CA.crt"
certutil -addstore "My" "_.ryazanszn.ru.crt"
pause
