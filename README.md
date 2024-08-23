# Arch Playbook

This ansible playbooks automates the setup process of a minimal but usable
Arch Linux configuration.

## Prerequisites

What has to be avaliable for it to work:
- Ansible
- Git
- curl
- A fresh install of Arch Linux

## Run Setup

To start the playbook, first clone this repository:
```bash
git clone https://github.com/ckiri/arch-playbook
```

CD into the repo:
```bash
cd arch-playbook
```

Finally run the playbook:
```bash
ansible-playbook -i inventory -K playbook.yml
```
