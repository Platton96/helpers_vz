---
description: Widget composition, BLoC structure, event/state shape, screen structure.
paths: ["**/*_bloc.dart","**/*_event.dart","**/*_state.dart","**/ui/**/*.dart","**/*_screen.dart"]
---

# Widget and BLoC Rules

## Screen Structure

Public `XxxScreen extends StatelessWidget` returns `BlocProvider(create: (context) => getIt<XxxBloc>(),
child: const _XxxView())`; the private `_XxxView` holds the layout. The provider lives in the screen
that owns the BLoC, never above it. An app-scoped BLoC (e.g. one that drives `MaterialApp.locale`)
is the only exception and is provided in `HelpersApp`. A static page with no state (`HomeScreen`
today) has no BLoC.

## Widget Structure

- **Private widget classes, never `Widget _buildX()` methods** — builder methods defeat rebuild
  optimization.
- Split a `build` over ~60 lines into private widget classes.
- **Reusable widgets MUST NOT read the BLoC** — they take data + callbacks. Only the screen's own
  view layer calls `context.read<XxxBloc>()`, and it calls it **inside** the callback
  (`onTap: () => context.read<XxxBloc>().add(...)`), never hoisted into a local above it.
- **No duplicate widgets** — parameterize one widget. Used by 2+ screens → move it to `ui_kit/`.
- **`Padding` MUST NOT be the root of a `build()`** — outer margins belong to the parent
  (`Column(spacing:)` or the call site). A screen's `Scaffold > body > Padding` is fine; that
  padding is the screen's own inset.
- A private widget that only forwards parameters to one existing widget adds nothing — inline it.

## Spacing and Layout

- Uniform gaps → `Row`/`Column`'s `spacing`, never `SizedBox` fillers or `Container(margin:)`.
- Sizes that differ per form factor come from a responsive helper in `ui_kit/` — never a bare
  `MediaQuery.of(context).size.width < n` check inside a leaf widget.
- **No `IntrinsicHeight`**, no hardcoded heights invented to make two states line up. Anchor on
  structure (`IndexedStack`, `Expanded`, `LayoutBuilder`).
- Hardcoded numbers are allowed only when they are literal design tokens.

## BLoC Structure

- **Extend `BaseBloc`** (`lib/ui/base_bloc.dart`), never `Bloc` directly; pass
  `CrashReportingService` to `super`. Don't write try/catch in handlers — override
  `handleException(event, emit, error)` when a failure must change the state. Fire-and-forget
  futures go through `runUnawaited`, never bare `unawaited`.
- **3 files:** `xxx_bloc.dart`, `xxx_event.dart`, `xxx_state.dart` under `ui/<screen>/bloc/`.
- Events: a `sealed class XxxEvent` with `final class` variants, named `Xxx<Thing><Verb>Event`
  (`HomeItemTappedEvent`). Const constructors.
- State: one `Equatable` class with `copyWith`. Add sealed variants only when the screen genuinely
  has loading/error modes.
- **Single `on<XxxEvent>` registration** routing through a `switch` over the sealed event type.
- **Handler naming:** `_handle<EventName>Event(emit, event)` — emit first, event always passed.
- Helpers come **after** the handlers.
- Derived values the UI reads are getters on the state. No VM/mapper layers — don't introduce one.
- **Constructor:** dependencies are initializing formals (`XxxBloc(this._repository, …)`), no
  `_x = x` initializer lists.
- Business logic that doesn't touch `emit` lives in a manager under `lib/managers/`, not as static
  helpers on the BLoC.

## State Access in Widgets

- **No `buildWhen` / `listenWhen`** — if you need one, the BLoC is doing too much.
- **No `context.read<Bloc>().state`** in a widget — state flows through `BlocBuilder` and down as
  parameters.
- **Sealed state → `switch` expression** in the builder, never an `if/else` chain.
- `setState` is allowed only for ephemeral local UI (an animation controller, a text field's clear
  button). Anything else goes through an event.

## Naming

| Type | Pattern |
|---|---|
| Screen | `HomeScreen` |
| Private view | `_HomeView` |
| Private widget | `_Header`, `_ItemList` |
| Shared widget | `AccentButton` |
