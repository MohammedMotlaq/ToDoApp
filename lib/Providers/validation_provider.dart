import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class ValidationProvider extends ChangeNotifier {
  
  String? requiredField(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is Required!";
    }
    notifyListeners();
  }

  String? emailValidator(String? value) {
    if (!isEmail(value!)) {
      return 'invalid email syntax';
    }
    notifyListeners();
  }
}
