import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:to_do_app/Helpers/Auth_Helper.dart';
import 'package:to_do_app/Router/App_Router.dart';
import 'package:to_do_app/Views/Auth/SignIn_Screen.dart';
import 'package:to_do_app/Views/Auth/SignUp_Screen.dart';
import 'package:to_do_app/Views/Splash/Splash.dart';

class AuthProvider extends ChangeNotifier {
  bool? signedUp;
  bool? isLoading;
  RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();

  signUp(String email, String name, String password,
      String confirmPassword) async {
    signedUp = await AuthHelper.authHelper
        .signUp(email, name, password, confirmPassword);
    if (signedUp!) {
      AppRouter.pushWidget(const SignInScreen());
    } else {
      AppRouter.showErrorSnackBar("Email Already Exists!");
    }
    notifyListeners();
  }

  checkInternetConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      btnController.success();
      notifyListeners();
      Future.delayed(const Duration(seconds: 2), () async {
        AppRouter.popAll();
        AppRouter.pushWithReplacment(const SignUpScreen());
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () async {
        btnController.error();
        notifyListeners();
      });
    }
    Future.delayed(const Duration(seconds: 3), () async {
      btnController.reset();
      notifyListeners();
    });
  }
}
