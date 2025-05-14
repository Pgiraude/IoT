#!/bin/bash

SERVER_IP="192.168.56.110"
IFACE="eth1"

sudo apt update
sudo apt install -y curl
curl -sfL https://get.k3s.io | \
K3S_KUBECONFIG_MODE="644"\
INSTALL_K3S_EXEC="--node-ip ${SERVER_IP} --advertise-address ${SERVER_IP} --flannel-iface ${IFACE}" sh -

cp /var/lib/rancher/k3s/server/node-token /vagrant/node-token

echo "${SERVER_IP} app1.com app2.com" | sudo tee -a /etc/hosts