#!/usr/bin/env bash
set -euo pipefail

if command -v node &>/dev/null; then
  echo "Node.js already installed: $(node --version)"
  exit 0
fi

if command -v pacman &>/dev/null; then
  sudo pacman -S --noconfirm --needed nodejs npm
elif command -v apt-get &>/dev/null; then
  # Install Node.js LTS via NodeSource
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt-get install -y nodejs
else
  echo "Unsupported package manager — install Node.js manually"
  exit 1
fi

echo "Installed Node.js $(node --version), npm $(npm --version)"
