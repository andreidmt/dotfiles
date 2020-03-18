#!/bin/bash

##
## after install
##

apt install build-essentials

# user for manual ssh
adduser asd 
# add to sudo group
usermod -aG sudo asd
# remove from sudo group
deluser asd sudo

# user for CI deployments
adduser ci

# If server is setup to ssh with root.
# While as root, sync .ssh of root user to "asd" user in order to ssh with 
# "asd" and not directly as root
rsync --archive --chown=asd:asd ~/.ssh /home/asd

# web server
apt install nginx

# ssl certificates
add-apt-repository ppa:certbot/certbot
apt install python-certbot-nginx
certbot --nginx -d example.com -d www.example.com

##
## nginx unit
##

curl -O https://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key

# Ubuntu 18.04 - for others see https://unit.nginx.org/installation/#ubuntu
# Append to /etc/apt/sources.list

deb https://packages.nginx.org/unit/ubuntu/ bionic unit
deb-src https://packages.nginx.org/unit/ubuntu/ bionic unit

#
apt install unit unit-dev 

##
## NodeJS 10
##

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt install nodejs

##
## nginx unit config
##

curl -X PUT --data-binary '{
  "listeners": {
      "*:8080": {
          "pass": "applications/cms-master"
      }
  },
  "applications": {
      "cms-master": {
          "type": "external",
          "user": "asd",
          "group": "asd",
          "working_directory": "/var/www/api.asd14.xyz/cms/master/",
          "executable": "index.js"
      }
  }
  }' --unix-socket /run/control.unit.sock http://localhost/config
