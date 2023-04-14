import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Helpers/SP_Helper.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Router/App_Router.dart';
import 'package:to_do_app/Views/Auth/no_internet_page.dart';
import 'package:to_do_app/Views/Screens/Home_Screen.dart';
import 'package:to_do_app/Views/Screens/Main_Screen.dart';
import 'package:to_do_app/colors/Colors.dart';

import '../Auth/SignIn_Screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      bool result = await InternetConnectionChecker().hasConnection;
      result
          // ignore: use_build_context_synchronously
          ? navigateUser()
          :
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) {
              return const NoInternetPage();
            }));
    });
  }

  navigateUser() {
    String? token = SPHelper.getToken();
    if (token == null) {
      return Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return SignInScreen();
      }));
    }
    return Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return MainScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UIProvider>(builder: (context, UIprovider, x) {
        return Container(
          alignment: Alignment.center,
          color: UIprovider.theme['SplashBackgroundColor'],
          width: 390.w,
          height: 844.h,
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Text(
                "My Tasks",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "مهامي",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                width: 350.w,
                height: 340.h,
                child: Image.asset(
                  "assets/images/splash.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                width: 300.w,
                height: 100.h,
                child: Image.asset(
                  "assets/images/line.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                width: 350.w,
                height: 100.h,
                child: Text(
                  "Have a Nice Day 👋😍",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
