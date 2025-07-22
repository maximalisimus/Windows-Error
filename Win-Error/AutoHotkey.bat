@cd/d "%~dp0"
@echo off
Run, %cd%\google-chrome\chrome.exe –incognito
WinWait, – Google Chrome
WinWaitClose
::Run, %cd%\ccleaner\ccleaner.exe /AUTO
::Run, cmd /c "ipconfig /flushdns"
MsgBox, Browsing Session is Cleaned.
pause
