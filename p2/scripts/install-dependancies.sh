#!/bin/bash

# Wait for K3s to be ready
until [ -f /etc/rancher/k3s/k3s.yaml ]; do
  echo "Waiting for K3s to generate kubeconfig..."
  sleep 2
done

# Export config
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# Wait until kubectl works
until kubectl get nodes; do
  echo "Waiting for Kubernetes API to respond..."
  sleep 2
done

# Install Helm
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install -y helm

helm repo add traefik https://traefik.github.io/charts
helm repo update

kubectl delete job -n kube-system $(kubectl get jobs -n kube-system -o name | grep helm-install-traefik)

helm uninstall traefik -n kube-system
helm install traefik traefik/traefik -n kube-system

kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v3.3/docs/content/reference/dynamic-configuration/kubernetes-crd-definition-v1.yml
