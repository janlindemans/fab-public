# Shape Onboarding · The Journey

A single-page zigzag strip of 132 screens from the Shape onboarding → checkout → download flow. Click any screen to open it full size.

## Structure

- **index.html** — The page (use as site root for one-click URL).
- **thumbs/** — Resized images (max 540px) for fast loading in the strip.
- **full/** — Full-size images; opened when you click a screen.

## Deploy (GitHub Pages)

1. Create a new repo and push this folder’s contents (so the repo root has `index.html`, `thumbs/`, `full/`, and this README).
2. **Settings → Pages →** Source: **Deploy from a branch** → Branch: **main** → **/ (root)**.
3. Your live link: `https://<username>.github.io/<repo-name>/`

No build step. Just commit and push.
