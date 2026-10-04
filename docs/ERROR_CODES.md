# Study Flow Error Codes

| Code | Meaning | Fix |
|---|---|---|
| SF-1001 | Node.js missing/unsupported | Install Node.js 20 or newer |
| SF-1002 | npm missing | Repair/reinstall Node.js |
| SF-2001 | Setup/dependency installation failed | Check npm output and network |
| SF-2002 | Production build failed | Run `npm run build` and inspect the first error |
| SF-3001 | Git missing | Install Git and reopen the terminal |
| SF-3002 | Local changes block safe update | Commit or stash local changes |
| SF-3003 | Update/network check unavailable | Check internet; app can still run locally |
| SF-3004 | Update failed | Run `npm run sf -- doctor`, then retry |
| SF-9000 | Unexpected runtime/CLI failure | Run doctor and report the command output |
