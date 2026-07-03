#!/usr/bin/env bash
set -euo pipefail

if command -v node &>/dev/null; then
  echo "Node.js already installed: $(node --version)"
  exit 0
fi

# Install Node.js LTS via NodeSource
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "Installed Node.js $(node --version), npm $(npm --version)"
