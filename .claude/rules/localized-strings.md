---
description: Where user-visible strings live and how they are composed.
paths: ["**/localizations/**/*.dart","**/localizations/arb/*.arb","**/ui/**/*.dart","**/ui_kit/**/*.dart"]
---

# Localized Strings Rules

Every user-visible string lives in the ARB files under `lib/localizations/arb/` — `app_ru.arb` is
the template, `app_en.arb` must carry the same keys. `flutter gen-l10n` (also run by `flutter pub
get`) writes `AppStrings` into `lib/localizations/generated/`; never edit those files by hand. A
string literal in a widget is a bug, including single words and punctuation-only labels.

- Read strings with `AppStrings.of(context).x`; tests use `lookupAppStrings(Locale('ru'))`
  (`russianStrings` / `englishStrings` in `test/helpers/test_app.dart`).
- **One entry per whole sentence**, never a sentence assembled from several fragments — word
  order, inflection and particles differ per language. A variable part is an ARB placeholder.
- A string that varies by enum gets a method with a `switch` expression in a `LocalizedEnums`
  extension (`lib/localizations/localized_enums.dart`) — not an ARB `select`, a map, or a lookup in
  the widget.
- **UPPERCASE in the design is an uppercase ARB value or `.toUpperCase()` at the call site** — pick
  one per string and be consistent.
