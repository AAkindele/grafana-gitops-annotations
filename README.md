```bash
# create cluster
k3d cluster create --config k3d.yaml

# build sample app
docker build \
  --file ./grafana-k6-app/Dockerfile \
  --tag k3d-registry.localhost:5000/k6-app:delay-v1 \
  ./grafana-k6-app/

# push image
docker push k3d-registry.localhost:5000/k6-app:delay-v1

# deploy
kubectl apply -f deploy

# clean up
k3d cluster delete --config k3d.yaml
```
