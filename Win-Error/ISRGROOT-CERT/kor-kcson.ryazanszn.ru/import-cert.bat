@cd/d "%~dp0"
@echo off
powershell -Command Import-Certificate -FilePath "_.ryazanszn.ru_Russian_Trusted_Root_CA.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "_.ryazanszn.ru_Russian_Trusted_Sub_CA.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "_.ryazanszn.ru.crt" -CertStoreLocation Cert:\LocalMachine\My
pause

