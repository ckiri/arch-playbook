# Arch Playbook

This automates the setup process of a minimal but usable
Arch Linux configuration by using a combination of `sh` and `playbook` steps.

## Prerequisites

What has to be avaliable for it to work:
- A fresh install of Arch Linux

## Run Setup

There are two ways to execute the setup.

### Remote script execution

From within your fresh Arch-Linux install run:
```bash
curl -fsSL https://ckiri.github.io/arch-playbook/setup.sh | sh
```

### Start manually

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
