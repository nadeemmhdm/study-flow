#!/usr/bin/env sh
set -eu
REPO="https://github.com/nadeemmhdm/study-flow.git"
DIR="${STUDY_FLOW_HOME:-$HOME/.study-flow}"
command -v git >/dev/null 2>&1 || { echo "[SF-3001] Git is required."; exit 1; }
command -v node >/dev/null 2>&1 || { echo "[SF-1001] Node.js 20+ is required."; exit 1; }
if [ -d "$DIR/.git" ]; then cd "$DIR"; git pull --ff-only origin main || { echo "[SF-3004] Update failed."; exit 1; }; else git clone "$REPO" "$DIR" || { echo "[SF-2001] Clone failed."; exit 1; }; cd "$DIR"; fi
npm install || { echo "[SF-2001] Dependency install failed."; exit 1; }
npm run build || { echo "[SF-2002] Build failed."; exit 1; }
echo "Study Flow ready at $DIR"
echo "Start: cd \"$DIR\" && npm run sf -- start"
