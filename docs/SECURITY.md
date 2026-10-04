# Security Notes

The canonical vulnerability policy is in the repository root `SECURITY.md`.

Study Flow is local-first and does not require credentials for its core workflow. Browser permissions for camera, microphone and geolocation are disabled by the provided deployment headers. CI audits dependencies and scans the repository for common secret patterns.

The updater uses Git fast-forward-only operations and rejects dirty working trees. Dependency auto-update is constrained by package.json compatibility ranges; breaking major upgrades are not automatically forced.
