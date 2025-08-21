import 'package:flutter/material.dart';

import '../../theme/custom_themes.dart';

class BadgeChip extends StatelessWidget {
  final String label;
  final Color? color;
  const BadgeChip({super.key, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: (color ?? AppColors.primary).withValues(alpha:0.15),
        border: Border.all(color: color ?? AppColors.primary),
        borderRadius: BorderRadius.circular(AppRadius.chip),
      ),
      child: Text(label, style: AppTextStyle.caption.copyWith(color: color ?? AppColors.primary, fontWeight: FontWeight.w700)),
    );
  }
}