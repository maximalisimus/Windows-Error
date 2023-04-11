@cd/d "%~dp0"
@echo off
powershell -Command Import-Certificate -FilePath "_.mintrud.gov.ru_R3.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "_.rosmintrud.ru_R3.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "_.mintrud.gov.ru_R3.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "_.rosmintrud.ru_R3.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "_.mintrud.gov.ru.crt" -CertStoreLocation Cert:\LocalMachine\My
powershell -Command Import-Certificate -FilePath "_.rosmintrud.ru.crt" -CertStoreLocation Cert:\LocalMachine\My
powershell -Command Import-Certificate -FilePath "_.mintrud.gov.ru.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "_.rosmintrud.ru.crt" -CertStoreLocation Cert:\LocalMachine\Root
powershell -Command Import-Certificate -FilePath "_.mintrud.gov.ru.crt" -CertStoreLocation Cert:\LocalMachine\CA
powershell -Command Import-Certificate -FilePath "_.rosmintrud.ru.crt" -CertStoreLocation Cert:\LocalMachine\CA
pause
