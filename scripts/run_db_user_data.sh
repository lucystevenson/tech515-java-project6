#!/bin/bash

# --------------------------
# Update & Upgrade system
# --------------------------

echo "Updating sources..."
sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "Done"

# --------------------------
# Install MYSQL
# --------------------------

echo "Installing MySQL server..." # This ensures MySQL root will use auth_socket, which lets sudo mysql work without password.
sudo apt remove --purge mysql-server mysql-client mysql-common -y
sudo rm -rf /etc/mysql /var/lib/mysql
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt install -y mysql-server
echo "Done"

echo "Securing MySQL installation..." # this ensures a password login
sudo mysql -u root --socket=/var/run/mysqld/mysqld.sock -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'rootpassword'; FLUSH PRIVILEGES;"
echo "Done"

echo "Creating app database and user..."
sudo mysql -u root -p'rootpassword' -e "
CREATE DATABASE library;
CREATE USER 'lucysteve'@'%' IDENTIFIED BY 'strongpassword';
GRANT ALL PRIVILEGES ON library.* TO 'lucysteve'@'%';
FLUSH PRIVILEGES;
"
echo "Done"


echo "Allowing remote connections..."
sudo sed -i "s/^bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql
echo "MySQL ready and listening on 0.0.0.0:3306"
echo "Done"


PRIVATE DB IP - 172.31.61.173