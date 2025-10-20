@cd/d "%~dp0"
chcp 65001
@echo off

(
	TASKKILL /f /im OneDrive.exe
	start %systemroot%\System32\OneDriveSetup.exe /uninstall
	del /s /f /q a:h-h %systemroot%\System32\OneDriveSetup.exe
	REM rd /s /q Private\
) 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove OneDrive x86 Error=%MYERROR%
echo Remove OneDrive x86 Error=%MYERROR% >> log.txt

(
	TASKKILL /f /im OneDrive.exe
	start %systemroot%\SysWOW64\OneDriveSetup.exe /uninstall
	del /s /f /q a:h-h %systemroot%\SysWOW64\OneDriveSetup.exe
	REM rd /s /q Private\
) 2>nul
SET MYERROR=%ERRORLEVEL%
echo Remove OneDrive x64 Error=%MYERROR%
echo Remove OneDrive x64 Error=%MYERROR% >> log.txt

REM reg DELETE "HKCU\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f 2>nul
REM SET MYERROR=%ERRORLEVEL%
REM echo reg DELETE HKCU\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} Error=%MYERROR%
REM echo reg DELETE HKCU\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} Error=%MYERROR% >> log.txt

REM reg DELETE "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
REM echo reg DELETE HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} Error=%MYERROR%
REM echo reg DELETE HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} Error=%MYERROR% >> log.txt

chcp 866
