---
description: Repository and model conventions — pure Dart, injected non-determinism, freezed models.
paths: ["**/repositories/**/*.dart","**/models/**/*.dart"]
---

# Repository and Model Rules

## Repositories

- **Pure Dart, no Flutter import.** A repository never touches `BuildContext`, widgets or
  `material.dart`.
- **Synchronous unless something genuinely awaits.** A fake future forces a loading state the UI
  does not need.
- **Inject non-determinism, don't reach for it.** A `Random`, clock or id generator is a
  constructor parameter so a test can pass a fixed one.
- Platform side effects (launchers, plugins) are constructor-injected so tests never hit the
  platform.
- A repository with no state gets a `const` constructor.
- No networking layer exists yet. Adding one (HTTP client, DTOs, serialization) is a decision for
  the user — don't add it without being asked.

## Models

- `freezed` classes in `lib/models/`: `@freezed abstract class XxxModel with _$XxxModel` and a
  `const factory`; a getter needs `const XxxModel._();`. Run `dart run build_runner build` after a
  change and commit the `.freezed.dart` file.
- **Models carry data, not behavior.** Logic over a model lives in a repository or a manager.
- **No UI in a model.** Colors or labels for a model value live in `ui_kit/` or the localization
  extension.
- **No duplicate models.** Don't wrap an existing type in a new one that adds no invariant.
