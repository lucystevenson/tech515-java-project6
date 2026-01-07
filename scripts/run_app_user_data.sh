#!/bin/bash

# --------------------------
# Update & Upgrade system
# --------------------------

echo update sources list...
sudo apt update
echo Done!
echo

echo Upgrade ...
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo Done!
echo

# --------------------------
# Install Java & Maven
# --------------------------

echo  Install Java 17...
sudo DEBIAN_FRONTEND=noninteractive apt install -y openjdk-17-jdk
echo Done!
echo


echo Install Maven ...
sudo DEBIAN_FRONTEND=noninteractive apt install -y maven
echo Done!
echo

# --------------------------
# Install Nginx - needed to configure reverse proxy
# --------------------------

echo "Installing Nginx..."
sudo DEBIAN_FRONTEND=noninteractive apt install -y nginx
echo "Done!"
echo

# --------------------------
# Configure reverse proxy
# --------------------------

echo "Configure Nginx reverse proxy..."
# Backup default only if not already backed up
if [ ! -f /etc/nginx/sites-available/default.bak ]; then
    sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
fi

sudo tee /etc/nginx/sites-available/default > /dev/null <<'EOF'
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOF
echo Done!
echo

echo Apply changes to nginx config ...
sudo systemctl restart nginx 
echo Done!
echo

# --------------------------
# Set environment variables
# --------------------------
# v1 PRIVATE DB IP - 172.31.61.173
# uncomment for connecting DB
echo Set/append environment variables in /etc/environment ...
sudo tee -a /etc/environment > /dev/null <<EOF
DB_HOST=jdbc:mysql://172.31.61.173:3306/library 
DB_USER=lucysteve
DB_PASS=strongpassword
EOF
export $(grep -v '^#' /etc/environment | xargs)
echo Done!
echo

# --------------------------
# Clone repo
# --------------------------

mkdir -p /home/ubuntu
git clone https://github.com/lucystevenson/tech515-Java-Spring-Boot-App.git /home/ubuntu/repo
chown -R ubuntu:ubuntu /home/ubuntu/repo

# --------------------------
# Install MYSQL
# --------------------------

echo "Installing MySQL client..."
sudo DEBIAN_FRONTEND=noninteractive apt install -y mysql-client
echo "Done!"
echo


# --------------------------
# Seed the database
# --------------------------

echo "Seeding database from library.sql..."
mysql -h 172.31.61.173 -u"$DB_USER" -p"$DB_PASS" library < /home/ubuntu/repo/library.sql
echo "Done!"
echo

# --------------------------
# Build & run the app
# --------------------------

echo cd into folder ...
cd /home/ubuntu/repo/LibraryProject2
echo "In app directory: $(pwd)"
echo Done!
echo

echo "=== Stopping App if running ==="
mvn spring-boot:stop || echo "App not running, skipping stop."
echo "Done!"
echo

echo "=== Building App ==="
mvn clean package
echo "Done!"
echo

echo  Run app ...
nohup mvn spring-boot:run > /home/ubuntu/app.log 2>&1 &

# mvn spring-boot:start # to run in background
echo Done!
echo


