@cd/d "%~dp0"
@echo off
powershell -Command Import-Certificate -FilePath "rootca_ssl_rsa2022.crt" -CertStoreLocation Cert:\LocalMachine\Root
pause

