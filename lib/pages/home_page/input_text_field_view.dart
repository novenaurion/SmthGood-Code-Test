import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextFieldView extends StatelessWidget {
  const InputTextFieldView(
      {Key? key,
      required this.onChange,
      this.label,
      this.textInputType,
      this.textInputFormatter})
      : super(key: key);

  final Function onChange;
  final String? label;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value)=>onChange(value),
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
      decoration: InputDecoration(labelText: label ?? ""),
    );
  }
}
