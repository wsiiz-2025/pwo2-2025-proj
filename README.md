# PWO2 2025 Proj

## Create infra via Terraform

```shell
cd tf
terraform init
terraform apply -var "public_key=$(< ~/.ssh/id_ed25519.pub)"
terraform output
```

## Use K8S via SSH

```shell
ssh -i ~/.ssh/id_ed25519 ${REMOTE_HOST} env KUBECONFIG="/etc/rancher/k3s/k3s.yaml" kubectl get pods -A
```
