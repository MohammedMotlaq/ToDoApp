import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:to_do_app/Helpers/Auth_Helper.dart';
import 'package:to_do_app/Router/App_Router.dart';
import 'package:to_do_app/Views/Auth/SignIn_Screen.dart';
import 'package:to_do_app/Views/Splash/Splash.dart';

class AuthProvider extends ChangeNotifier {
  bool? signedUp;
  signUp(String email, String name, String password,
      String confirmPassword) async {
    signedUp = await AuthHelper.authHelper
        .signUp(email, name, password, confirmPassword);
    notifyListeners();
  }

  checkInternetConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      AppRouter.popAll();
      AppRouter.pushWithReplacment(const SignInScreen());
    } else {
      AppRouter.popAll();
      AppRouter.pushWithReplacment(const Splash());
    }
  }
}
