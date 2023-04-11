@cd/d "%~dp0"
@echo off
powershell -Command Import-Certificate -FilePath "russian_trusted_root_ca.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "russian_trusted_sub_ca.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "russian_trusted_root_ca.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "russian_trusted_sub_ca.crt" -CertStoreLocation Cert:\LocalMachine\CA
pause

