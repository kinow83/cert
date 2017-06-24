#!/bin/bash

# ref: https://www.lesstif.com/pages/viewpage.action?pageId=6979614

openssl genrsa -aes256 -out kinow.com.key.enc 2048

# remove key password
openssl rsa -in kinow.com.key.enc -out kinow.com.key

openssl req -new  -key kinow.com.key -out kinow.com.csr -config server_openssl.conf

openssl x509 -req -days 1825 -extensions v3_user -in kinow.com.csr -CA ../rootca/rootca.crt -CAcreateserial -CAkey  ../rootca/rootca.key -out kinow.com.crt  -extfile server_openssl.conf

openssl x509 -in kinow.com.crt -text -noout
