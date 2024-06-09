# Title

TODO: short description

## Setup

The repository has a devcontainer that is configured with the tools required to follow this sample. To follow along without the devcontainer, install the tools listed below.

- Docker - <https://docs.docker.com/get-docker/>
- k3d - <https://k3d.io/#installation>
- kubectl - <https://kubernetes.io/docs/tasks/tools/#kubectl>

TODO: prereq: fork repo and update `url` field in `flux-init/gotk-repo.yaml`.

## Purpose

TODO: longer description of the purpose of the repo

## Walkthrough

TODO: cleanup and provide context for commands

```bash

# create cluster
k3d cluster create --config k3d.yaml

# deploy prometheus operator
kubectl create -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.74.0/bundle.yaml

# build sample app
docker build \
  --file ./grafana-k6/Dockerfile \
  --tag k3d-registry.localhost:5000/k6-app \
  ./grafana-k6/

# push image
docker push k3d-registry.localhost:5000/k6-app

# deploy flux
kubectl apply -f flux-init/gotk-components.yaml
kubectl apply -f flux-init/gotk-repo.yaml
kubectl apply -f flux-init/gotk-sync.yaml

# deploy applications
kubectl apply -f deploy/flux-kustomization.yaml

# wait till pods are up and running
kubectl get pods -a

# connect to grafana
kubectl port-forward service/grafana 3000:3000

# Go to http://localhost:3000 in browser

# create Service Account API token in Grafana UI with "Editor" role
# https://grafana.com/docs/grafana/latest/administration/service-accounts/

# set token variable
TOKEN=<service account api token>

# create k8s secret for the token
kubectl create secret generic grafana-token \
  --from-literal token="${TOKEN}"

```

## Clean Up

```bash

k3d cluster delete --config k3d.yaml

```
