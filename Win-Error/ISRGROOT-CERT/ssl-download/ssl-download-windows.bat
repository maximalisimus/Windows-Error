@cd/d "%~dp0"
@echo off
SET PATH=%CD%\ssl-scripts\busybox_x86\;%PATH%
SET PATH=%CD%\ssl-scripts\OpenSSL-3.0.5_win32\bin\;%PATH%
SET PATH=%CD%\ssl-scripts\Portable-Python-3.8.9-x86\;%PATH%
SET PATH=%CD%\ssl-scripts\Portable-Python-3.8.9-x86\Scripts\;%PATH%
SET PATH=%CD%\ssl-scripts\;%PATH%
bash -c "sh ssl-scripts/download.sh"
