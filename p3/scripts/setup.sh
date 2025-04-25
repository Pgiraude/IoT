#!/bin/bash

#Create cluster
echo "\033[0;32m *** Creating a cluster name fakouyatS *** \033[0m"
k3d cluster create fakouyatS

# creating namespaces
echo "\033[0;32m *** Creating argocd and dev namespaces *** \033[0m"
kubectl create namespace argocd
kubectl create namespace dev

# install argo CD
echo "\033[0;32m *** Installing argo CD *** \033[0m"
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# apply manifests
echo "\033[0;32m *** apply kubernetes manifests *** \033[0m"
kubectl apply -f ./infra/dev.deployment.yaml
kubectl apply -f ./infra/dev.service.yaml -n dev


# install argo CD CLI
# echo "\033[0;32m *** Install argo CD CLI *** \033[0m"
# curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
# sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
# rm argocd-linux-amd64

# port forwarding
# kubectl port-forward svc/argocd-server -n argocd 8080:443
# kubectl port-forward svc/rock-paper-scissors-app-service -n dev 8888:80





