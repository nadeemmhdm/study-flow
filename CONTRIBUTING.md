# Contributing to Study Flow

Thanks for improving Study Flow.

## Development workflow

1. Fork or branch from `main`.
2. Install dependencies with `npm install`.
3. Keep changes focused and avoid committing secrets or generated dependency folders.
4. Run `npm run build`, `npm run sf -- doctor`, and the dependency audit before submitting.
5. Open a pull request describing the problem, solution and verification performed.

## Code expectations

- Keep TypeScript type-safe.
- Preserve keyboard usability and reduced-motion support.
- Keep the core application local-first.
- New network integrations must be explicit and documented.
- Never log or commit credentials, tokens or private user data.
- Add or update an `SF-xxxx` code when introducing a diagnosable CLI failure mode.

## Security

Do not disclose suspected vulnerabilities in a public issue. Follow `SECURITY.md`.

## Commit style

Prefer concise conventional prefixes such as `feat:`, `fix:`, `docs:`, `security:`, `test:` and `build:`.
