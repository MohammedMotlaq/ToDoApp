import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/Providers/auth_provider.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<UIProvider, AuthProvider>(
          builder: (context, UIprovider, AuthProvider, x) {
        return Container(
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
                    color: UIProvider().theme["text"],
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
                  color: UIProvider().theme["text"],
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 72.h,
                width: 340.w,
                child: ElevatedButton(
                  onPressed: () {
                    AuthProvider.checkInternetConnection();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: UIprovider.theme["buttonColor"],
                  ),
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
              ),
            ],
          ),
        );
      }),
    );
  }
}
