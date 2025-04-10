#!/bin/sh
#
# This script installs a minimal but usable Arch-Linux setup

main() {
    DIR="/home/${USER}/"
    REQ_PACKAGES="archlinux-keyring python3 ansible git"
    
    cd $DIR
    
    # Check for CPU vendor & add microcode update image to the list
    printf "Detect CPU vendor for installation of microcode update image.\n"
    cpu=$(lscpu)
    test -n "$(grep -e "AMD" < $cpu)" \
        && REQ_PACKAGES="${REQ_PACKAGES} amd-ucode"
    test -n "$(grep -e "Intel" < $cpu)" \
        && REQ_PACKAGES="${REQ_PACKAGES} intel-ucode"
    
    # Check for GPU vendor & install drivers
    pci=$(lspci)
    printf "Detect GPU vendor for installation of driver.\n"
    test -n "$(grep -E ".*VGA compatible controller:\s*[^:]+Radeon.*" < $pci)" \
        && REQ_PACKAGES="${REQ_PACKAGES} vulkan-radeon lib32-vulkan-radeon"
    test -n "$(grep -E ".*VGA compatible controller:\s*[^:]+NVIDIA.*" < $pci)" \
        && REQ_PACKAGES="${REQ_PACKAGES} nvidia lib32-nvidia-utils egl-wayland"
    test -n "$(grep -E ".*VGA compatible controller:\s*[^:]+Intel.*" < $pci)" \
        && REQ_PACKAGES="${REQ_PACKAGES} vulkan-intel lib32-vulkan-intel"
    
    sudo pacman -Syu $REQ_PACKAGES

    # Run the ansible playbook
    git clone --depth=1 https://github.com/ckiri/arch-playbook
    cd ./arch-playbook
    printf "Running the Ansible Playbook.\n"
    ansible-playbook -i inventory -K playbook.yml

    # Cleanup
    cd $DIR
    rm -r ./arch-playbook
}

main
exit 0
