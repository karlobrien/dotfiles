#!/usr/bin/env bash
set -euo pipefail

# Install Rust via rustup — apt cargo is too old for yazi
if [ ! -f "$HOME/.cargo/bin/rustc" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
fi

source "$HOME/.cargo/env"

# yazi file manager
if [ ! -f "$HOME/.cargo/bin/yazi" ]; then
  cargo install --locked yazi-fm yazi-cli
fi

echo "Installed $($HOME/.cargo/bin/yazi --version)"
