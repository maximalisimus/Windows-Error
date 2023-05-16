#!/bin/bash

my_domain=$(python ./ssl-scripts/domain.py)
ssl-scripts/OpenSSL-3.0.5_win32/openssl s_client -showcerts -connect "${my_domain}":443 </dev/null > ./certificate.txt
python ./ssl-scripts/convert.py
