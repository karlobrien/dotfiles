#!/usr/bin/env bash
set -euo pipefail

# yazi file manager
if [ ! -f "$HOME/.cargo/bin/yazi" ]; then
  cargo install --locked yazi-fm yazi-cli
fi

echo "Installed $($HOME/.cargo/bin/yazi --version)"
