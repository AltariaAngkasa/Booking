import 'package:flutter/material.dart';

import '../../theme/custom_themes.dart';

class SnackbarService {
  static void show(BuildContext context, String message, {SnackType type = SnackType.info}) {
    final bg = switch (type) {
      SnackType.success => AppColors.success,
      SnackType.error => AppColors.error,
      SnackType.info => AppColors.info,
    };
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: bg,
      ),
    );
  }
}

enum SnackType { success, error, info }