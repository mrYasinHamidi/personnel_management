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
  final bool justInteger;
  final bool justFloat;

  const DefaultTextField({
    super.key,
    this.label,
    this.justInteger = false,
    this.justFloat = false,
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
      inputFormatters: <TextInputFormatter>[
        if (justInteger) FilteringTextInputFormatter.digitsOnly,
        if (justFloat) FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
      ],
      readOnly: readOnly,
      // keyboardType: inputType,
      validator: validator,
      onTap: onTap,
    );
  }
}
