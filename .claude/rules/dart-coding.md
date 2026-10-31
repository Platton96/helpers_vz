---
description: Universal Dart conventions for this repo — comments, ordering, control flow, idioms. No `paths:` key, so it loads every session; keep it lean.
---

# Dart Rules

## Comments

**MUST NOT write any comment** unless the user explicitly asks for one. Names and types are the
documentation. Applies to every file the repo ships — Dart, YAML, config. No WHAT, no WHY, no
section-divider banners. In tests the `test()` description is the comment; the body carries no `//`.

## Class Member Ordering

1. static constants/fields → 2. instance fields (all above the constructor) → 3. constructor(s) →
4. getters (public → private) → 5. public methods (`initState` → `build` → `dispose` for `State`) →
6. private methods. Public declarations come before private ones at file level too.

## Idioms

- **Dot shorthand** for enums, named constructors and static factories where the type is inferable.
- **`EdgeInsets`**: most concise constructor — `.all(n)` → `.symmetric(...)` → `.only(...)`.
- **Switch expressions** over `if/else` chains when producing a value; destructure at the match
  site. Sealed types get no `default`/`_` arm, so a new variant is a compile error.
- **`firstOrNull` / `lastOrNull`**, never `.first` / `.last` on a possibly-empty iterable.
- **No `!`** (non-null assertion) — promote with `if case` or pattern matching.
- **No `late final`** for fields derived from constructor parameters — use the initializer list.
- **Expression bodies** (`=>`) for single-expression methods and getters.
- **`map` / `where`** over collection-`for` when transforming or filtering a collection. Inside a
  widget's `children:`, an inline `for (final item in items)` is fine and preferred for readability.
- **No single-use wrapper variables** — inline an expression used once, unless inlining hurts
  readability or it captures a value before an async gap.
- **Never read record fields positionally** (`pair.$1`) — destructure at the boundary, or use a
  small private class when the shape has more than two parts.
- **Tear-offs** over lambdas when the callback forwards the same arguments unchanged.
- **`ValueSetter<T>` / `ValueChanged<T>` / `VoidCallback`** instead of explicit function types.
- **Omit redundant type annotations** on `final`/`var`/`const` when the initializer states the type.

## Naming

- **Spell identifiers out in full** — no `cfg`, `mgr`, `btn`. Universal abbreviations (`id`, `url`,
  `qr`) are fine.
- **Every `bool` gets an `is` / `has` / `can` / `should` prefix** — `isRevealed`, `isCompact`.
  Never stack prefixes.
- **Enums, not magic strings**, for finite value sets. UI-only mappings on an enum live in an
  extension (`ui_kit/`), never on the model itself.

## Equality

Models and BLoC states are value types: a model is a `freezed` class (generated `==` /
`hashCode` / `copyWith`), a state extends `Equatable` and lists every field in `props`. A field missing from `props` silently kills
the rebuild that field should trigger.
