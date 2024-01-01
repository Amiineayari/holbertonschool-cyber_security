#!/bin/bash

# Check if the script is run as a privileged user
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as a privileged user (root or sudo)."
    exit 1
fi

# Prompt for sudo password
read -s -p "[sudo] password for $(whoami): " sudo_password
echo

# Use sudo to read the last 5 login sessions from the wtmp file
last -n 5 -f /var/log/wtmp | grep -E '^(root|reboot)' | awk '{print $1, $2, $3, $5, $6, $7}'

# Display wtmp beginning timestamp
echo -e "\nwtmp begins $(last -f /var/log/wtmp | tail -n 1 | awk '{print $3, $4, $5}')"
