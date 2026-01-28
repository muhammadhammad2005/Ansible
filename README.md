# Ansible Automation Portfolio

This repository contains my complete hands-on Ansible lab work focused on automating Linux system administration tasks using **Ansible on local nodes**.

It serves as a practical portfolio of real-world automation scenarios, covering core Ansible concepts such as playbooks, inventories, roles, variables, handlers, vault, and idempotency.

## 🎯 Purpose of This Repository

- Build strong practical experience with Ansible
- Practice configuration management and automation workflows
- Maintain a structured DevOps/Linux portfolio
- Continuously add new labs and advanced scenarios

This is an active learning repository and will keep growing over time.

## 🧪 Lab Environment

- **Control Node:** Cloud machine from Al Nafi lab environment  
- **Managed Nodes:** Cloud nodes provided for lab exercises  
- **Connection Type:** Remote execution via SSH / Ansible  
- **Focus:** Realistic configuration management scenarios

All playbooks are designed to run locally but reflect real production concepts.

## 📂 Repository Structure

Each folder represents a focused topic or mini-project:

- `ansible-idempotency` – Idempotent vs non-idempotent playbooks  
- `ansible-inv-var` – Inventories, group_vars, host_vars  
- `ansible-modules` – Core module usage and error handling  
- `ansible-roles` – Role-based automation structure  
- `ansible-variable-and-facts` – Facts, variables, precedence  
- `ansible-webserver` – Web server deployment automation  
- `automating-firewall` / `firewall-ansible` – Firewall management  
- `conditionals-loops` – Logic, loops, templates  
- `handlers` – Handler workflows  
- `user-group-management` / `user-manage` – User automation  
- `vault` – Encrypted secrets and secure deployments  

Each directory contains its own inventories and playbooks.

## 🚀 Topics Covered

- Ansible fundamentals
- Playbooks and inventories
- Variables and facts
- Conditionals and loops
- Roles and templates
- Handlers and notifications
- Idempotency
- User and group management
- Firewall automation
- Secure secrets with Ansible Vault

## ▶️ How to Use

Clone the repository:

```bash
git clone https://github.com/muhammadhammad2005/Ansible.git
cd Ansible
```
Run a playbook from any lab folder:
```bash
ansible-playbook playbooks/<playbook-name>.yml
```
Some labs require using their specific inventory files.

## 🔄 Continuous Updates

This repository is actively maintained.
New labs, improvements, and advanced automation scenarios will be added regularly as part of ongoing learning.

## 📘 Notes

- Labs are executed on **Al Nafi cloud lab machines**  
- Designed for learning, practicing real-world Ansible automation
