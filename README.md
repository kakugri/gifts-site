# GIFTS

Public static site for the Generative Identity Forensics and Trust System (GIFTS).

## Live URL

Canonical public URL:

- `https://kakugri.dev/gifts-site/`

The root domain `https://kakugri.dev/` is currently treated as a separate root page.

This repository publishes the GIFTS site at the `/gifts-site/` path.

## Contents

- public HTML pages
- local PDF and prototype assets
- a simple static-link preflight script
- a GitHub Pages deployment workflow

## Local preview

Open `index.html` directly for a quick look, or serve the directory with any simple static file
server.

## Preflight check

Run:

```bash
bash check-static-links.sh
```

## GitHub Pages

This repository is prepared for GitHub Pages with:

- `.github/workflows/deploy-pages.yml`

Before first deployment, enable `Pages -> GitHub Actions` in the repository settings.

If the domain strategy changes later, update the canonical tags, sitemap, robots file, and social
card text together so the published metadata stays aligned with the live URL.
