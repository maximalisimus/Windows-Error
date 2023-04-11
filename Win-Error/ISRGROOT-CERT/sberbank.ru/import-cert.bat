@cd/d "%~dp0"
@echo off
powershell -Command Import-Certificate -FilePath "sberbank.ru_Russian_Trusted_Sub_CA.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "sberbank.ru_Russian_Trusted_Sub_CA.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "sberbank.ru.crt" -CertStoreLocation Cert:\LocalMachine\My
pause

