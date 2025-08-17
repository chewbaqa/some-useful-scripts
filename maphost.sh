#!/bin/bash

# This script can be used to add new entries in /etc/hosts

# check if script is running as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

# first take in user input
read -p "Enter IP Address: " ip_address
read -p "Enter Hostname: " host_name

# check if both ip and hostname are entered
if [ -z "$ip_address" ] || [ -z "$host_name" ]; then
    echo "Fields cannot be empty."
    exit 1
fi

# now append
echo "$ip_address $host_name" >> /etc/hosts
echo "$ip_address $host_name added to /etc/hosts."