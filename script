#!/bin/bash
echo "Updating system packages..."
sudo yum update -y
echo "Installing unzip and wget"
sudo yum install -y unzip wget
echo "Downloading packer"
wget https://releases.hashicorp.com/packer/1.11.2/packer_1.11.2_linux_amd64.zip -P /tmp
echo "Unzipping packer"
unzip /tmp/packer_1.11.2_linux_amd64.zip -d /tmp
echo "Moving packer binary to /usr/bin.."
sudo mv /tmp/packer /usr/bin
echo "verifying packer installation ..."
packer version
echo "Cleaning up"
rm -f /tmp/packer_1.11.2_linux_amd64.zip
echo "packer installation complete"
