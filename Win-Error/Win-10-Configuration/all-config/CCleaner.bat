@cd/d "%~dp0"
chcp 65001
@echo off

reg ADD HKCU\Software\Piriform\CCleaner /v Language /t reg_sz /d 1049 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaer Language Error=%MYERROR%
echo CCleaer Language Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Piriform\CCleaner /v UpdateBackground /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaner UpdateBackground Error=%MYERROR%
echo CCleaner UpdateBackground Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Piriform\CCleaner /v UpdateCheck /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaner UpdateCheck Error=%MYERROR%
echo CCleaner UpdateCheck Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Piriform\CCleaner /v HelpImproveCCleaner /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaner HelpImproveCCleaner Error=%MYERROR%
echo CCleaner HelpImproveCCleaner Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Piriform\CCleaner /v PrefsPrivacyShowOffers1stParty /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaner PrefsPrivacyShowOffers1stParty Error=%MYERROR%
echo CCleaner PrefsPrivacyShowOffers1stParty Error=%MYERROR% >> log.txt

reg ADD HKCU\Software\Piriform\CCleaner /v PrefsPrivacyShowOffers3rdParty /t REG_DWORD /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaner PrefsPrivacyShowOffers3rdParty Error=%MYERROR%
echo CCleaner PrefsPrivacyShowOffers3rdParty Error=%MYERROR% >> log.txt

reg ADD HKCU\SOFTWARE\Piriform\CCleaner /v "(Cfg)PC" /t reg_sz /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaner (Cfg)PC Error=%MYERROR%
echo CCleaner (Cfg)PC Error=%MYERROR% >> log.txt

reg ADD HKCU\SOFTWARE\Piriform\CCleaner /v "(Cfg)PE" /t reg_sz /d 0 /f 2>nul
SET MYERROR=%ERRORLEVEL%
echo CCleaner (Cfg)PE Error=%MYERROR%
echo CCleaner (Cfg)PE Error=%MYERROR% >> log.txt

(
	echo 0.0.0.0 alpha-crap.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 0.0.0.0 analytics.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 0.0.0.0 ip-info.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 0.0.0.0 ipm-provider.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 0.0.0.0 license-api.ccleaner.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 0.0.0.0 license.piriform.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 0.0.0.0 ncc.avast.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 0.0.0.0 ncc.avast.com.edgesuite.net >> %SystemRoot%\System32\drivers\etc\hosts
	echo 0.0.0.0 shepherd.ff.avast.com >> %SystemRoot%\System32\drivers\etc\hosts
	echo 0.0.0.0 www.ccleaner.com >> %SystemRoot%\System32\drivers\etc\hosts
) 2>nul
SET MYERROR=%ERRORLEVEL%
echo hosts config on CCleaner Error=%MYERROR%
echo hosts config on CCleaner Error=%MYERROR% >> log.txt

chcp 866

pause
