@cd/d "%~dp0"
@echo off
powershell -Command Import-Certificate -FilePath "isrg-root-x1-cross-signed.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "isrg-root-x2-cross-signed.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "letsencryptauthorityx1.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "letsencryptauthorityx2.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "letsencryptauthorityx3.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "letsencryptauthorityx4.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "lets-encrypt-e1.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "lets-encrypt-e2.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "lets-encrypt-r3.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "lets-encrypt-r4.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "lets-encrypt-x1-cross-signed.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "lets-encrypt-x2-cross-signed.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "lets-encrypt-x3-cross-signed.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "lets-encrypt-x4-cross-signed.crt" -CertStoreLocation Cert:\LocalMachine\Root

powershell -Command Import-Certificate -FilePath "isrg-root-x1-cross-signed.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "isrg-root-x2-cross-signed.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "letsencryptauthorityx1.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "letsencryptauthorityx2.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "letsencryptauthorityx3.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "letsencryptauthorityx4.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "lets-encrypt-e1.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "lets-encrypt-e2.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "lets-encrypt-r3.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "lets-encrypt-r4.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "lets-encrypt-x1-cross-signed.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "lets-encrypt-x2-cross-signed.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "lets-encrypt-x3-cross-signed.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "lets-encrypt-x4-cross-signed.crt" -CertStoreLocation Cert:\LocalMachine\CA
pause

