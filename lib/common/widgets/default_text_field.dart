import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  final String? label;
  final VoidCallback? onTap;
  final bool enable;
  final bool readOnly;
  final TextInputType? inputType;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final String? counterText;
  final Widget? suffixIcon;
  final bool justNumbers;

  const DefaultTextField({
    super.key,
    this.label,
    this.justNumbers = false,
    this.suffixIcon,
    this.controller,
    this.counterText,
    this.readOnly = false,
    this.enable = true,
    this.inputType,
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        counterText: counterText,
        suffixIcon: suffixIcon,
      ),
      controller: controller,
      enabled: enable,
      inputFormatters: justNumbers ? [FilteringTextInputFormatter.digitsOnly] : null,
      readOnly: readOnly,
      keyboardType: inputType,
      validator: validator,
      onTap: onTap,
    );
  }
}
