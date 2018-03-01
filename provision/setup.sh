#!/bin/sh
# Make sure to run this script under root privileges

# Make apt do things without interaction of human
export DEBIAN_FRONTEND=noninteractive

# Update sources list
echo "========================"
echo "Updating source list..."
echo "========================"
apt update -q
echo "====="
echo "DONE!"
echo "====="

# Install initial devtools
echo "========================"
echo "Installing initial devtools..."
echo "========================"
apt install -yq \
    curl \
    vim \
    git \
    tmux \
    python3 \
    python3-pip
    ca-certificates \
    apt-transport-https \
    software-properties-common
echo "====="
echo "DONE!"
echo "====="

# Add Dockers GPG key for the repository
echo "========================"
echo "Fetching docker repository's GPG key..."
echo "========================"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Add docker's repository
echo "========================"
echo "Adding docker's repository..."
echo "========================"
# echo 'deb [arch=amd64] https://download.docker.com/linux/ubuntu    xenial    stable' > /etc/apt/sources.list.d/additional-repositories.list
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo "====="
echo "DONE!"
echo "====="

# Update sources list to fetch docker-ce from docker repository
echo "========================"
echo "Updating source list..."
echo "========================"
apt update -q
echo "====="
echo "DONE!"
echo "====="

# Install docker-ce
echo "========================"
echo "Installing docker..."
echo "========================"
apt install -yq docker-ce
usermod -aG docker vagrant
echo "====="
echo "DONE!"
echo "====="

# Upgrade pip
echo "========================"
echo "Upgrading pip to latest version..."
echo "========================"
pip3 install -U pip
echo "====="
echo "DONE!"
echo "====="

# Install python packages through pip
echo "========================"
echo "Installing docker-compose"
echo "========================"
pip install docker-compose
echo "====="
echo "DONE!"
echo "====="
