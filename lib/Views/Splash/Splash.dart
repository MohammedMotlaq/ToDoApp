import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/Views/Screens/SignIn_Screen.dart';
import 'package:to_do_app/Views/Screens/SignUp_Screen.dart';

import '../Screens/Main_Screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return SignInScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: const Color.fromRGBO(219, 35, 35, 1.0),
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
                style: TextStyle(color: Colors.white70, fontSize: 25.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
