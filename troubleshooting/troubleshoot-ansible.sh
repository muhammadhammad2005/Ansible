#!/bin/bash
echo "=== Ansible Health ==="
ansible --version
ansible all -i inventory.ini -m ping
ansible all -i inventory.ini -m command -a "whoami"
ansible all -i inventory.ini -m command -a "whoami" --become
df -h
free -h
