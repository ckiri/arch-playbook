#!/bin/sh

main() {
  LOCATION=$(pwd)

  sudo pacman -S \
    python3 \
    ansible \
    git

  git clone https://github.com/ckiri/arch-playbook
  cd arch-playbook

  ansible-playbook -i inventory -K playbook.yml

  cd $LOCATION

  rm -r arch-playbook

  exit 0
}

main
