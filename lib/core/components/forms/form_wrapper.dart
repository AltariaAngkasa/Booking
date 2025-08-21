import 'package:flutter/material.dart';

import '../../theme/custom_themes.dart';
import '../base/custom_buttons.dart';

class FormWrapper extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Widget child;
  final Future<void> Function()? onSubmit;
  final String? submitText;

  const FormWrapper({super.key, required this.formKey, required this.child, this.onSubmit, this.submitText});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          child,
          const SizedBox(height: AppSpacing.md),
          if (onSubmit != null)
            CustomButton(
              label: submitText ?? 'Submit',
              onPressed: () async {
                final valid = formKey.currentState?.validate() ?? false;
                if (valid) await onSubmit!.call();
              },
            ),
        ],
      ),
    );
  }
}
