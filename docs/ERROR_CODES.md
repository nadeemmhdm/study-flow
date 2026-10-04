# Study Flow Error Codes

Study Flow uses stable error identifiers so failures can be searched and diagnosed quickly.

| Code | Meaning | Recommended action |
|---|---|---|
| SF-1001 | Node.js is missing or unsupported | Install Node.js 20+ |
| SF-1002 | npm is unavailable | Repair or reinstall Node.js/npm |
| SF-1100 | Prerequisites missing and no supported package manager found | Install Node.js 20+, npm and Git manually |
| SF-1101 | OS package index update failed | Check network and package-manager permissions |
| SF-1102 | Automatic Git installation failed | Install Git manually and retry |
| SF-1103 | Automatic Node.js/npm installation failed | Install Node.js 20+ manually and retry |
| SF-1104 | Windows winget installation failed | Check winget/admin permissions or install manually |
| SF-2001 | Setup/dependency installation failed | Review npm output and network access |
| SF-2002 | Production build failed | Run `npm run build` and inspect the first error |
| SF-2101 | Outdated-package check unavailable | Check npm registry/network access |
| SF-2102 | Compatible package update or verification failed | Review npm output; restore dependency state if necessary |
| SF-3001 | Git is unavailable | Install Git |
| SF-3002 | Local changes block safe source update | Commit or stash local changes |
| SF-3003 | Update/network check unavailable | Check connectivity; local app can continue |
| SF-3004 | Source update failed | Run doctor and verify Git/network state |
| SF-4001 | Potential secret detected by CI | Remove/rotate the secret and inspect repository history |
| SF-9000 | Unexpected CLI/runtime failure | Run doctor and capture the command output |

## Diagnostic command

```bash
npm run sf -- doctor
```
