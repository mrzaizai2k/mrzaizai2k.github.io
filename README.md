# mrzaizai2k.github.io

GitHub Pages mirror of my portfolio, [mrzaizai2k.com](https://mrzaizai2k.com) ([source](https://github.com/mrzaizai2k/Portfolio)).
It uses the same React app, theme and content, and stays online even when the self-hosted site is down.

🌐 **Live**: https://mrzaizai2k.github.io

## Pages

| Path | What |
|---|---|
| `/` | Home |
| `/about` | About, tech stack, GitHub calendar |
| `/project` | Projects |
| `/resume` | Resume (PDF) |
| `/tools/` | Small browser tools: [QR generator](https://mrzaizai2k.github.io/tools/qr/), [Typing](https://mrzaizai2k.github.io/tools/typing/) |

Old links (`/typing.html`, `/qr_generator`, `/cv-json`, `/talks`) redirect to the new pages.

## Run locally

```bash
cd frontend
npm install
npm start          # dev server at http://localhost:3000
npm run build      # production build in frontend/build
```

## Deploy

Every push to `master` runs [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml), which builds `frontend/` and publishes it to GitHub Pages.

One-time setup on GitHub:
- **Settings → Pages → Source = GitHub Actions**
- (Optional) repo secret `REACT_APP_GA4_MEASUREMENT_ID` for Google Analytics

GitHub Pages has no SPA fallback, so [`scripts/postbuild.js`](scripts/postbuild.js) copies `index.html` to every route and to `404.html`.

## Sync with Portfolio

The [Portfolio](https://github.com/mrzaizai2k/Portfolio) repo is the source of truth. After updating content there:

```bash
./scripts/sync-from-portfolio.sh   # defaults to ../Portfolio
cd frontend && npm install && npm run build
git add -A && git commit -m "sync from Portfolio" && git push
```

These files have GitHub Pages-specific edits and are not overwritten by the sync:
- `frontend/src/components/Footer.js`: the tools link goes to `/tools/` on github.io
- `frontend/public/tools/index.html`: the back link goes to `/`
- `frontend/package.json`: `homepage` and the `postbuild` script

## Credit

Based on [Soumyajit's portfolio](https://soumyajit.vercel.app/).
