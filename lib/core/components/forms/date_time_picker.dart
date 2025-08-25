import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../theme/custom_themes.dart';

class DateTimePickerField extends StatefulWidget {
  final DateTime? initial;
  final void Function(DateTime) onChanged;
  final DateFormat format;
  DateTimePickerField({super.key, this.initial, required this.onChanged, DateFormat? format}) : format = format ?? DateFormat('dd MMM yyyy, HH:mm');

  @override
  State<DateTimePickerField> createState() => _DateTimePickerFieldState();
}

class _DateTimePickerFieldState extends State<DateTimePickerField> {
  late DateTime? value = widget.initial;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final now = DateTime.now();
        final date = await showDatePicker(
          context: context,
          firstDate: DateTime(now.year - 5),
          lastDate: DateTime(now.year + 5),
          initialDate: value ?? now,
          builder: (ctx, child) => Theme(data: buildAppTheme(), child: child!),
        );
        if (date == null) return;
        final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(value ?? now));
        if (time == null) return;
        final dt = DateTime(date.year, date.month, date.day, time.hour, time.minute);
        setState(() => value = dt);
        widget.onChanged(dt);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.surfaceAlt,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(borderRadius: AppRadius.med, borderSide: const BorderSide(color: AppColors.divider)),
        ),
        child: Text(value == null ? 'Pilih tanggal & waktu' : widget.format.format(value!), style: AppTextStyle.body),
      ),
    );
  }
}