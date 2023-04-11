import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:lottie/lottie.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UIProvider>(builder: (context, UIprovider, x) {
        return Container(
          height: 844.h,
          width: 390.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/nointernet.json'),
              Text("")
              ],
          ),
        );
      }),
    );
  }
}
