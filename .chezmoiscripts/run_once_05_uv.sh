#!/usr/bin/env bash
set -euo pipefail

if [ ! -f "$HOME/.local/bin/uv" ]; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

echo "Installed $($HOME/.local/bin/uv --version)"
