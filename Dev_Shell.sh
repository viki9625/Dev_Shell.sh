#!/bin/bash

# Exit if any command fails
set -e

echo "🔧 Updating package list..."
sudo apt update

##############################
# Install Visual Studio Code
##############################
echo "📦 Installing VS Code..."
sudo apt install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
rm microsoft.gpg
sudo apt update
sudo apt install -y code

##############################
# Install MongoDB Compass
##############################
echo "🍃 Installing MongoDB Compass..."
wget -O mongodb-compass.deb https://downloads.mongodb.com/compass/mongodb-compass_1.41.4_amd64.deb
sudo apt install -y ./mongodb-compass.deb
rm mongodb-compass.deb

##############################
# Install Docker Engine
##############################
echo "🐳 Installing Docker..."
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    gpg --dearmor | \
    sudo tee /etc/apt/keyrings/docker.gpg > /dev/null

echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Add current user to docker group
sudo usermod -aG docker "$USER"

##############################
# Install Docker Compose v2
##############################
echo "📦 Installing Docker Compose v2..."
DOCKER_COMPOSE_VERSION="v2.27.0"
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64" \
    -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# Verify installation
echo "✅ Installed Versions:"
code --version | head -n 1
docker --version
docker compose version
mongodb-compass --version || echo "⚠️ Compass version command may not work via CLI"

echo "✅ Installation completed!"
echo "⚠️ Please reboot or log out/in to apply Docker group permissions."
