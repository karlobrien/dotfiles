#!/usr/bin/env bash
set -euo pipefail

if [ ! -f "$HOME/.dotnet/dotnet" ]; then
  curl -fsSL https://dot.net/v1/dotnet-install.sh -o /tmp/dotnet-install.sh
  chmod +x /tmp/dotnet-install.sh
  /tmp/dotnet-install.sh --channel 9.0 --install-dir "$HOME/.dotnet"
  rm /tmp/dotnet-install.sh
fi

echo "Installed $($HOME/.dotnet/dotnet --version)"
