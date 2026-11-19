#!/usr/bin/env bash
# Pull the latest content/theme from ../Portfolio into this GitHub Pages mirror.
# Files that differ on purpose for GitHub Pages are excluded (see list below).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PORTFOLIO="${1:-$ROOT/../Portfolio}"

[ -d "$PORTFOLIO/frontend/src" ] || { echo "Portfolio not found at $PORTFOLIO" >&2; exit 1; }

# Files kept with GitHub Pages-specific edits:
#   src/components/Footer.js   -> tools link points to /tools/ on *.github.io
#   public/tools/index.html    -> back link points to /
#   package.json               -> homepage + postbuild script
rsync -a --delete \
  --exclude 'components/Footer.js' \
  "$PORTFOLIO/frontend/src/" "$ROOT/frontend/src/"

rsync -a --delete \
  --exclude 'tools/' \
  --exclude 'typing.html' --exclude 'qr_generator/' --exclude 'cv-json/' --exclude 'talks/' \
  "$PORTFOLIO/frontend/public/" "$ROOT/frontend/public/"

rsync -a --delete \
  --exclude 'index.html' \
  "$PORTFOLIO/tools/" "$ROOT/frontend/public/tools/"


echo "Synced from $PORTFOLIO."
echo "Check by hand (not auto-synced): Footer.js, public/tools/index.html, package.json dependencies."
echo "Then: cd frontend && npm install && npm run build   (npm install keeps package-lock.json in sync; CI uses npm ci)"
