import 'package:flutter/material.dart';

import '../../theme/custom_themes.dart';

class SectionDivider extends StatelessWidget {
  final double spacing;
  const SectionDivider({super.key, this.spacing = AppSpacing.md});
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: spacing),
        child: const Divider(height: 1, color: AppColors.divider),
      );
}