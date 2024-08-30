import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:personnel_management/common/widgets/default_text_field.dart';

class DefaultDatePicker extends StatefulWidget {
  final Function(Jalali value)? onChange;

  const DefaultDatePicker({super.key, this.onChange});

  @override
  State<DefaultDatePicker> createState() => _DefaultDatePickerState();
}

class _DefaultDatePickerState extends State<DefaultDatePicker> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      onTap: () => _onTap(context),
    );
  }

  void _onTap(BuildContext context) async {
    Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1385, 8),
      lastDate: Jalali(1450, 9),
    );
    if (picked != null) {
      widget.onChange?.call(picked);
      var label = picked.formatFullDate();
      controller.text = label;
    }
  }
}
