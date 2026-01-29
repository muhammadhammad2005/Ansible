#!/bin/bash
set -euo pipefail

VAULT_PASSWORD_FILE=".vault_password"

usage() {
    echo "Usage: $0 {create|edit|view|encrypt|decrypt|rekey} <file.yml>"
    echo ""
    echo "Examples:"
    echo "  $0 create secrets.yml"
    echo "  $0 view production_secrets.yml"
    exit 1
}

# Validate arguments
if [ "$#" -ne 2 ]; then
    usage
fi

ACTION="$1"
FILE="$2"

# Check vault password file
if [ ! -f "$VAULT_PASSWORD_FILE" ]; then
    echo "Error: Vault password file '$VAULT_PASSWORD_FILE' not found."
    echo "Create it before running this script."
    exit 1
fi

# Validate action
case "$ACTION" in
    create|edit|view|encrypt|decrypt|rekey)
        ;;
    *)
        echo "Error: Invalid action '$ACTION'"
        usage
        ;;
esac

# Check file existence when required
if [[ "$ACTION" != "create" && ! -f "$FILE" ]]; then
    echo "Error: File '$FILE' does not exist."
    exit 1
fi

echo "Executing vault action: $ACTION on $FILE"

ansible-vault "$ACTION" "$FILE" \
    --vault-password-file "$VAULT_PASSWORD_FILE"

echo "Vault operation completed successfully."
