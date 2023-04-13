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

  RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();
  GlobalKey<FormState> signUpKey = GlobalKey();
  GlobalKey<FormState> signInKey = GlobalKey();

  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  signUp() async {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result) {
      if (signUpKey.currentState!.validate()) {
        signedUp = await AuthHelper.authHelper.signUp(
            email.text, fullName.text, password.text, confirmPassword.text);
        email.clear();
        fullName.clear();
        password.clear();
        confirmPassword.clear();
        notifyListeners();
        if (signedUp!) {
          AppRouter.pushWidget(const SignInScreen());
        } else {
          AppRouter.showErrorSnackBar("Email Already Exists!");
        }
      }
    } else {
      AppRouter.showErrorSnackBar("No Internet Connection");
    }
  }

  signIn() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      if (signInKey.currentState!.validate()) {
        await AuthHelper.authHelper.signIn(email.text, password.text);
      }
    } else {
      AppRouter.showErrorSnackBar("No Internet Connection");
    }
  }

  checkInternetConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      btnController.success();
      notifyListeners();
      Future.delayed(const Duration(seconds: 2), () async {
        AppRouter.popAll();
        AppRouter.pushWidget(const SignInScreen());
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
