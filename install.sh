#!/usr/bin/env sh
set -eu
REPO="https://github.com/nadeemmhdm/study-flow.git"
DIR="${STUDY_FLOW_HOME:-$HOME/.study-flow}"
fail(){ echo "[$1] $2"; exit 1; }
have(){ command -v "$1" >/dev/null 2>&1; }
install_prereqs(){
  if have node && have npm && have git; then return; fi
  echo "Study Flow: checking required packages..."
  if have apt-get; then
    echo "Using apt to install missing prerequisites..."
    sudo apt-get update || fail SF-1101 "Package index update failed."
    have git || sudo apt-get install -y git || fail SF-1102 "Git installation failed."
    if ! have node || ! have npm; then sudo apt-get install -y nodejs npm || fail SF-1103 "Node.js/npm installation failed."; fi
  elif have brew; then
    have git || brew install git || fail SF-1102 "Git installation failed."
    if ! have node || ! have npm; then brew install node || fail SF-1103 "Node.js installation failed."; fi
  else fail SF-1100 "Missing prerequisites and no supported package manager found. Install Node.js 20+, npm and Git."; fi
}
install_prereqs
MAJOR="$(node -p "process.versions.node.split('.')[0]")"
[ "$MAJOR" -ge 20 ] || fail SF-1001 "Node.js 20+ is required. Current: $(node -v)"
echo "Prerequisites ready: Node $(node -v), npm $(npm -v), Git $(git --version)"
if [ -d "$DIR/.git" ]; then cd "$DIR"; [ -z "$(git status --porcelain)" ] || fail SF-3002 "Local changes detected; refusing automatic update."; git pull --ff-only origin main || fail SF-3004 "Update failed."; else git clone "$REPO" "$DIR" || fail SF-2001 "Clone failed."; cd "$DIR"; fi
npm install || fail SF-2001 "Dependency installation failed."
npm run build || fail SF-2002 "Build failed."
npm run sf -- doctor || fail SF-9000 "Doctor failed."
echo "Study Flow ready at $DIR"
echo "Start: cd \"$DIR\" && npm run sf -- start"
