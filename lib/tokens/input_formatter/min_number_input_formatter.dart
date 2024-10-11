import 'package:flutter/services.dart';

class MinNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Check if the new value is empty or starts with a digit
    if (newValue.text.isEmpty || newValue.text.startsWith(RegExp(r'[6-9]|\d{2,}'))) {
      // If valid input, return the updated value
      return newValue;
    } else {
      // Otherwise, return the old value (reject the change)
      return oldValue;
    }
  }
}