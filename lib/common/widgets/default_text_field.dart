import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String? label;
  final VoidCallback? onTap;
  final bool? enable;
  final TextInputType? inputType;

  const DefaultTextField({
    super.key,
    this.label,
    this.enable,
    this.inputType,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        enabled: enable ?? true,
      ),
      keyboardType: inputType,
      onTap: onTap,
    );
  }
}
