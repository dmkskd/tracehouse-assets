#!/usr/bin/env bash
# Download the Grafana plugin source zip from a GitHub Release
# and publish it to GitHub Pages.
#
# Usage: ./publish-source.sh v0.11.0
set -euo pipefail

TAG="${1:?Usage: $0 <tag>}"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RELEASE_URL="https://github.com/dmkskd/tracehouse/releases/download/${TAG}/dmkskd-tracehouse-app-source.zip"
DEST_DIR="$REPO_ROOT/releases/${TAG}"

echo "==> Downloading source zip for ${TAG}"
mkdir -p "$DEST_DIR"
curl -fSL -o "$DEST_DIR/dmkskd-tracehouse-app-source.zip" "$RELEASE_URL"

echo "==> Committing"
cd "$REPO_ROOT"
git add "releases/${TAG}/dmkskd-tracehouse-app-source.zip"
git commit -m "Add source zip for ${TAG}"
git push

echo "==> Done"
echo "URL: https://dmkskd.github.io/tracehouse-assets/releases/${TAG}/dmkskd-tracehouse-app-source.zip"
