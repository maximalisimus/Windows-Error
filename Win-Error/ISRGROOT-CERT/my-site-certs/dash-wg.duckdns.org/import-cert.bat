@cd/d "%~dp0"
@echo off
powershell -Command Import-Certificate -FilePath "dash-wg.duckdns.org_R3.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "dash-wg.duckdns.org_ISRG_Root_X1.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "dash-wg.duckdns.org_R3.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "dash-wg.duckdns.org_ISRG_Root_X1.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "dash-wg.duckdns.org.crt" -CertStoreLocation Cert:\LocalMachine\My
pause

