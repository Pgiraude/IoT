#!/bin/bash

SERVER_IP="192.168.56.110"
IFACE="enp0s8"
TOKEN=$(cat /vagrant/node-token)

sudo apt update
sudo apt install -y curl

curl -sfL https://get.k3s.io | \
  K3S_KUBECONFIG_MODE="644" \
  INSTALL_K3S_EXEC="--flannel-iface ${IFACE}" \
  K3S_URL="https://${SERVER_IP}:6443" \
  K3S_TOKEN="${TOKEN}" \
  sh -