#!/bin/bash
set -e

# Author: Kirill Borovoy

# Installing Docker
apt update -y && apt upgrade -y
apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
apt update -y
apt install docker-ce
systemctl enable docker
systemctl restart docker

# Installing Docker Compose
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

# Install git
apt install git

# Downloading source code and run app
mkdir -p /opt/app/ && cd /opt/app && git clone https://github.com/KIRILL-BARAVOI/test-devops.git
cd test-devops && sed -i 's/NODE_ENV=.*/NODE_ENV=${env}"/g' docker-compose.yml && \
docker-compose up -d