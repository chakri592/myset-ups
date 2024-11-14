#!/bin/bash

# Update package list
sudo apt update

# Install wget if not already installed
if ! command -v wget &> /dev/null; then
    echo "Installing wget..."
    sudo apt install wget -y
else
    echo "wget is already installed."
fi

# Install unzip if not already installed
if ! command -v unzip &> /dev/null; then
    echo "Installing unzip..."
    sudo apt install unzip -y
else
    echo "unzip is already installed."
fi

# Download OpenTofu release
echo "Downloading OpenTofu..."
wget -q https://github.com/opentofu/opentofu/releases/download/v1.6.0-alpha3/tofu_1.6.0-alpha3_linux_amd64.zip

# Unzip the downloaded file
echo "Unzipping OpenTofu..."
unzip -o tofu_1.6.0-alpha3_linux_amd64.zip

# Move the tofu binary to /usr/local/bin
echo "Moving tofu to /usr/local/bin..."
sudo cp tofu /usr/local/bin/

# Verify the installation
if command -v tofu &> /dev/null; then
    echo "OpenTofu installed successfully."
    tofu --version
else
    echo "Installation failed."
fi
