#!/bin/bash

sudo yum update -y


sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
sudo yum -y install MariaDB-server galera-4 MariaDB-client MariaDB-shared MariaDB-backup MariaDB-common

sudo systemctl start mysql
sudo systemctl enable mysql


sudo yum -y module enable php:8.1

sudo yum module install -y php:8.1/common
sudo yum install -y php-mysqlnd

sudo systemctl start php-fpm
sudo systemctl enable php-fpm

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo yum -y install wget
HASH="$(wget -q -O - https://composer.github.io/installer.sig)"

sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer



sudo yum -y install vim
sudo yum -y install git
sudo yum -y install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo chown ec2-user:nginx /var/www/html -R
# echo "hello world" > index.html
# php -v >> index.html

### from new /var/www/html/ directory
### composer create-project drupal/recommended-project:10.0.3 .

#### finish drupal ready steps
# 
sudo chown billy_cloude_consulting:nginx /var/www/html/web/sites/default/files -R
sudo chmod 664 /var/www/html/web/sites/default/files -R

sudo cp /var/www/html/web/sites/default/default.settings.php /var/www/html/web/sites/default/settings.php
sudo chown billy_cloude_consulting:nginx /var/www/html/web/sites/default/settings.php
sudo chmod 777 /var/www/html/web/sites/default/settings.php

from /web directory

semanage fcontext -a -t httpd_sys_content_t "../web(/.*)?"
restorecon -R -v ../web

### mysql_secure_installation
