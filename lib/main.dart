import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Helpers/SP_Helper.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Providers/auth_provider.dart';
import 'package:to_do_app/Providers/data_provider.dart';
import 'package:to_do_app/Providers/validation_provider.dart';
import 'package:to_do_app/Router/App_Router.dart';
import 'package:to_do_app/Views/Splash/Splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SPHelper.initializeSp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final dataProvider = DataProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UIProvider>(create: (context) => UIProvider()),
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider(dataProvider)),
        ChangeNotifierProvider<ValidationProvider>(
            create: (context) => ValidationProvider()),
        ChangeNotifierProvider<DataProvider>(
            create: (context) => DataProvider()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, child) {
            return MaterialApp(
              navigatorKey: AppRouter.navKey,
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
              ),
              home: const Splash(),
              debugShowCheckedModeBanner: false,
            );
          }),
    );
  }
}
