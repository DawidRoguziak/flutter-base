import 'package:flutter/material.dart';

class UiInput extends StatelessWidget {
  final TextEditingController? fieldController;
  final FormFieldValidator? validator;
  final String? label;
  final TextInputType? textInputType;

  final void Function(dynamic value) fieldValueSetter;

  const UiInput(
      {Key? key,
      this.fieldController,
      this.validator,
      this.label,
      this.textInputType,
      required this.fieldValueSetter
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: fieldController,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label),
        keyboardType: textInputType,
        onSaved: (newValue) => fieldValueSetter(newValue ?? ''),
        validator: validator);
  }
}
