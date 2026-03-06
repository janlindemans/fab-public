#!/usr/bin/env bash
# Run this once to put the site on GitHub and turn on the live link.
# You need: GitHub account, and GitHub CLI (gh) logged in on this Mac.

set -e
REPO_NAME="shape-onboarding-journey"

echo "Step 1: Preparing files..."
if [[ ! -d .git ]]; then
  git init -q
  git branch -M main
fi
git add .gitignore index.html README.md START-HERE.md publish-to-github.sh full/ thumbs/
git status --short
if git diff --cached --quiet 2>/dev/null; then
  echo "   Nothing new to commit (already up to date)."
else
  git commit -q -m "Shape Onboarding · The Journey — zigzag strip, thumbs + full-size"
  echo "   Committed."
fi

echo ""
echo "Step 2: Creating GitHub repo and pushing..."
if git remote get-url origin 2>/dev/null; then
  echo "   Remote 'origin' already set. Pushing..."
  git push -u origin main
else
  gh repo create "$REPO_NAME" --public --source=. --remote=origin --push --description "Shape onboarding → checkout → download — zigzag strip of 132 screens"
  echo "   Repo created and pushed."
fi

echo ""
echo "Step 3: Turning on GitHub Pages..."
OWNER=$(gh api user -q .login 2>/dev/null || true)
if [[ -z "$OWNER" ]]; then
  OWNER=$(gh repo view --json owner -q .owner.login 2>/dev/null || true)
fi
if [[ -n "$OWNER" ]]; then
  echo '{"source":{"branch":"main","path":"/"}}' | gh api -X POST "repos/${OWNER}/${REPO_NAME}/pages" --input - 2>/dev/null && echo "   Pages enabled." || echo "   (If Pages didn’t enable, do it once in the repo: Settings → Pages → Deploy from branch → main → / (root))"
else
  echo "   Please enable Pages yourself: open the repo on GitHub → Settings → Pages → Source: Deploy from a branch → Branch: main → / (root) → Save."
fi

echo ""
echo "Done. Your site will be at:"
echo "   https://${OWNER:-YOUR_USERNAME}.github.io/${REPO_NAME}/"
echo ""
echo "It may take 1–2 minutes to go live. Share that link with anyone."
