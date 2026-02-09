#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$repo_root"
mkdir -p build

rm -f build/game.love
(
  cd game
  zip -9 -r ../build/game.love . -x "*.DS_Store"
)

echo "Built build/game.love"
