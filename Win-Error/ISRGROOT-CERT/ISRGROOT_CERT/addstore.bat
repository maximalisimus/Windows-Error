@cd/d "%~dp0"
@echo off
SET MYDIR=%CD%
SET PATH=%MYDIR%\;%PATH%
certutil -addstore "Root" "_.ryazanszn.ru_Russian_Trusted_Root_CA.crt"
certutil -addstore "CA" "_.ryazanszn.ru_Russian_Trusted_Sub_CA.crt"
certutil -addstore "My" "_.ryazanszn.ru.crt"
certutil -addstore "Root" "GlobalSign_Root.crt"
certutil -addstore "Root" "GoDaddy_Root.crt"
certutil -addstore "Root" "933c6ddee9.crt"
certutil -addstore "Root" "cabd2a79a1.crt"
certutil -addstore "Root" "isrgrootx1.der"
certutil -addstore "Root" "ISRG-Root-X1-1.cer"
certutil -addstore "Root" "ISRG-Root-X1-2.cer"
certutil -addstore "Root" "isrg-root-x2.der"
certutil -addstore "Root" "ISRG-Root-X2-1.cer"
certutil -addstore "Root" "ISRG-Root-X2-2.cer"
certutil -addstore "Root" "ISRG-Root-X3.cer"
pause
