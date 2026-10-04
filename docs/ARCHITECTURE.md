# Architecture

Study Flow is a local-first single-page application.

## Web application

React renders the interface, TypeScript provides static type checking, Vite handles development and production builds, and Framer Motion provides interface transitions. The learning engine creates structured stages and lesson metadata without requiring a remote service.

## Persistence

Learning plans, completion state and history are stored in browser localStorage. JSON export provides a portable copy of a plan.

## CLI

The Node.js CLI provides environment diagnostics, application update checks, dependency maintenance and local startup. It deliberately keeps update operations separate from browser data.

## CI

GitHub Actions verifies builds and diagnostics across Windows, Linux and macOS and performs dependency/security checks.
