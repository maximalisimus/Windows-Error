@cd/d "%~dp0"
@echo off
del /F /Q "%appdata%\Microsoft\Windows\Recent\*"
del /F /Q "%appdata%\microsoft\windows\recent\automaticdestinations\*"
del /F /Q "%appdata%\Macromedia\Flash Player\#SharedObjects\*.*"
pause
