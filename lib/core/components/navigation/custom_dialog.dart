import 'package:flutter/material.dart';

import '../../theme/custom_themes.dart';
import '../base/custom_buttons.dart';

Future<bool?> showConfirmDialog(BuildContext context, {
  required String title,
  required String message,
  String cancelText = 'Batal',
  String okText = 'Ya',
}) {
  return showDialog<bool>(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: AppColors.surfaceAlt,
      title: Text(title, style: AppTextStyle.title),
      content: Text(message, style: AppTextStyle.body),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context, false), child: Text(cancelText)),
        CustomButton(label: okText, onPressed: () => Navigator.pop(context, true), fullWidth: false),
      ],
    ),
  );
}

Future<void> showInfoDialog(BuildContext context, {
  required String title,
  required String message,
  String okText = 'OK',
}) async {
  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: AppColors.surfaceAlt,
      title: Text(title, style: AppTextStyle.title),
      content: Text(message, style: AppTextStyle.body),
      actions: [CustomButton(label: okText, onPressed: () => Navigator.pop(context), fullWidth: false)],
    ),
  );
}