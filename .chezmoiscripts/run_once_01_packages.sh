#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update -qq

sudo apt-get install -y \
  build-essential \
  curl \
  git \
  zsh \
  tmux \
  fzf \
  ripgrep \
  bat \
  neovim \
  cargo \
  unzip \
  wget

# eza is not in Ubuntu 24.04 apt — install via official apt repo
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc \
  | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" \
  | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt-get update -qq
sudo apt-get install -y eza

# On Ubuntu, bat binary is named batcat — symlink so aliases work
if command -v batcat &>/dev/null && ! command -v bat &>/dev/null; then
  mkdir -p "$HOME/.local/bin"
  ln -sf /usr/bin/batcat "$HOME/.local/bin/bat"
fi
