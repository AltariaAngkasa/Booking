import 'package:flutter/material.dart';

import '../../theme/custom_themes.dart';
import '../base/custom_buttons.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const ErrorStateWidget({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 56, color: AppColors.error),
          const SizedBox(height: 10),
          Text(message, style: AppTextStyle.body, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          CustomButton(label: 'Coba Lagi', onPressed: onRetry),
        ],
      ),
    );
  }
}