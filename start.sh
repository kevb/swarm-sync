#!/bin/bash

echo "LOADING SECRETS..."
source env_secrets_expand.sh

if [ "$SSH_PRIVATE_KEY" != "false" ]
then
echo "CREATE ID_RSA FROM SSH_PRIVATE_KEY"
echo -e "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
fi

echo "START THE APP..."
exec node src/index.js "$@"