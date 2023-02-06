#!/bin/bash

sudo yum update -y
sudo yum install -y php php-cli php-xml php-gd php-pdo
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo yum -y install wget
HASH="$(wget -q -O - https://composer.github.io/installer.sig)"

sudo systemctl start php-fpm
sudo systemctl enable php-fpm

sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
sudo yum -y install MariaDB-server galera-4 MariaDB-client MariaDB-shared MariaDB-backup MariaDB-common

sudo systemctl start mysql
sudo systemctl enable mysql

sudo yum -y install vim
sudo yum -y install git
sudo yum -y install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo chown ec2-user:nginx /var/www/html -R
echo "hello world" > index.html
php -v >> index.html

### composer create-project drupal/recommended-project:10.0.3 "install-dir"

### mysql_secure_installation
