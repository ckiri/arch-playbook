# Arch Playbook

This ansible playbooks automates the setup process of my specific configuration
of Arch Linux.

## Prerequisites

What has to be avaliable for it to work:
- Ansible
- Git
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
