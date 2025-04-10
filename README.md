# Arch Playbook

This automates the setup process of a minimal but usable
Arch Linux configuration by using a combination of shell-script
and ansible-playbook steps.

## Prerequisites

What has to be available for it to work:
- A fresh install of Arch Linux
- Curl
- `$USER` must be part of `wheel` group

## Run Setup

There are two ways to execute the setup.

### Remote script execution

From within your fresh Arch-Linux install run:
```sh
curl -fsSL https://ckiri.github.io/arch-playbook/setup.sh | sh
```

### Start manually

To start the playbook, first clone this repository:
```sh
git clone https://github.com/ckiri/arch-playbook
```

CD into the repo:
```sh
cd arch-playbook
```

Finally run the playbook:
```sh
ansible-playbook -i inventory -K playbook.yml
```
