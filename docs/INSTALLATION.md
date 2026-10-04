# Installation Guide

Study Flow supports Windows, Linux and macOS. Node.js 20+, npm and Git are required.

## Automatic prerequisite setup

The platform installers check for required runtime tools before installing Study Flow. Windows uses winget when available. Debian/Ubuntu Linux uses apt. macOS uses Homebrew when available. If no supported package manager is available, installation stops with an SF error instead of running an unknown installer.

## Windows

Run the documented PowerShell one-command installer from the README. The installer verifies prerequisites, clones or safely updates Study Flow, installs npm dependencies, builds the production application and runs diagnostics.

## Linux and macOS

Run the shell installer documented in the README. Administrator approval may be requested by the OS package manager when a prerequisite is missing.

## Manual setup

Clone the repository, enter the project directory, run `npm install`, then `npm run build` and `npm run sf -- doctor`.
