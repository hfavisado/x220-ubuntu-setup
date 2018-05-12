#!/bin/bash

# script based on instructions written in http://x220.mcdonnelltech.com/ubuntu/

if ! grep -q "^deb .*$linrunner/tlp" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
	sudo add-apt-repository ppa:linrunner/tlp
fi
sudo apt update

sudo apt install lm-sensors thinkfan tlp tlp-rdw tp-smapi-dkms acpi-call-dkms
echo "options thinkpad_acpi fan_control=1" | sudo tee /etc/modprobe.d/thinkfan.conf
sudo modprobe thinkpad_acpi
sudo sed -i 's|START=no|START=yes|g' /etc/default/thinkfan
sudo systemctl enable thinkfan.service

