// ========================= BUTTONS =========================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/custom_themes.dart';

enum ButtonVariant { primary, secondary, outline }

enum ButtonSize { small, medium, large }

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final bool loading;
  final bool fullWidth;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  const CustomButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.loading = false,
    this.fullWidth = true,
    this.leadingIcon,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final (bg, fg, br) = switch (variant) {
      ButtonVariant.primary => (AppColors.primary, Colors.white, Colors.transparent),
      ButtonVariant.secondary => (AppColors.secondary, Colors.black, Colors.transparent),
      ButtonVariant.outline => (Colors.transparent, AppColors.text, AppColors.divider),
    };

    final EdgeInsets padding = switch (size) {
      ButtonSize.small => const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ButtonSize.medium => const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ButtonSize.large => const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    };

    final buttonChild = Row(
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leadingIcon != null && !loading) ...[
          Icon(leadingIcon, size: 18, color: fg),
          const SizedBox(width: 8),
        ],
        if (loading)
          SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2, color: fg),
          )
        else
          Flexible(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: fg,
                fontWeight: FontWeight.w700,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        if (trailingIcon != null && !loading) ...[
          const SizedBox(width: 8),
          Icon(trailingIcon, size: 18, color: fg),
        ],
      ],
    );

    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: fullWidth ? double.infinity : 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: AppRadius.med,
          border: Border.all(color: br),
          boxShadow: variant == ButtonVariant.outline ? [] : AppShadow.soft,
        ),
        child: InkWell(
          onTap: loading ? null : onPressed,
          borderRadius: AppRadius.med,
          child: Padding(padding: padding, child: buttonChild),
        ),
      ),
    );
  }
}