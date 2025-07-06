#!/usr/bin/env bash

trap "exit 128" INT
set -eux

export KUBECONFIG="/etc/rancher/k3s/k3s.yaml"
export K3S_KUBECONFIG_MODE="644"
export INSTALL_K3S_EXEC="--disable=metrics-server --node-name=aws --write-kubeconfig-mode=${K3S_KUBECONFIG_MODE}"

# TODO: Test with "sh -s - server" if this does not work.
curl -sfL https://get.k3s.io | sh -

k3s kubectl get node
