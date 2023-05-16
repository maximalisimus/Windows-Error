#!/bin/bash

my_domain=$(python ./ssl-scripts/domain.py)
openssl s_client -showcerts -connect "${my_domain}":443 </dev/null > ./certificate.txt
python ./ssl-scripts/convert.py
sudo sh ssl-scripts/CAtoCert89.sh
