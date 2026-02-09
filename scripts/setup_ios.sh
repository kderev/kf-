#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
target_dir="${1:-$repo_root/platform/ios/love}"

if [[ -d "$target_dir/.git" ]]; then
  echo "LÖVE iOS source already present at $target_dir"
  exit 0
fi

echo "Cloning LÖVE iOS source into $target_dir"
git clone --depth 1 https://github.com/love2d/love.git "$target_dir"
git -C "$target_dir" submodule update --init --recursive

echo "Done. Open $target_dir/platform/xcode/ios/love.xcodeproj in Xcode."
