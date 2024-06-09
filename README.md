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
kubectl apply -f deploy/flux-kustomization.yaml

```

## Clean Up

```bash
k3d cluster delete --config k3d.yaml
```
