#!/usr/bin/env bash
set -euo pipefail

# Set npm global prefix to user dir so no sudo needed
npm config set prefix "$HOME/.local"

if command -v claude &>/dev/null; then
  echo "Claude Code already installed: $(claude --version)"
  exit 0
fi

npm install -g @anthropic-ai/claude-code

echo "Installed Claude Code $(claude --version)"
