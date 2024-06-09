#!/bin/bash

# download k3d
wget -q https://github.com/k3d-io/k3d/releases/download/v5.6.3/k3d-linux-amd64
sudo mv k3d-linux-amd64 /usr/local/bin/k3d
chmod u+x /usr/local/bin/k3d

# k9s
wget https://github.com/derailed/k9s/releases/download/v0.32.4/k9s_linux_amd64.deb
sudo apt install ./k9s_linux_amd64.deb
rm ./k9s_linux_amd64.deb

# flux
wget -q https://github.com/fluxcd/flux2/releases/download/v2.3.0/flux_2.3.0_linux_amd64.tar.gz
tar -zxf flux_2.3.0_linux_amd64.tar.gz
sudo mv flux /usr/local/bin/flux
rm flux_2.3.0_linux_amd64.tar.gz
# . <(flux completion bash)
