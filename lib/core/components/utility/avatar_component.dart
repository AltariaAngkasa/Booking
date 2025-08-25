import 'package:flutter/material.dart';

import '../../theme/custom_themes.dart';

class Avatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final String? initials;
  const Avatar({super.key, this.imageUrl, this.size = 40, this.initials});

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      child = ClipOval(
        child: Image.network(
          imageUrl!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _fallback(),
        ),
      );
      // With cached_network_image:
      // child = ClipOval(child: CachedNetworkImage(imageUrl: imageUrl!, width: size, height: size, fit: BoxFit.cover));
    } else {
      child = _fallback();
    }

    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: child,
    );
  }

  Widget _fallback() => Container(
        color: AppColors.surfaceAlt,
        alignment: Alignment.center,
        child: Text((initials ?? 'U').toUpperCase(), style: AppTextStyle.body),
      );
}
