@cd/d "%~dp0"
@echo off
SET MYDIR=%CD%
SET PATH=%MYDIR%\;%PATH%
certutil -addstore "Root" "rootca_ssl_rsa2022.crt"
pause
