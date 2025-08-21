import 'package:flutter/material.dart';

import '../../theme/custom_themes.dart';
import '../base/custom_buttons.dart';

class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? ctaText;
  final VoidCallback? onCta;
  const EmptyStateWidget({super.key, this.icon = Icons.inbox, required this.title, required this.message, this.ctaText, this.onCta});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: AppColors.textMuted),
            const SizedBox(height: 12),
            Text(title, style: AppTextStyle.title),
            const SizedBox(height: 8),
            Text(message, style: AppTextStyle.caption, textAlign: TextAlign.center),
            if (ctaText != null && onCta != null) ...[
              const SizedBox(height: 16),
              CustomButton(label: ctaText!, onPressed: onCta),
            ]
          ],
        ),
      ),
    );
  }
}