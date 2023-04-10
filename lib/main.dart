import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Helpers/SP_Helper.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Router/App_Router.dart';
import 'package:to_do_app/Views/Splash/Splash.dart';

import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SPHelper.initializeSp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UIProvider(),
      child: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, child) {
            return MaterialApp(
              navigatorKey: AppRouter.navKey,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const Splash(),
              debugShowCheckedModeBanner: false,
            );
          }),
    );
  }
}
