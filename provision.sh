#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
echo "Running operating system updates..."
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
echo "clear disk"
sudo apt-get clean
sudo dd if=/dev/zero of=/EMPTY
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exit
