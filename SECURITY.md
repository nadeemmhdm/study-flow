# Security Policy

## Supported version
Study Flow 1.x receives security fixes.

## Local-first design
Study plans and progress are stored in the browser. Study Flow does not require a backend, account, API key, analytics service, or telemetry.

## Update safety
The CLI updater refuses to update a dirty working tree and uses Git fast-forward-only updates. It never executes release-note text or overwrites uncommitted work.

## Reporting
Do not publish secrets or sensitive data in public issues. Report a suspected vulnerability privately through GitHub's security reporting features when available.

## Dependency policy
CI checks production dependencies for high-severity vulnerabilities on every push and pull request.
