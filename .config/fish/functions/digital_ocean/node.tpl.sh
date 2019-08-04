#!/bin/bash

##
## after install
##

# user for manual ssh
adduser asd 
# add sudo group
usermod -aG sudo asd

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
