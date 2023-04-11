@cd/d "%~dp0"
@echo off
SET MYDIR=%CD%
SET PATH=%MYDIR%\;%PATH%
certutil -addstore "Root" "GlobalSign-Root-CA-R1.crt"
certutil -addstore "Root" "GlobalSign-Root-CA-R3.crt"
certutil -addstore "CA" "AlphaSSL-CA-SHA256-G2.crt"
certutil -addstore "CA" "AlphaSSL-CA-SHA256-G2-R3.crt"
certutil -addstore "CA" "AlphaSSL-CA-SHA256-G4.crt"
certutil -addstore "My" "_.tconf.rt.ru.crt"
pause
