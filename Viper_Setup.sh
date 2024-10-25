#!/bin/bash

cat logo.txt


echo "Viper Offensive Toolkit Setup"
echo "Running program..."


#Hacking Tool Packages

#Add Kali Linux archives
sudo sh -c "echo 'deb https://http.kali.org/kali kali-rolling main non-free contrib' > /etc/apt/sources.list.d/kali.list"
sudo apt update 
sudo apt install -y gnupg 
wget 'https://archive.kali.org/archive-key.asc'
sudo apt-key add archive-key.asc
sudo apt update
sudo sh -c "echo 'Package: *'>/etc/apt/preferences.d/kali.pref; echo 'Pin: release a=kali-rolling'>>/etc/apt/preferences.d/kali.pref; echo 'Pin-Priority: 50'>>/etc/apt/preferences.d/kali.pref"

sudo apt install -y aptitude 
sudo apt update

#Install Packages from tools.txt

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Check if the file exists
if [ ! -f "tools.txt" ]; then
    printf "${RED}Error: tools.txt not found!${NC}\n"
    exit 1
fi

# Update package lists
printf "Updating package lists...\n"
sudo apt-get update 

# Read the file and install packages
while read -r package; do
    if [ -n "$package" ]; then
        printf "Checking %-20s" "${YELLOW}${package}${NC}"

        # Check if the package is available
        if apt-cache show "$package"; then
            printf "Installing %-20s" "${YELLOW}${package}${NC}"
            if sudo apt-get install -y "$package"; then
                # Double-check if the package is actually installed
                if dpkg -l | grep -q "^ii  $package "; then
                    printf "${GREEN} [OK]${NC}\n"
                else
                    printf "${RED} [Failed - Not found after install attempt]${NC}\n"
                fi
            else
                printf "${RED} [Failed - Installation error]${NC}\n"
            fi
        else
            printf "${RED} [Failed - Package not found in repositories]${NC}\n"
        fi
    fi
done < tools.txt

printf "${GREEN}Installation process completed.${NC}\n"

#Enable Terminal Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias ls='ls --color=auto'

#Install Snap
sudo apt install snapd -y
sudo snap install core 
sudo systemctl start snapd

#Wordlists
sudo mkdir /wordlists
sudo git clone https://github.com/danielmiessler/SecLists.git /wordlists/SecLists
sudo chown -R $USER:$USER /wordlists/SecLists
echo 'export PATH="$PATH:/wordlists/SecLists"' >> ~/.bashrc
source ~/.bashrc

#Install Go
sudo wget https://go.dev/dl/go1.23.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.23.2.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
source ~/.profile
go version

#Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

#Install WPScan
sudo apt install -y ruby-full
sudo gem install wpscan

#Install Rustscan
sudo snap install rustscan 

#install httpx
sudo snap install httpx

#Install Caido
sudo wget https://caido.download/releases/v0.42.0/caido-desktop-v0.42.0-linux-x86_64.deb
sudo dpkg -i caido-desktop-v0.42.0-linux-x86_64.deb 

#Install Nuclei
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

echo "Installation process completed."


