# Update System

Study Flow has two update layers.

## Application updates

`check-update` fetches `origin/main` and compares revisions. `update` requires a clean working tree and performs a fast-forward-only pull. It then refreshes dependencies and verifies a production build.

## Package updates

The CLI uses `npm outdated --json` to detect outdated project dependencies. `npm update` applies updates that remain compatible with the version ranges declared in package.json. Major or otherwise incompatible releases are intentionally not forced automatically because they may introduce breaking changes.

Use `npm run sf -- packages` to inspect status and `npm run sf -- update-packages` to apply compatible updates.

## Failure safety

An update failure returns an SF diagnostic code. Source updates never intentionally discard uncommitted local work.
