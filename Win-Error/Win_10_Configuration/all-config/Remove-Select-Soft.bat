@cd/d "%~dp0"
chcp 65001
@echo off

REM 3D Builder
powershell -Command "& {Get-AppxPackage *3dbuilder* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove 3dbuilder AppxPackage Error=%MYERROR%
echo Remove 3dbuilder AppxPackage Error=%MYERROR% >> log.txt

REM Clock and alarm
powershell -Command "& {Get-AppxPackage *windowsalarms* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove windowsalarms AppxPackage Error=%MYERROR%
echo Remove windowsalarms AppxPackage Error=%MYERROR% >> log.txt

REM Calendar and mail
powershell -Command "& {Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove windowscommunicationsapps AppxPackage Error=%MYERROR%
echo Remove windowscommunicationsapps AppxPackage Error=%MYERROR% >> log.txt

REM Office
powershell -Command "& {Get-AppxPackage *officehub* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove officehub AppxPackage Error=%MYERROR%
echo Remove officehub AppxPackage Error=%MYERROR% >> log.txt

REM Skype
powershell -Command "& {Get-AppxPackage *skypeapp* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove skypeapp AppxPackage Error=%MYERROR%
echo Remove skypeapp AppxPackage Error=%MYERROR% >> log.txt

REM Getting started
powershell -Command "& {Get-AppxPackage *getstarted* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove getstarted AppxPackage Error=%MYERROR%
echo Remove getstarted AppxPackage Error=%MYERROR% >> log.txt

REM Groove Music
powershell -Command "& {Get-AppxPackage *zunemusic* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove zunemusic AppxPackage Error=%MYERROR%
echo Remove zunemusic AppxPackage Error=%MYERROR% >> log.txt

REM Cards
powershell -Command "& {Get-AppxPackage *windowsmaps* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove windowsmaps AppxPackage Error=%MYERROR%
echo Remove windowsmaps AppxPackage Error=%MYERROR% >> log.txt

REM Microsoft Solitaire Collection
powershell -Command "& {Get-AppxPackage *solitairecollection* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove solitairecollection AppxPackage Error=%MYERROR%
echo Remove solitairecollection AppxPackage Error=%MYERROR% >> log.txt

REM MSN Finance
powershell -Command "& {Get-AppxPackage *bingfinance* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove bingfinance AppxPackage Error=%MYERROR%
echo Remove bingfinance AppxPackage Error=%MYERROR% >> log.txt

REM Movies and TV
powershell -Command "& {Get-AppxPackage *zunevideo* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove zunevideo AppxPackage Error=%MYERROR%
echo Remove zunevideo AppxPackage Error=%MYERROR% >> log.txt

REM News
powershell -Command "& {Get-AppxPackage *bingnews* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove bingnews AppxPackage Error=%MYERROR%
echo Remove bingnews AppxPackage Error=%MYERROR% >> log.txt

REM OneNote
powershell -Command "& {Get-AppxPackage *onenote* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove onenote AppxPackage Error=%MYERROR%
echo Remove onenote AppxPackage Error=%MYERROR% >> log.txt

REM People
powershell -Command "& {Get-AppxPackage *people* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove people AppxPackage Error=%MYERROR%
echo Remove people AppxPackage Error=%MYERROR% >> log.txt

REM Phone Manager
powershell -Command "& {Get-AppxPackage *windowsphone* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove windowsphone AppxPackage Error=%MYERROR%
echo Remove windowsphone AppxPackage Error=%MYERROR% >> log.txt

REM Windows Store
powershell -Command "& {Get-AppxPackage *windowsstore* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove windowsstore AppxPackage Error=%MYERROR%
echo Remove windowsstore AppxPackage Error=%MYERROR% >> log.txt
reg ADD HKLM\SOFTWARE\Policies\Microsoft\WindowsStore /v RemoveWindowsStore /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo RemoveWindowsStore Error=%MYERROR%
echo RemoveWindowsStore Error=%MYERROR% >> log.txt
reg ADD HKCU\Software\Policies\Microsoft\WindowsStore /v RemoveWindowsStore /t REG_DWORD /d 1 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo RemoveWindowsStore Error=%MYERROR%
echo RemoveWindowsStore Error=%MYERROR% >> log.txt

REM Sport
powershell -Command "& {Get-AppxPackage *bingsports* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove bingsports AppxPackage Error=%MYERROR%
echo Remove bingsports AppxPackage Error=%MYERROR% >> log.txt

REM Weather
powershell -Command "& {Get-AppxPackage *bingweather* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove bingweather AppxPackage Error=%MYERROR%
echo Remove bingweather AppxPackage Error=%MYERROR% >> log.txt

REM Xbox
powershell -Command "& {Get-AppxPackage *xboxapp* | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove xboxapp AppxPackage Error=%MYERROR%
echo Remove xboxapp AppxPackage Error=%MYERROR% >> log.txt

REM OneDrive
powershell -Command "& {Get-AppxPackage-name* OneDrive | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove OneDrive AppxPackage Error=%MYERROR%
echo Remove OneDrive AppxPackage Error=%MYERROR% >> log.txt

REM XboxGameBar
powershell -Command "& {Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove XboxGameBar AppxPackage Error=%MYERROR%
echo Remove XboxGameBar AppxPackage Error=%MYERROR% >> log.txt

REM Paint 3D
powershell -Command "& {Get-AppxPackage Microsoft.MSPaint | Remove-AppxPackage}" 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove Paint 3D AppxPackage Error=%MYERROR%
echo Remove Paint 3D AppxPackage Error=%MYERROR% >> log.txt

chcp 866
