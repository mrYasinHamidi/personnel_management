import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String? label;
  final VoidCallback? onTap;
  final bool? enable;
  final TextInputType? inputType;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;


  const DefaultTextField({
    super.key,
    this.label,
    this.controller,
    this.enable,
    this.inputType,
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        enabled: enable ?? true,
      ),
      keyboardType: inputType,
      validator: validator,
      onTap: onTap,
    );
  }
}
