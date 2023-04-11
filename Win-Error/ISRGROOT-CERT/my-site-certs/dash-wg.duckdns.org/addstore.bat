@cd/d "%~dp0"
@echo off
SET MYDIR=%CD%
SET PATH=%MYDIR%\;%PATH%
certutil -addstore "CA" "dash-wg.duckdns.org_R3.crt"
certutil -addstore "CA" "dash-wg.duckdns.org_ISRG_Root_X1.crt"
certutil -addstore "Root" "dash-wg.duckdns.org_R3.crt"
certutil -addstore "Root" "dash-wg.duckdns.org_ISRG_Root_X1.crt"
certutil -addstore "My" "dash-wg.duckdns.org.crt"
pause
