# AI Development Rules

## General

- Preserve existing user changes and inspect the repository before editing.
- Do not use destructive commands or remove data without explicit authorization.
- Prefer small, reviewable changes over large rewrites.
- Keep the application buildable after each meaningful change.
- Do not invent external API behavior; verify official documentation when needed.

## Flutter Architecture

- Target Android and Windows from the same Flutter codebase.
- Keep database, networking, parsing, health checks, and presentation in separate layers.
- Do not place network calls or SQL statements directly inside reusable widgets.
- Use explicit migrations for every database schema change.
- Keep list views paginated and avoid loading unbounded proxy records into memory.

## Sources and Validation

- Store direct TXT links and GitHub repository sources in `source_files`.
- Validate a source before saving it by default, but allow the user to disable validation when the network is unavailable.
- Never download unbounded files or recursively scan a repository without limits.
- Treat all downloaded content as untrusted text.
- Deduplicate proxies using a stable fingerprint based on normalized proxy credentials.

## Proxy Health Checks

- Treat TCP reachability and protocol handshake success as different statuses.
- Store check history separately from the current proxy state.
- Run checks with bounded concurrency, timeouts, and cancellation support.
- Apply retention settings only during an explicit cleanup operation or a controlled update cycle.

## Localization and UX

- Support Persian and English.
- Use RTL for Persian and LTR for English.
- Default language and theme to the operating system.
- Keep all user-facing strings localizable; do not hard-code language-specific text in business logic.
- Follow Telegram-inspired blue visual styling without copying Telegram assets.

## Verification

- Run `flutter analyze` and relevant tests after changes.
- Verify Android and Windows builds before release claims.
- Report limitations clearly when a platform or network cannot be tested.
