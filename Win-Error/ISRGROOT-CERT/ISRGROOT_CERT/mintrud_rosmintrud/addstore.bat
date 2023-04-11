@cd/d "%~dp0"
@echo off
SET MYDIR=%CD%
SET PATH=%MYDIR%\;%PATH%
certutil -addstore "Root" "_.mintrud.gov.ru_R3.crt"
certutil -addstore "Root" "_.rosmintrud.ru_R3.crt"
certutil -addstore "CA" "_.mintrud.gov.ru_R3.crt"
certutil -addstore "CA" "_.rosmintrud.ru_R3.crt"
certutil -addstore "My" "_.mintrud.gov.ru.crt"
certutil -addstore "My" "_.rosmintrud.ru.crt"
certutil -addstore "Root" "_.mintrud.gov.ru.crt"
certutil -addstore "Root" "_.rosmintrud.ru.crt"
certutil -addstore "CA" "_.mintrud.gov.ru.crt"
certutil -addstore "CA" "_.rosmintrud.ru.crt"
pause
