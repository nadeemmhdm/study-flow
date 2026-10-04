# Troubleshooting

Start with:

```bash
npm run sf -- doctor
```

If setup fails, identify the displayed `SF-xxxx` code and check `ERROR_CODES.md`.

For dependency problems, run `npm run sf -- packages`, then `npm run sf -- update-packages`. If a production build fails after an update, inspect the first TypeScript or Vite error before changing additional packages.

For source update failures, confirm internet access, Git access and a clean working tree with `git status`.
