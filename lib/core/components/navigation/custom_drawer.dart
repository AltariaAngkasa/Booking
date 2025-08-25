// ========================= NAVIGATION & LAYOUT =========================
import 'package:flutter/material.dart';

import '../../theme/custom_themes.dart';

class CustomDrawer extends StatelessWidget {
  final List<DrawerItem> items;
  final int selectedIndex;
  final void Function(int index) onSelect;
  final Widget? header;

  const CustomDrawer({
    super.key,
    required this.items,
    required this.onSelect,
    this.selectedIndex = 0,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Column(
          children: [
            header ?? const SizedBox.shrink(),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (c, i) {
                  final it = items[i];
                  final selected = i == selectedIndex;
                  return ListTile(
                    leading: Icon(it.icon, color: selected ? AppColors.primary : AppColors.text),
                    title: Text(it.label,
                        style: AppTextStyle.body.copyWith(
                          color: selected ? AppColors.primary : AppColors.text,
                          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                        )),
                    onTap: () => onSelect(i),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem {
  final IconData icon;
  final String label;
  const DrawerItem(this.icon, this.label);
}
