#!/bin/bash

# ref: https://www.lesstif.com/pages/viewpage.action?pageId=6979614

openssl genrsa -aes256 -out rootca.key 2048

openssl req -new -key rootca.key -out rootca.csr -config rootca_openssl.conf

openssl x509 -req -days 3650 -extensions v3_ca -set_serial 1 -in rootca.csr -signkey rootca.key -out rootca.crt -extfile rootca_openssl.conf
