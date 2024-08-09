#!/usr/bin/bash

echo " =================================================== "
echo "|                 INSTALL TERRAFORM                 |"
echo " =================================================== "


# Update
apt-get update

# Install sudo
apt-get install -y sudo

# Install gnupg software-properties-common wget & curl
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl wget

# Install the HashiCorp GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

# Verify the key's fingerprint.
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

# Add the official HashiCorp repository to the system
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

# Download the package information from HashiCorp.
sudo apt update

# Install Terraform from the new repository.
sudo apt-get install terraform

# Restart the bash session
source ~/.bashrc

echo "\n"
echo " =================================================== "
echo "|                INSTALL GCLOUD CLI                 |"
echo " =================================================== "

# Install apt-transport-https & ca-certificates
sudo apt-get install -y apt-transport-https ca-certificates

# Import Google Cloud's public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

# Add the gcloud CLI distribution URI as a package source
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Update and install gcloud CLI
sudo apt-get update && sudo apt-get install -y google-cloud-cli

# Restart the bash session
source ~/.bashrc