#!/bin/bash
VAULT_PASSWORD_FILE=".vault_password"
ACTION=$1
FILE=$2

if [ $# -lt 2 ]; then
    echo "Usage: $0 [create|edit|view|encrypt|decrypt|rekey] filename"
    exit 1
fi

case $ACTION in
    create) ansible-vault create "$FILE" --vault-password-file "$VAULT_PASSWORD_FILE" ;;
    edit) ansible-vault edit "$FILE" --vault-password-file "$VAULT_PASSWORD_FILE" ;;
    view) ansible-vault view "$FILE" --vault-password-file "$VAULT_PASSWORD_FILE" ;;
    encrypt) ansible-vault encrypt "$FILE" --vault-password-file "$VAULT_PASSWORD_FILE" ;;
    decrypt) ansible-vault decrypt "$FILE" --vault-password-file "$VAULT_PASSWORD_FILE" ;;
    rekey) ansible-vault rekey "$FILE" --vault-password-file "$VAULT_PASSWORD_FILE" ;;
    *) echo "Unknown action"; exit 1 ;;
esac
