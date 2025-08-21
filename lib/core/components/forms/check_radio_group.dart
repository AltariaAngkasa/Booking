import 'package:flutter/material.dart';

class CheckboxGroup<T> extends StatefulWidget {
  final List<T> items;
  final List<T> values;
  final String Function(T) label;
  final void Function(List<T>) onChanged;
  const CheckboxGroup({super.key, required this.items, required this.values, required this.label, required this.onChanged});

  @override
  State<CheckboxGroup<T>> createState() => _CheckboxGroupState<T>();
}

class _CheckboxGroupState<T> extends State<CheckboxGroup<T>> {
  late List<T> selected = [...widget.values];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final it in widget.items)
          CheckboxListTile(
            value: selected.contains(it),
            onChanged: (v) {
              setState(() {
                v == true ? selected.add(it) : selected.remove(it);
              });
              widget.onChanged(selected);
            },
            title: Text(widget.label(it)),
            controlAffinity: ListTileControlAffinity.leading,
          )
      ],
    );
  }
}

class RadioGroup<T> extends StatefulWidget {
  final List<T> items;
  final T? value;
  final String Function(T) label;
  final void Function(T?) onChanged;
  const RadioGroup({super.key, required this.items, required this.value, required this.label, required this.onChanged});

  @override
  State<RadioGroup<T>> createState() => _RadioGroupState<T>();
}

class _RadioGroupState<T> extends State<RadioGroup<T>> {
  late T? selected = widget.value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final it in widget.items)
          RadioListTile<T>(
            value: it,
            groupValue: selected,
            onChanged: (v) {
              setState(() => selected = v);
              widget.onChanged(v);
            },
            title: Text(widget.label(it)),
          )
      ],
    );
  }
}