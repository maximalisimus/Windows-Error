@cd/d "%~dp0"
@echo off
SET MYDIR=%CD%
SET PATH=%MYDIR%\;%PATH%
certutil -addstore "Root" "sberbank.ru_Russian_Trusted_Sub_CA.crt"
certutil -addstore "CA" "sberbank.ru_Russian_Trusted_Sub_CA.crt"
certutil -addstore "My" "sberbank.ru.crt"
pause
