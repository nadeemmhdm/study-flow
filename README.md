# Study Flow

> A local-first, animated learning-path builder for turning any topic into a focused, trackable study flow.

Study Flow is a React + TypeScript application designed for fast self-directed learning. Enter a topic, choose the desired depth, and Study Flow creates a structured sequence of learning stages with objectives, practice tasks, progress tracking and saved history.

## Highlights

- Structured plans with 1–10 learning stages
- Lesson objectives, practice tasks and research shortcuts
- Animated, responsive interface powered by Framer Motion
- Local-first persistence — no account or backend required
- Completion tracking and reusable learning history
- JSON export for portable study plans
- Cross-platform CLI for setup, diagnostics and updates
- Safe update checks that protect uncommitted work
- Stable `SF-xxxx` diagnostic error codes
- CI verification on Windows, Linux and macOS
- Dependency auditing and repository secret-pattern scanning

## Requirements

- Node.js 20 or newer
- npm
- Git

## One-command installation

### Windows PowerShell

```powershell
irm https://raw.githubusercontent.com/nadeemmhdm/study-flow/main/install.ps1 | iex
```

### Linux / macOS

```bash
curl -fsSL https://raw.githubusercontent.com/nadeemmhdm/study-flow/main/install.sh | sh
```

Review remote install scripts before piping them to a shell if that is part of your security policy.

## CLI

```bash
npm run sf -- setup
npm run sf -- start
npm run sf -- doctor
npm run sf -- check-update
npm run sf -- update
npm run sf -- version
```

`start` attempts an update check and continues locally if the network is unavailable. `update` requires a clean Git working tree and uses fast-forward-only pulls.

## Development

```bash
git clone https://github.com/nadeemmhdm/study-flow.git
cd study-flow
npm install
npm run dev
```

Production verification:

```bash
npm run build
npm run sf -- doctor
npm audit --omit=dev --audit-level=high
```

## Architecture

The UI is implemented in React and TypeScript with Vite. Learning plans, history and completion state are stored locally in the browser. The CLI is a dependency-light Node.js module responsible for setup diagnostics and safe source updates.

## Security & privacy

Study Flow does not require an account, analytics service, telemetry endpoint or API key for its core workflow. See [SECURITY.md](SECURITY.md) for the supported-version policy, updater safeguards and vulnerability-reporting guidance.

## Error codes

Operational failures use searchable `SF-xxxx` identifiers. See [docs/ERROR_CODES.md](docs/ERROR_CODES.md) for meanings and remediation steps.

## Contributing

Bug fixes and focused improvements are welcome. Read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request.

## License

Released under the MIT License. See [LICENSE](LICENSE).

## Release

Current release line: **1.0.x**. Release notes are maintained in [CHANGELOG.md](CHANGELOG.md).
