#!/usr/bin/env bash
set -euo pipefail

PROFILE_DEV="${HOME}/.cursor/profile-readme-tools"
mkdir -p "${PROFILE_DEV}"

if [[ ! -f "${PROFILE_DEV}/package.json" ]]; then
  npm init -y --prefix "${PROFILE_DEV}" >/dev/null
fi

npm install --prefix "${PROFILE_DEV}" \
  markdownlint-cli@0.43.0 \
  markdown-link-check@3.12.2

for bin in markdownlint markdown-link-check; do
  if [[ ! -e "/usr/local/bin/${bin}" ]]; then
    sudo ln -sf "${PROFILE_DEV}/node_modules/.bin/${bin}" "/usr/local/bin/${bin}"
  fi
done
