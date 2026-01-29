#!/bin/bash

INVENTORY="inventory.ini"
VERBOSE=$1

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

echo -e "${YELLOW}=== Ansible Troubleshooting Toolkit ===${RESET}"

if [ ! -f "$INVENTORY" ]; then
  echo -e "${RED}Inventory file not found: $INVENTORY${RESET}"
  exit 1
fi

echo -e "${GREEN}✔ Inventory file found${RESET}"

echo ""
echo "== Ansible Version =="
ansible --version | head -n 2

echo ""
echo "== Testing connectivity (ping) =="
ansible all -i "$INVENTORY" -m ping || {
  echo -e "${RED}Ping failed on some hosts${RESET}"
}

echo ""
echo "== Checking SSH user =="
ansible all -i "$INVENTORY" -m command -a "whoami"

echo ""
echo "== Checking privilege escalation =="
ansible all -i "$INVENTORY" -m command -a "whoami" --become || {
  echo -e "${RED}Become failed${RESET}"
}

echo ""
echo "== Checking unreachable hosts =="
ansible all -i "$INVENTORY" --list-hosts

echo ""
echo "== Disk usage =="
df -h | grep -E "^/dev"

echo ""
echo "== Memory usage =="
free -h

if [ "$VERBOSE" == "-v" ]; then
  echo ""
  echo "== Running verbose connection test =="
  ansible all -i "$INVENTORY" -m ping -vvv
fi

echo ""
echo -e "${GREEN}Troubleshooting completed.${RESET}"
