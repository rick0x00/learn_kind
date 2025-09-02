#!/bin/bash

apt update && apt install -y wget tar curl

echo "installing task"
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin

echo "Insstalling kubeval..."
cd /tmp/
wget https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz
tar xf kubeval-linux-amd64.tar.gz
mv kubeval /usr/local/bin
chmod +x /usr/local/bin/kubeval
