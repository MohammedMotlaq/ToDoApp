import 'package:flutter/material.dart';
import 'package:to_do_app/Helpers/Auth_Helper.dart';

class AuthProvider extends ChangeNotifier {
  bool? signedUp;
  signUp(String email, String name, String password,
      String confirmPassword) async {
    signedUp = await AuthHelper.authHelper
        .signUp(email, name, password, confirmPassword);
    notifyListeners();
  }
}
