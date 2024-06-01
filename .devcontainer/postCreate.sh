#!/bin/bash

# download k3d
wget -q https://github.com/k3d-io/k3d/releases/download/v5.6.3/k3d-linux-amd64
sudo mv k3d-linux-amd64 /usr/local/bin/k3d
chmod u+x /usr/local/bin/k3d

# add host entry for registry
echo "127.0.0.1 k3d-registry.localhost" | sudo tee -a /etc/hosts
