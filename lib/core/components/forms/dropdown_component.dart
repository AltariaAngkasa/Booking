import 'package:flutter/material.dart';

import '../../theme/custom_themes.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final T? value;
  final String hint;
  final String Function(T) labelBuilder;
  final void Function(T?) onChanged;
  final bool searchable;

  const CustomDropdown({super.key, required this.items, required this.value, required this.hint, required this.labelBuilder, required this.onChanged, this.searchable = true});

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  late T? selected = widget.value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await showModalBottomSheet<T>(
          context: context,
          backgroundColor: AppColors.surfaceAlt,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
          builder: (ctx) {
            final controller = TextEditingController();
            return Padding(
              padding: MediaQuery.of(ctx).viewInsets,
              child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.7,
                minChildSize: 0.5,
                maxChildSize: 0.9,
                builder: (_, scroll) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(height: 4, width: 48, decoration: BoxDecoration(color: AppColors.divider, borderRadius: AppRadius.small)),
                      const SizedBox(height: 12),
                      if (widget.searchable)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              hintText: 'Cari...',
                              filled: true,
                              fillColor: AppColors.surface,
                              border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                            ),
                          ),
                        ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: StatefulBuilder(builder: (ctx, setS) {
                          List<T> list = widget.items;
                          controller.addListener(() => setS(() {}));
                          if (widget.searchable && controller.text.isNotEmpty) {
                            list = list
                                .where((e) => widget.labelBuilder(e).toLowerCase().contains(controller.text.toLowerCase()))
                                .toList();
                          }
                          return ListView.builder(
                            controller: scroll,
                            itemCount: list.length,
                            itemBuilder: (_, i) {
                              final item = list[i];
                              return ListTile(
                                title: Text(widget.labelBuilder(item)),
                                onTap: () => Navigator.pop(ctx, item),
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
        if (result != null) {
          setState(() => selected = result);
          widget.onChanged(result);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.surfaceAlt,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(borderRadius: AppRadius.med, borderSide: const BorderSide(color: AppColors.divider)),
        ),
        child: Text(selected == null ? widget.hint : widget.labelBuilder(selected as T), style: AppTextStyle.body),
      ),
    );
  }
}