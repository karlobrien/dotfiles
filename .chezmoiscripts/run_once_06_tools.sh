#!/usr/bin/env bash
set -euo pipefail

# Install yazi from pre-built GitHub release binary (avoids cargo compile)
if [ ! -f "$HOME/.local/bin/yazi" ]; then
  ARCH=$(uname -m)
  case "$ARCH" in
    x86_64)  YAZI_ARCH="x86_64-unknown-linux-musl" ;;
    aarch64) YAZI_ARCH="aarch64-unknown-linux-musl" ;;
    *)       echo "Unsupported arch: $ARCH"; exit 1 ;;
  esac

  YAZI_VERSION=$(curl -sL https://api.github.com/repos/sxyazi/yazi/releases/latest \
    | python3 -c "import json,sys; print(json.load(sys.stdin)['tag_name'])")

  URL="https://github.com/sxyazi/yazi/releases/download/${YAZI_VERSION}/yazi-${YAZI_ARCH}.zip"

  curl -fsSL "$URL" -o /tmp/yazi.zip
  unzip -q /tmp/yazi.zip -d /tmp/yazi-extract
  mkdir -p "$HOME/.local/bin"
  mv /tmp/yazi-extract/yazi-${YAZI_ARCH}/yazi "$HOME/.local/bin/yazi"
  mv /tmp/yazi-extract/yazi-${YAZI_ARCH}/ya "$HOME/.local/bin/ya"
  rm -rf /tmp/yazi.zip /tmp/yazi-extract
fi

echo "Installed $($HOME/.local/bin/yazi --version)"
