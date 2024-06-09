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

# deploy apps
kubectl apply -f deploy

```

## Clean Up

```bash
k3d cluster delete --config k3d.yaml
```
