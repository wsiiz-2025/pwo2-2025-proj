#!/usr/bin/env bash

trap "exit 128" INT
set -eux

export TERM="dumb"

export KUBECONFIG="/etc/rancher/k3s/k3s.yaml"
export K3S_KUBECONFIG_MODE="644"
export INSTALL_K3S_EXEC="--disable='metrics-server,traefik' --node-name=aws --write-kubeconfig-mode=${K3S_KUBECONFIG_MODE}"

# Install K3S.
curl -sfL https://get.k3s.io | sh -

k3s kubectl get node

# Install Helm.
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install system packages
apt update
apt install -y python3-pip
