# Title

## Setup

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
kubectl apply -f deploy/apps/flux-kustomization.yaml

# wait till pods are up and running
kubectl get pods -a

# connect to grafana
kubectl port-forward service/grafana 3000:3000

# Go to http://localhost:3000 in browser
```

## Setup Grafana annotations from Flux events

```bash

# create Service Account API token in Grafana UI with "Editor" role
# https://grafana.com/docs/grafana/latest/administration/service-accounts/

# set token variable
TOKEN=<service account api token>

# create k8s secret for the token
kubectl create secret generic grafana-token \
  --namespace flux-system \
  --from-literal token="${TOKEN}"

# deploy flux notifications

```

## Clean Up

```bash
k3d cluster delete --config k3d.yaml
```
