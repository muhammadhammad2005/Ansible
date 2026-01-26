# Ansible Labs Repository

This repository contains multiple Ansible labs and projects demonstrating automation across Linux system administration, software management, user/group management, firewall automation, web servers, and more. These labs are suitable for learning, practice, or portfolio demonstration.

---

## Repository Structure

Each folder represents a separate lab or project. Playbooks are designed to run on `localhost` (local machine) but can be adapted for remote hosts.

### Current Labs

| Folder | Description |
|--------|-------------|
| `ansible-inv-var` | Labs on inventory files and variables. |
| `ansible-modules` | Examples of using Ansible modules effectively. |
| `ansible-roles` | Role-based Ansible projects. |
| `ansible-software-package` | Automating software installation and package management. |
| `ansible-variable-and-facts` | Using variables and facts in playbooks. |
| `ansible-webserver` | Webserver automation (Apache/Nginx). |
| `automating-firewall` | Automating firewall rules and service monitoring. |
| `automating-software-package` | Advanced package management and service automation. |
| `conditionals-loops` | Using conditionals and loops in playbooks. |
| `handlers` | Playbooks demonstrating Ansible handlers. |
| `simple-playbook` | Basic playbooks for beginner practice. |
| `user-group-management` | Automating user and group management tasks. |
| `user-manage` | Comprehensive lab: user creation, password policies, SSH keys, RBAC, and audit reports. |

> More labs will be added in the future.

---

## How to Use

1. Clone the repository:

git clone your-repo-url

cd repo-name

2. Navigate to the lab folder you want to run:
cd folder-name

3. Run the playbooks:

ansible-playbook -i <host> <playbook>

## Best Practices

Labs are safe to run on localhost. For remote hosts, update inventory/hosts appropriately.

Sensitive data such as passwords or SSH keys are not included.
Use --check mode in Ansible for dry runs when experimenting.
Keep playbooks organized in playbooks/, inventory files in inventory/, and variables in group_vars/ or host_vars/.

## Future Updates

New labs will be added regularly.
Maintain a clean folder structure to organize playbooks and resources.

## License

This repository is for educational and portfolio purposes. You may reference or adapt playbooks, but do not include sensitive information in public projects.
