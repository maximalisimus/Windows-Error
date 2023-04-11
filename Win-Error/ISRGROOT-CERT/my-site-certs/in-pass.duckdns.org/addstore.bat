@cd/d "%~dp0"
@echo off
SET MYDIR=%CD%
SET PATH=%MYDIR%\;%PATH%
certutil -addstore "CA" "in-pass.duckdns.org_ISRG_Root_X1.crt"
certutil -addstore "CA" "in-pass.duckdns.org_R3.crt"
certutil -addstore "Root" "in-pass.duckdns.org_ISRG_Root_X1.crt"
certutil -addstore "Root" "in-pass.duckdns.org_R3.crt"
certutil -addstore "My" "in-pass.duckdns.org.crt"
pause
