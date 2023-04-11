import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/Providers/auth_provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    // void _doSomething() async {
    //   Timer(
    //     Duration(seconds: 3),
    //     () {
    //       _btnController.success();
    //     },
    //   );
    // }

    return Consumer2<UIProvider,AuthProvider>(
      builder: (context,UIprovider,Authprovider,x) {
        return Scaffold(
backgroundColor: UIprovider.theme["backgroundColor"],
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            height: 844.h,
            width: 390.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lottie/light-no-internet.json'),
                Text(
                  "Oops!",
                  style: TextStyle(
                      fontSize: 32.sp,
                      color: UIprovider.theme["text"],
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "There is no internet Connection\nPlease check your internet connection then retry",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: UIprovider.theme["text"],
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                RoundedLoadingButton(
                  color: UIprovider.theme["buttonColor"],
                  valueColor: UIprovider.theme["text"]!,
                  height: 72.h,
                  width: 340.w,
                  controller: Authprovider.btnController,
                  onPressed: () => Authprovider.checkInternetConnection(),
                  child: Text(
                    "Retry",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
