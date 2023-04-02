@cd/d "%~dp0"
@echo off
powershell -Command Import-Certificate -FilePath "_.ryazanszn.ru_Russian_Trusted_Root_CA.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "_.ryazanszn.ru_Russian_Trusted_Sub_CA.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "_.ryazanszn.ru.crt" -CertStoreLocation Cert:\LocalMachine\My
powershell -Command Import-Certificate -FilePath "933c6ddee9.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "cabd2a79a1.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "isrgrootx1.der" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "ISRG-Root-X1-1.cer" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "ISRG-Root-X1-2.cer" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "isrg-root-x2.der" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "ISRG-Root-X2-1.cer" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "ISRG-Root-X2-2.cer" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "ISRG-Root-X3.cer" -CertStoreLocation Cert:\LocalMachine\Root
pause
