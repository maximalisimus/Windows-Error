@cd/d "%~dp0"
@echo off
powershell -Command Import-Certificate -FilePath "GlobalSign-Root-CA-R1.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "GlobalSign-Root-CA-R3.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "AlphaSSL-CA-SHA256-G2.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "AlphaSSL-CA-SHA256-G2-R3.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "AlphaSSL-CA-SHA256-G4.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "_.tconf.rt.ru.crt" -CertStoreLocation Cert:\LocalMachine\My
pause
