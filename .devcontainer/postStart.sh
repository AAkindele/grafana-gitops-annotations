#!/bin/bash

# add host entry for registry
echo "127.0.0.1 k3d-registry.localhost" | sudo tee -a /etc/hosts
