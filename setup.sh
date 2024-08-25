#!/bin/sh
# This script installs a minimal but usable Arch-Linux setup

DIR="/home/${USER}/"
REQ_PACKAGES="python3 ansible git"

cd $DIR

# Check for CPU vendor & install microcode update image
printf "Detect CPU vendor and install res.\n"
cpu=$(lscpu)
[ -z "$(grep -e "AMD" <<< $cpu)" ] \
  && REQ_PACKAGES="${REQ_PACKAGES} amd-ucode"
[ -z "$(grep -e "Intel" <<< $cpu)" ] \
  && REQ_PACKAGES="${REQ_PACKAGES} intel-ucode"

# Check for GPU vendor & install drivers
pci=$(lspci)
printf "Detect GPU vendor and intall driver.\n"
[ -z "$(grep -E ".*VGA compatible controller:\s*[^:]+Radeon.*" <<< $pci)" ] \
  && REQ_PACKAGES="${REQ_PACKAGES} vulkan-radeon lib32-vulkan-radeon"
[ -z "$(grep -E ".*VGA compatible controller:\s*[^:]+NVIDIA.*" <<< $pci)" ] \
  && REQ_PACKAGES="${REQ_PACKAGES} nvidia lib32-nvidia-utils egl-wayland"
[ -z "$(grep -E ".*VGA compatible controller:\s*[^:]+Intel.*" <<< $pci)" ] \
  && REQ_PACKAGES="${REQ_PACKAGES} vulkan-intel lib32-vulkan-intel"

sudo pacman -Syu --needed $REQ_PACKAGES

# Run the ansible playbook
git clone --depth=1 https://github.com/ckiri/arch-playbook
cd ./arch-playbook
printf "Running the Ansible Playbook.\n"
ansible-playbook -i inventory -K playbook.yml

# Cleanup
cd $DIR
rm -r ./arch-playbook

exit 0
