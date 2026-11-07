import 'package:flutter/material.dart';
import 'package:helpers_vz/ui_kit/app_colors.dart';

class QuizCard extends StatelessWidget {
  static const double _borderWidth = 2;
  static const BorderRadius _borderRadius = .all(.circular(20));

  final Widget child;

  const QuizCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: _borderRadius,
          border: .all(color: AppColors.accent, width: _borderWidth),
        ),
        child: Padding(padding: const .all(20), child: child),
      );
}
