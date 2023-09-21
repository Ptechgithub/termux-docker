#!/bin/bash

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
mkdir alpine && pushd alpine
wget https://dl-cdn.alpinelinux.org/alpine/v3.18/releases/x86_64/alpine-virt-3.18.3-x86_64.iso

# Create a qcow2 file
read -p "Enter the storage size in gigabytes (e.g., 10): " storage
qemu-img create -f qcow2 alpine.qcow2 $storageG

# Run the virtual machine
read -p "Enter the  RAM size in megabytes (e.g., 512): " ram_size
qemu-system-x86_64 -m 512 -netdev user,id=n1,hostfwd=tcp::2222-:22 -device virtio-net,netdev=n1 -nographic alpine.qcow2

# Configure udhcpc settings
mkdir -p /etc/udhcpc
echo "RESOLV_CONF=\"no\"" > /etc/udhcpc/udhcpc.conf

# Configure resolv.conf
echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# Run initial Alpine Linux setup
setup-alpine