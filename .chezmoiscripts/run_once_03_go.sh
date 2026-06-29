#!/usr/bin/env bash
set -euo pipefail

# Skip if Go is already installed
if [ -f /usr/local/go/bin/go ]; then
  echo "Go already installed at $(cat /usr/local/go/bin/go version)"
  exit 0
fi

# Fetch latest stable Go version from go.dev API
GO_VERSION=$(curl -sL 'https://go.dev/dl/?mode=json' \
  | python3 -c "import json,sys; print(json.load(sys.stdin)[0]['version'])")

ARCH=$(dpkg --print-architecture)
case "$ARCH" in
  amd64) GO_ARCH="amd64" ;;
  arm64) GO_ARCH="arm64" ;;
  *) echo "Unsupported arch: $ARCH"; exit 1 ;;
esac

TARBALL="${GO_VERSION}.linux-${GO_ARCH}.tar.gz"
URL="https://go.dev/dl/${TARBALL}"

cd /tmp
curl -LO "$URL"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "$TARBALL"
rm "$TARBALL"

echo "Installed $(/usr/local/go/bin/go version)"
