#!/bin/bash
 
openssl s_client -showcerts -connect akot.rosmintrud.ru:443 </dev/null > ./certificate.txt
