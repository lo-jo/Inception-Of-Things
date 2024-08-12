#!/bin/bash

yellow=$'\033[0;33m'
reset=$'\033[0m'

echo "${yellow}=> Creating namespaces ...${reset}"
sudo kubectl create namespace argocd
sudo kubectl create namespace dev

echo "${yellow}=> Launching ArgoCD ...${reset}"
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "${yellow}=> Creating app ...${reset}"
sudo kubectl apply -f ./confs/dev-app.yaml -n argocd

sudo kubectl wait -n argocd --for=condition=Ready pods --all --timeout=-1s

sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

echo ""

sudo kubectl port-forward svc/argocd-server -n argocd 8080:443
