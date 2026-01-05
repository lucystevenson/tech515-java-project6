#!/bin/bash

echo update sources list...
sudo apt update
echo Done!
echo

echo Upgrade ...
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo Done!
echo


echo  Install Java 17...
sudo DEBIAN_FRONTEND=noninteractive apt install -y openjdk-17-jdk
echo Done!
echo


echo Install Maven ...
sudo DEBIAN_FRONTEND=noninteractive apt install -y maven
echo Done!
echo

echo Git clone ...
git clone https://github.com/lucystevenson/tech515-Java-Spring-Boot-App.git repo
echo "Done!"
echo

echo cd into folder ...
cd repo/LibraryProject2/
echo "In app directory: $(pwd)"
echo Done!
echo

# uncomment for connecting DB
echo Set environment variables ...
sudo tee -a /etc/environment > /dev/null <<EOF
DB_HOST=jdbc:mysql://${DATABASE_IP}:3306/library
DB_USER=lucysteve
DB_PASS=strongpassword
EOF
echo Done!
echo

echo Reboot
source /etc/environment
echo Done!
echo

echo  Stop app ...
mvn spring-boot:stop
echo Done!
echo


echo  Run app ...
mvn spring-boot:run # to run in foreground
mvn spring-boot:start # to run in background
echo Done!
echo