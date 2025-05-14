#!/bin/bash

sudo kubectl delete all --all
sudo kubectl delete namespace argocd
sudo kubectl delete namespace dev
k3d cluster delete fakouyatS