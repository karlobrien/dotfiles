#!/usr/bin/env bash
set -euo pipefail

# yazi file manager
if ! command -v yazi &>/dev/null; then
  cargo install --locked yazi-fm yazi-cli
fi

echo "Installed $(yazi --version)"
