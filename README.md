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
  --tag k3d-registry.localhost:5000/k6-app:delay-v1 \
  ./grafana-k6/

# push image
docker push k3d-registry.localhost:5000/k6-app:delay-v1

# deploy flux
# https://github.com/fluxcd/flux2/discussions/1499
# https://fluxcd.io/flux/migration/flux-v1-migration/#flux-read-only-mode

kubectl apply -f https://github.com/fluxcd/flux2/releases/download/v2.3.0/install.yaml

```

## Clean Up

```bash
k3d cluster delete --config k3d.yaml
```
