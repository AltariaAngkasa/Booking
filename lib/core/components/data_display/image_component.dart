import 'package:flutter/material.dart';

import '../../theme/custom_themes.dart';

class NetworkImageComponent extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  const NetworkImageComponent({super.key, required this.url, this.width = double.infinity, this.height = 160, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: AppColors.surfaceAlt, borderRadius: AppRadius.med),
        child: const Icon(Icons.image_not_supported),
      );
    }

    // Switch to CachedNetworkImage for better caching if dependency added.
    return ClipRRect(
      borderRadius: AppRadius.med,
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/placeholder.png',
        image: url,
        width: width,
        height: height,
        fit: fit,
        imageErrorBuilder: (_, __, ___) => Container(
          width: width,
          height: height,
          color: AppColors.surfaceAlt,
          alignment: Alignment.center,
          child: const Icon(Icons.broken_image),
        ),
      ),
    );
  }
}