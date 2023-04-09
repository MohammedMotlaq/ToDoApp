import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/Views/Splash/Splash.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context,child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Splash(),
          debugShowCheckedModeBanner: false,
        );
      }
    );
  }
}
