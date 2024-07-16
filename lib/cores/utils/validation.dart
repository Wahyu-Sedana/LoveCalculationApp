import 'package:flutter/material.dart';
import 'enums.dart';

class ValidationHelper {
  final Function(bool value) isError;
  final TypeField typeField;
  final String? pwd;

  ValidationHelper({
    this.pwd = '',
    required this.isError,
    required this.typeField,
  });

  FormFieldValidator validate() {
    String? message;
    return (value) {
      final strValue = value as String;
      if (strValue.isEmpty) {
        message = "Please enter a valid value";
        isError(true);
      }
      return message;
    };
  }
}
