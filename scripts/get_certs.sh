#!/bin/bash

# Retrieve the certificate files and private key from Vault
CERTIFICATE=$(vault kv get -field=certificate secret/ssl_certificate)
PRIVATE_KEY=$(vault kv get -field=private_key secret/ssl_certificate)

# Set the certificate files and private key as environment variables
docker exec -it devops-nginx-reverse-proxy-1 /bin/sh -c "export SSL_CERTIFICATE=\"$CERTIFICATE\" && export SSL_PRIVATE_KEY=\"$PRIVATE_KEY\""

echo "SSL certificate and private key set as environment variables in nginx-container"