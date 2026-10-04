# CLI Reference

Run commands as `npm run sf -- <command>`.

- `setup` — install dependencies, apply compatible dependency updates, build and verify.
- `start` — check for a Study Flow source update, then start the local development server.
- `doctor` — report runtime, OS, Git, npm and dependency status.
- `check-update` — compare the local Git revision with `origin/main`.
- `update` — safely fast-forward the application, refresh dependencies and rebuild.
- `packages` — report outdated npm packages.
- `update-packages` — apply compatible updates allowed by package.json and rebuild.
- `version` — print the installed Study Flow version.

The updater refuses to overwrite a dirty Git working tree.
