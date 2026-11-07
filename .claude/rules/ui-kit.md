---
description: Design tokens and `ui_kit/` widgets.
paths: ["**/ui_kit/**/*.dart","**/ui/**/*.dart","**/*_screen.dart"]
---

# UI Kit Rules

All colors, text styles and reusable widgets live in `lib/ui_kit/`. Check it before writing a new
widget — the piece probably exists.

| Need | Use |
|---|---|
| Color | `AppColors.*` |
| Text style | `AppTextStyles.*` (`google_fonts`) |
| App theme | `AppTheme.dark` |
| Bordered quiz card | `QuizCard` |
| Show answer / next question buttons | `QuizActions` |
| Dashed lines, label chips, text on a canvas | `CanvasDrawing` extension |

Add a row to this table whenever a new shared widget lands in `ui_kit/`.

## Rules

- **MUST NOT hardcode a `Color(0x…)` or a `TextStyle` in a widget.** Add the token to `AppColors` /
  `AppTextStyles` and reference it. The one carve-out is a token that exists only inside a single
  `ui_kit` widget's own implementation.
- **Alpha colors are written as hex with an alpha byte** (`Color(0x24D4483F)`) so they stay
  `const`. Don't call `.withValues()` to build a static token.
- Design values, once a design exists, are copied exactly from the source — never eyeballed.
- Widgets in `ui_kit/` never read a BLoC and never import `di.dart`.
