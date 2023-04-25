@cd/d "%~dp0"
@echo off
wmic baseboard get Manufacturer > info.txt
wmic baseboard get product >> info.txt
wmic baseboard get Manufacturer
wmic baseboard get product
start info.txt
pause
