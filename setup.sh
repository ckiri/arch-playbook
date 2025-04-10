#!/bin/sh
#
# This script installs a minimal but usable Arch-Linux setup

main() {
    DIR="/home/${USER}/"
    REQ_PACKAGES="archlinux-keyring python3 ansible git"
    
    cd $DIR
    
    # Install required packages 
    sudo pacman -Syu $REQ_PACKAGES
    test $? -ne 0 && exit 1

    # Run the ansible playbook
    git clone --depth=1 https://github.com/ckiri/arch-playbook
    cd ./arch-playbook
    printf "Running the Ansible Playbook.\n"
    ansible-playbook -i inventory -K playbook.yml
    test $? -ne 0 && exit 1

    # Cleanup
    cd $DIR
    sudo rm -r ./arch-playbook
}

main
exit 0
