import 'package:flutter/material.dart';

import '../../theme/custom_themes.dart';

class CustomBottomNav extends StatelessWidget {
  final List<BottomNavItem> items;
  final int currentIndex;
  final void Function(int index) onTap;

  const CustomBottomNav({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: AppColors.surfaceAlt,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textMuted,
      items: [
        for (final it in items)
          BottomNavigationBarItem(icon: Icon(it.icon), label: it.label),
      ],
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
    );
  }
}

class BottomNavItem {
  final IconData icon;
  final String label;
  const BottomNavItem(this.icon, this.label);
}