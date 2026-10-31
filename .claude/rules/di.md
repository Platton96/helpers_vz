---
description: get_it registration conventions for this project.
paths: ["**/di/**/*.dart","**/*_repository.dart","**/*_bloc.dart","**/*_service.dart"]
---

# Dependency Injection Rules

`lib/di/di.dart` is the **only** file that registers anything. `configureDependencies()` is async
and runs once from `main()` before `runApp`.

| Kind | Registration |
|---|---|
| Repository / service (shared) | `registerLazySingleton` |
| BLoC (screen-scoped) | `registerFactory` — a fresh instance per screen |

- **`injectable` is deliberately absent.** Registration is hand written; `build_runner` exists only
  for `freezed` models.
- **Constructor injection only**, stored in `final` private fields. No field injection, no
  service-locator lookups inside a class.
- **`getIt` is called from exactly one place in the UI:** the `BlocProvider(create:)` of a screen
  (plus `HelpersApp` for an app-scoped BLoC). A widget deeper in the tree never calls `getIt`.
- **Never `registerSingleton`** (eager) — `registerLazySingleton` is the default.
- Widget tests use `setUpTestApp()` from `test/helpers/test_app.dart` (`configureDependencies()`,
  `getIt.reset`). A test that needs a deterministic dependency constructs the BLoC directly or
  re-registers the dependency with a fake.
