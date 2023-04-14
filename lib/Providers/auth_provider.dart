import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:to_do_app/Helpers/Auth_Helper.dart';
import 'package:to_do_app/Helpers/SP_Helper.dart';
import 'package:to_do_app/Models/User_Model.dart';
import 'package:to_do_app/Models/tasks_model.dart';
import 'package:to_do_app/Router/App_Router.dart';
import 'package:to_do_app/Views/Auth/SignIn_Screen.dart';
import 'package:to_do_app/Views/Auth/SignUp_Screen.dart';
import 'package:to_do_app/Views/Screens/Main_Screen.dart';

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
  List<Tasks> tasks = [];
  signUp() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      if (signUpKey.currentState!.validate()) {
        signedUp = await AuthHelper.authHelper.signUp(
            email.text.trim(),
            fullName.text.trim(),
            password.text.trim(),
            confirmPassword.text.trim());
        if (signedUp!) {
          btnController.success();
          Future.delayed(const Duration(milliseconds: 200), () async {
            AppRouter.pushWithReplacment(SignInScreen());
            confirmPassword.clear();
            fullName.clear();
            password.clear();
          });
        } else {
          btnController.reset();
          AppRouter.showErrorSnackBar("Email Already Exists!");
        }
      } else {
        btnController.reset();
      }
    } else {
      AppRouter.showErrorSnackBar("No Internet Connection");
    }
  }

  signIn() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      if (signInKey.currentState!.validate()) {
        var user =
            await AuthHelper.authHelper.signIn(email.text, password.text);
        if (user == null) {
          AppRouter.showErrorSnackBar("Wrong Password or Email");
          btnController.reset();
        } else {
          await SPHelper.saveEmail(user.email!);
          await SPHelper.saveName(user.name!);
          await SPHelper.saveToken(user.token!);
          btnController.success();
          Future.delayed(const Duration(milliseconds: 200), () async {
            AppRouter.popAll();
            AppRouter.pushWidget(const MainScreen());
            getAllTasks();
          });
          email.clear();
          password.clear();
          btnController.reset();
        }
      } else {
        btnController.reset();
      }
    } else {
      AppRouter.showErrorSnackBar("No Internet Connection");
    }
  }

  checkInternetConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      btnController.success();
      Future.delayed(const Duration(seconds: 1), () async {
        AppRouter.popAll();
        AppRouter.pushWidget(SignInScreen());
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () async {
        btnController.error();
      });
    }

    Future.delayed(const Duration(seconds: 3), () async {
      btnController.reset();
    });
  }

  getAllTasks() async {
    tasks = await AuthHelper.authHelper.getAllTasks();
    notifyListeners();
  }
}
