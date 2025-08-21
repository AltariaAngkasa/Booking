// ========================= TEXT FIELD =========================
import 'package:flutter/material.dart';

import '../../theme/custom_themes.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final String? initialValue;
  final TextInputType keyboardType;
  final bool obscure;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final int maxLines;
  final bool enabled;

  const CustomTextField({
    super.key,
    this.controller,
    this.hint,
    this.label,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.validator,
    this.prefix,
    this.suffix,
    this.maxLines = 1,
    this.enabled = true,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController(text: widget.initialValue);
  String? _error;
  bool _obscure = false;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscure;
  }

  String? _runValidate(String? value) {
    if (widget.validator == null) return null;
    final err = widget.validator!(value);
    setState(() => _error = err);
    return err;
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: AppRadius.med,
      borderSide: const BorderSide(color: AppColors.divider),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: AppRadius.med,
      borderSide: const BorderSide(color: AppColors.error),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: AppTextStyle.caption),
          const SizedBox(height: 6),
        ],
        TextFormField(
          controller: _controller,
          keyboardType: widget.keyboardType,
          obscureText: _obscure,
          validator: _runValidate,
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          style: AppTextStyle.body,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: AppTextStyle.caption,
            prefixIcon: widget.prefix,
            suffixIcon: widget.obscure
                ? IconButton(
                    onPressed: () => setState(() => _obscure = !_obscure),
                    icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                  )
                : widget.suffix,
            filled: true,
            fillColor: AppColors.surfaceAlt,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: border,
            enabledBorder: border,
            focusedBorder: border.copyWith(
                borderSide:
                    const BorderSide(color: AppColors.primary, width: 1.2)),
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            errorText: _error,
          ),
          onChanged: (v) {
            if (_error != null) _runValidate(v);
          },
        ),
      ],
    );
  }
}
