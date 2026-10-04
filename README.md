# Study Flow

Local-first visual learning planner built with React, TypeScript and Vite.

## One-command install

### Windows PowerShell
```powershell
irm https://raw.githubusercontent.com/nadeemmhdm/study-flow/main/install.ps1 | iex
```

### Linux / macOS
```bash
curl -fsSL https://raw.githubusercontent.com/nadeemmhdm/study-flow/main/install.sh | sh
```

Requires Node.js 20+ and Git.

## Commands

```bash
npm run sf -- setup
npm run sf -- start
npm run sf -- doctor
npm run sf -- check-update
npm run sf -- update
npm run sf -- version
```

`start` performs a non-blocking update check and continues offline if the check is unavailable. `update` only fast-forwards a clean Git checkout; it refuses to overwrite local changes.

## Learning features

- Topic and optional learning goal
- 1–10 structured learning stages
- Lesson objectives and practice tasks
- Completion tracking and progress meter
- Saved learning history
- Local browser persistence
- JSON plan export
- Research shortcuts
- Responsive desktop/mobile UI

## Diagnostics

Errors use stable `SF-xxxx` codes. See `docs/ERROR_CODES.md`.

## Verification

CI runs the production TypeScript/Vite build, CLI doctor and high-severity production dependency audit on Windows, Linux and macOS.
