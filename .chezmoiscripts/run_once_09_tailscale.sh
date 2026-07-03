#!/usr/bin/env bash
set -euo pipefail

if command -v tailscale &>/dev/null; then
  echo "Tailscale already installed: $(tailscale --version | head -1)"
  exit 0
fi

curl -fsSL https://tailscale.com/install.sh | sh

echo "Tailscale installed. Run 'sudo tailscale up' to join your tailnet."
