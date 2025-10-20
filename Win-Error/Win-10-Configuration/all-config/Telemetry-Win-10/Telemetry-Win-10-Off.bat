@cd/d "%~dp0"
chcp 65001
@echo off

REM *** Key logger ***

sc stop DiagTrack 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc stop DiagTrack  Error=%MYERROR%
echo sc stop DiagTrack  Error=%MYERROR%  >> log.txt

sc stop dmwappushservice 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc stop dmwappushservice Error=%MYERROR%
echo sc stop dmwappushservice Error=%MYERROR% >> log.txt

sc delete DiagTrack 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc delete DiagTrack Error=%MYERROR%
echo sc delete DiagTrack Error=%MYERROR% >> log.txt

sc delete dmwappushservice 2>nul
SET MYERROR=%ERRORLEVEL%
echo sc delete dmwappushservice Error=%MYERROR%
echo sc delete dmwappushservice Error=%MYERROR% >> log.txt

echo "" > %ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl 2>nul
SET MYERROR=%ERRORLEVEL%
echo rewrite file %ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl Error=%MYERROR% >> log.txt

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f Error=%MYERROR%
echo reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f Error=%MYERROR% >> log.txt

del /q "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\*.etl" "%ProgramData%\Microsoft\Diagnosis\ETLLogs\ShutdownLogger\*.etl" 2>nul
SET MYERROR=%ERRORLEVEL%
echo del "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\*.etl" "%ProgramData%\Microsoft\Diagnosis\ETLLogs\ShutdownLogger\*.etl" Error=%MYERROR%
echo del "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\*.etl" "%ProgramData%\Microsoft\Diagnosis\ETLLogs\ShutdownLogger\*.etl" Error=%MYERROR% >> log.txt

reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f 2>nul
echo reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f Error=%MYERROR%
echo reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f Error=%MYERROR% >> log.txt

setlocal
for /f "tokens=*" %%k in ('where /R %ProgramData%\Microsoft\Diagnosis event*.rbs') do (
	del /q %%k 2>nul
	SET MYERROR=%ERRORLEVEL%
	echo %%k Error=%MYERROR%
	echo %%k Error=%MYERROR% >> log.txt
) 2>nul
endlocal

(
	echo 127.0.0.1 localhost >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 localhost.localdomain >> %SystemRoot%\System32\drivers\etc\hosts
	echo 255.255.255.255 broadcasthost >> %SystemRoot%\System32\drivers\etc\hosts
	echo ::1 localhost >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 local >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 vortex.data.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 vortex-win.data.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 telecommand.telemetry.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 telecommand.telemetry.microsoft.com.nsatc.net >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 oca.telemetry.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 oca.telemetry.microsoft.com.nsatc.net >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 sqm.telemetry.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 sqm.telemetry.microsoft.com.nsatc.net >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 watson.telemetry.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 watson.telemetry.microsoft.com.nsatc.net >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 redir.metaservices.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 choice.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 choice.microsoft.com.nsatc.net >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 df.telemetry.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 reports.wes.df.telemetry.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 wes.df.telemetry.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 services.wes.df.telemetry.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 sqm.df.telemetry.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 telemetry.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 watson.ppe.telemetry.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 telemetry.appex.bing.net >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 telemetry.urs.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 telemetry.appex.bing.net:443 >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 settings-sandbox.data.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 vortex-sandbox.data.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 survey.watson.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 watson.live.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 watson.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 statsfe2.ws.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 corpext.msitadfs.glbdns2.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 compatexchange.cloudapp.net >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 cs1.wpc.v0cdn.net >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 a-0001.a-msedge.net >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 statsfe2.update.microsoft.com.akadns.net >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 sls.update.microsoft.com.akadns.net >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 fe2.update.microsoft.com.akadns.net >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 65.55.108.23 >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 65.39.117.230 >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 23.218.212.69 >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 134.170.30.202 >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 137.116.81.24 >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 diagnostics.support.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 corp.sts.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 statsfe1.ws.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 pre.footprintpredict.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 204.79.197.200 >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 23.218.212.69 >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 i1.services.social.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 i1.services.social.microsoft.com.nsatc.net >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 feedback.windows.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 feedback.microsoft-hohm.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 127.0.0.1 feedback.search.microsoft.com >> %SystemRoot%\System32\drivers\etc\hosts
) 2>nul
SET MYERROR=%ERRORLEVEL%
echo hosts config on CCleaner Error=%MYERROR%
echo hosts config on CCleaner Error=%MYERROR% >> log.txt

chcp 866
pause
