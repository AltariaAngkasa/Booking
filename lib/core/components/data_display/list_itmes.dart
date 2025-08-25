import 'package:flutter/material.dart';

import '../../theme/custom_themes.dart';

class ListItemComponent extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? leadingImageUrl;
  final IconData? leadingIcon;
  final Widget? trailing;
  final VoidCallback? onTap;

  const ListItemComponent({
    super.key,
    required this.title,
    this.subtitle,
    this.leadingImageUrl,
    this.leadingIcon,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget? leading;
    if (leadingImageUrl != null && leadingImageUrl!.isNotEmpty) {
      leading = CircleAvatar(
        radius: 22,
        backgroundColor: AppColors.divider,
        child: ClipOval(
          child: Image.network(
            leadingImageUrl!,
            width: 44,
            height: 44,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
          ),
        ),
      );
      // If using cached_network_image:
      // leading = CircleAvatar(
      //   radius: 22,
      //   backgroundColor: AppColors.divider,
      //   backgroundImage: CachedNetworkImageProvider(leadingImageUrl!),
      // );
    } else if (leadingIcon != null) {
      leading = CircleAvatar(
        radius: 22,
        backgroundColor: AppColors.surfaceAlt,
        child: Icon(leadingIcon, color: AppColors.text),
      );
    }

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      leading: leading,
      title: Text(title, style: AppTextStyle.body.copyWith(fontWeight: FontWeight.w700)),
      subtitle: subtitle != null ? Text(subtitle!, style: AppTextStyle.caption) : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}