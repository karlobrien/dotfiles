#!/usr/bin/env bash
set -euo pipefail

if command -v claude &>/dev/null; then
  echo "Claude Code already installed: $(claude --version)"
  exit 0
fi

npm install -g @anthropic-ai/claude-code

echo "Installed Claude Code $(claude --version)"
