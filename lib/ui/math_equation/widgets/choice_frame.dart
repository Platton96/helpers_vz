import 'package:flutter/material.dart';
import 'package:helpers_vz/ui_kit/app_colors.dart';

class ChoiceFrame extends StatelessWidget {
  static const double _borderWidth = 2;
  static const BorderRadius _borderRadius = .all(.circular(14));

  final bool isHighlighted;
  final Widget child;

  const ChoiceFrame({super.key, required this.isHighlighted, required this.child});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: _borderRadius,
          border: .all(color: isHighlighted ? AppColors.answer : AppColors.outline, width: _borderWidth),
        ),
        child: ClipRRect(borderRadius: _borderRadius, child: child),
      );
}
