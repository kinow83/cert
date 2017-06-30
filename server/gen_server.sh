#!/bin/bash

# ref: https://www.lesstif.com/pages/viewpage.action?pageId=6979614

DIRNAME=server
FILENAME=server

mkdir $DIRNAME > /dev/null

openssl genrsa -aes256 -out $FILENAME.key.enc 2048

# remove key password
openssl rsa -in $FILENAME.key.enc -out $FILENAME.key

openssl req -new  -key $FILENAME.key -out $FILENAME.csr -config openss.conf

openssl x509 -req -days 1825 -extensions v3_user -in $FILENAME.csr -CA ../rootca/rootca.crt -CAcreateserial -CAkey  ../rootca/rootca/rootca.key -out $FILENAME.crt  -extfile openss.conf

openssl x509 -in $FILENAME.crt -text -noout

rm -fr $FILENAME.csr
