#!/usr/bin/env bash
# Validates the GitHub profile README (links + markdown style).
set -euo pipefail
cd /workspace

echo "==> Checking external links in README.md"
markdown-link-check README.md

echo "==> Running markdownlint on README.md"
markdownlint README.md

echo "==> Profile README verification passed."
