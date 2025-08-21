// ========================= APP BAR =========================

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;
  final Widget? leading;
  final Color? bgColor;
  final double? tHeight;
  final double? size;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions = const [],
    this.leading,
    this.bgColor,
    this.tHeight,
    this.size,
  });

  @override
  Size get preferredSize => Size.fromHeight(size ?? 56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: bgColor ?? Colors.transparent,
      leading: leading,
      title: title,
      actions: actions,
      toolbarHeight: tHeight,
    );
  }
}