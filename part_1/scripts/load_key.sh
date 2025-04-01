#! /bin/bash

mkdir ~/.ssh
chmod 0700 ~/.ssh
wget https://raw.githubusercontent.com/hashicorp/vagrant/main/keys/vagrant.pub -O ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys
