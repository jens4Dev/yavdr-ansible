#!/usr/bin/env bash
set -e

if (( $EUID != 0 )); then
    echo "This script must be run using sudo -H or as root"
    exit
fi

. scripts/install-packages.sh

# create separate logs per run - place in playbook-dir (pwd)
ANSIBLE_LOG_PATH=yavdr07.$(date +%Y%m%d_%H%M%S).log
export ANSIBLE_LOG_PATH

ansible-playbook yavdr07.yml -b -i 'localhost_inventory' --connection=local --tags="all"
