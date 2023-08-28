import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../controller/form_validation/validator_functions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintTextToDisplay,
    required this.onSavedCallback,
    this.initialMessage,
    this.obscureText = false,
  }) : super(key: key);

  final String hintTextToDisplay;
  final void Function(String?) onSavedCallback;

  final String? initialMessage;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType:
          hintTextToDisplay == 'Phone Number' ? TextInputType.phone : null,
      maxLength: hintTextToDisplay == 'Phone Number' ? 10 : null,
      decoration: InputDecoration(
        hintText: hintTextToDisplay,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hintTextToDisplay is required';
        } else if (!validationFunction(hintTextToDisplay, value)) {
          return 'Enter valid $hintTextToDisplay';
        }
        return null;
      },
      initialValue: initialMessage,
      onSaved: onSavedCallback,
    );
  }
}
