#!/bin/bash

clear

#clears terminal window

echo "Creating an alias called random which generates 12 random characters and saving it to the text file password.txt and creating an environment variable called password"

alias random='echo "$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c12 | xargs echo)"'
random > password.txt
password=$(< password.txt)

echo "This is a basic shell script to begin installation of features you will need for this all to work."

echo "Begin by updating the System."

sudo apt-get -y update

sudo apt-get -y upgrade

echo "It begins by installing php5-redis and mcrypt extensions.  Mcrypt should already be on the system, but let's be sure.  Also installing Stunnel."

sudo apt-get install -y php5-redis php5-mcrypt stunnel4 php5-curl

echo "Also generating a SSL certificate for Redis."

sudo touch /etc/stunnel/stunnel.pem

echo "The following keys do not have a passphrase attached to avoid the problem of constantly typing in a password."

openssl genrsa -out key.pem 4096
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 -config openssl.cnf  \
-subj '/C=US/CN=c9.io/O=widgetCorp/ST=WidgetLand/OU=Tech/emailAddress=widgetCorp@example.com/L=Portland'

echo "Setting up the stunnel keys and setting up a redis-server conf."

sudo sh -c 'cat key.pem cert.pem > /etc/stunnel/stunnel.pem'
sudo sh -c 'touch /etc/stunnel/redis-server.conf'
sudo sh -c 'cat conf/redis-server.conf > /etc/stunnel/redis-server.conf'
sudo sh -c 'chmod 640 /etc/stunnel/private.pem'
sudo sh -c 'cat conf/stunnel4 > /etc/default/stunnel4'

echo "Starting Redis."

sudo service redis-server start
#sudo service redis-server restart

echo "Installing Grunt cli and Bower.  Node comes pre-installed."

npm install -g grunt-cli --save-dev

npm install -g bower --save-dev

echo "Installing Composer."

curl -sS https://getcomposer.org/installer | php

sudo mv composer.phar /usr/local/bin/composer

echo "Moving up one directory and installing all the files in the package.json"

cd ..

npm install

echo "Installing composer dependencies"

composer install

composer -g require "phing/phing:2.*"

echo "Installing bower dependencies"

bower install

echo "Installing scss-lint"

gem update --system
gem install scss-lint

echo "Running Grunt."

grunt

echo "Installing mailcatcher gem."

gem install mailcatcher

echo "Configuring PHP for mailcatcher."

echo "sendmail_path = /usr/bin/env $(which catchmail) -f test@local.dev" | sudo tee /etc/php5/mods-available/mailcatcher.ini

sudo php5enmod mailcatcher

sudo service apache2 reload

echo "All Done!"