@cd/d "%~dp0"
chcp 65001
@echo off

reg ADD HKLM\SOFTWARE\Crypto Pro\Cryptography\CurrentVersion\Parameters /v ControlKeyTimeValidity /t REG_DWORD /d 0 /f 0>>log.txt 2>>log.txt
echo reg ADD HKLM\SOFTWARE\Crypto Pro\Cryptography\CurrentVersion\Parameters /v ControlKeyTimeValidity /t REG_DWORD /d 0 /f  Error=%MYERROR% >> log.txt
echo ConsentPromptBehaviorAdmin Error=%MYERROR%
echo ConsentPromptBehaviorAdmin Error=%MYERROR% >> log.txt

chcp 866

pause
