#!/bin/bash

echo "=== Updating system ==="
apt update -y

echo "=== Installing Docker ==="
apt install -y docker.io docker-compose git

echo "=== Enable Docker ==="
systemctl start docker
systemctl enable docker

# Allow ubuntu to run docker
sudo usermod -aG docker ubuntu

echo "=== Cloning repo ==="
cd /home/ubuntu
git clone https://github.com/lucystevenson/tech515-Java-Spring-Boot-App.git
cd tech515-Java-Spring-Boot-App

echo "=== Starting containers ==="
docker-compose up -d

echo "=== Done ==="

