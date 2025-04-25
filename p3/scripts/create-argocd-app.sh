#!/bin/bash

ADMIN_USER=admin
ADMIN_PASSWD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo) 
ARGOCD_SERVER=argocd.local:8080

argocd login $ARGOCD_SERVER --username $ADMIN_USER --password $ADMIN_PASSWD

argocd app create -f ./argocd/argocd.app.yaml

argocd app sync rock-paper-scissors-app
