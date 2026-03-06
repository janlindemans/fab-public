#!/usr/bin/env bash
# Run from shape-onboarding-journey/ to push changes to the live site.
# The repo is fab-public (parent folder); this script commits and pushes from there.

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

git add shape-onboarding-journey/
if git diff --cached --quiet 2>/dev/null; then
  echo "Nothing to commit (shape-onboarding-journey unchanged)."
  exit 0
fi
git commit -q -m "Update shape-onboarding-journey"
git push
echo ""
echo "Pushed. Live in 1–2 min: https://janlindemans.github.io/fab-public/shape-onboarding-journey/"
