# Personal Claude Code Guidelines

## Communication

- Keep responses brief but include rationale for key decisions and trade-offs.
- Don't summarize what you just did — the diff speaks for itself.

## Languages & Stack

- **Primary:** TypeScript/JavaScript, Go, Python
- **Application types:** fullstack web apps, backend API services, CLIs
- **Infrastructure:** Docker/containerization, Ansible, Terraform
- **JS/TS package manager:** pnpm

## Architecture

- Prefer **hexagonal / ports and adapters** architecture.
- **Always abstract and inject side-effects** (I/O, databases, external APIs, clocks, etc.). Side-effects belong behind interfaces/ports, not embedded in business logic.

## Development Approach

- **Test-driven development:** write the test first, then make it pass.
- **Prefer real dependencies over mocks** in tests (e.g., testcontainers, in-memory implementations). Only mock when a real dependency is impractical (e.g., third-party paid APIs, irreversible operations).
- Error handling: handle likely, expected errors explicitly. Let unexpected errors bubble up — don't swallow them silently.

## Code Style

- **Follow existing project patterns** — don't override them with these personal preferences. These are defaults for new code and new projects.
- Follow **idiomatic style for the language** being used. Language-specific preferences below only apply to their respective languages.
- **Organize by feature/domain** — co-locate related files rather than grouping by layer.
- Comments only for non-obvious *why*, not *what*. Code should be self-documenting.
- When editing code that doesn't follow these preferences: refactor if trivial, otherwise flag it and move on.

### TypeScript / JavaScript

- **Named exports only** — no default exports.
- **Functional style:** prefer functions over classes, favor immutability, write pure functions where practical.
- `strict: true`, no `any`, no `@ts-ignore`, explicit return types.
- Prefer `type` over `interface` — use `interface` only when declaration merging or `extends` is needed.
- **No enums** — use `as const` objects with union types instead.
- **async/await always** — no `.then()` chains.

### Go

- **Idiomatic Go error handling** — `if err != nil`, wrap with `fmt.Errorf` / `errors.Join`.
- **Define interfaces at the consumer**, not alongside the implementation.
- **Standard library `testing` package** with table-driven tests — no test frameworks.

### Python

- **Always type-hint** — all function signatures, return types, and key variables.
- **Dataclasses + functions** — use dataclasses/NamedTuples for data, plain functions for behavior. Avoid class-heavy OOP.

## Dependencies & Changes

- **Never add a new dependency without asking first.**
- Make implementation decisions autonomously, but check before making big structural changes.
- Only change what was asked — don't refactor or "improve" surrounding code beyond the rule above.

## Git & PRs

- Conventional commits: `feat:`, `fix:`, `chore:`, `refactor:`, `test:`, `docs:`, etc.
- Branch naming: `type/short-description` (e.g., `feat/add-user-auth`, `fix/login-redirect`).
- **Small, focused PRs** — one concern per PR.
- **Git hooks:** projects should have pre-commit hooks that apply formatting fixes. Use **Lefthook** to manage git hooks unless another tool (husky, lint-staged, etc.) is already in place.

## Shell & Task Runners

- Prefer existing task runners (just, make, npm scripts) over raw commands.

## Documentation

- Don't create docs files (READMEs, ADRs, etc.) unprompted. Flag when one would be helpful.

## Security

- Proactively flag security concerns **even when unrelated to the current task**. Don't fix them silently — raise them.
