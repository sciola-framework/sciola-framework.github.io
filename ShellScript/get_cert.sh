#!/usr/bin/env sh

echo | openssl s_client -connect my_domain.com:443 | openssl x509 -out ~/.my_domain.pem
