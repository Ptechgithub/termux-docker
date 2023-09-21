#!/bin/bash

clear
echo "By 2--> Peyman * Github.com/Ptechgithub * "

check_dependencies() {
    local dependencies=("wget" "curl" "qemu-system-x86-64-headless" "qemu-utils")
    
    for dep in "${dependencies[@]}"; do
        if ! command -v "${dep}" &> /dev/null; then
            echo "${dep} is not installed. Installing..."
            pkg install "${dep}" -y
        fi
    done
}

# Update the system and install required packages
pkg update -y
pkg upgrade -y
pkg update
check_dependencies

# Create a directory and download Alpine Linux ISO
mkdir alpine && cd alpine
wget https://dl-cdn.alpinelinux.org/alpine/v3.18/releases/x86_64/alpine-virt-3.18.3-x86_64.iso

# Ask the user for storage size or use default (10GB)
read -p "Enter the storage size in gigabytes (default: 10): " storage
storage="${storage:-10}"
qemu-img create -f qcow2 alpine.qcow2 "${storage}G"

# Ask the user for RAM size or use default (512MB)
read -p "Enter the RAM size in megabytes (default: 512): " ram_size
ram_size="${ram_size:-512}"
qemu-system-x86_64 -m "${ram_size}" -netdev user,id=n1,hostfwd=tcp::2222-:22 -device virtio-net,netdev=n1 -cdrom alpine-virt-3.18.3-x86_64.iso -nographic alpine.qcow2

# Run initial Alpine Linux setup
setup-alpine