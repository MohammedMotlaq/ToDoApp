import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Providers/auth_provider.dart';
import 'package:to_do_app/Providers/validation_provider.dart';
import 'package:to_do_app/Router/App_Router.dart';
import 'package:to_do_app/Views/Auth/SignUp_Screen.dart';
import 'package:to_do_app/Views/Screens/Main_Screen.dart';
import 'package:to_do_app/colors/Colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<UIProvider, AuthProvider, ValidationProvider>(
        builder: (context, UIprovider, Authprovider, Validationprovider, x) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: UIprovider.theme["backgroundColor"],
          body: Stack(children: [
            Container(
              width: 200.w,
              height: 221.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topLeft,
                      image: AssetImage(
                        "assets/images/UpperBackground.png",
                      ))),
            ),
            Container(
              width: 390.w,
              height: 844.h,
              child: Form(
                key: Authprovider.signInKey,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 153.h,
                      ),
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: UIprovider.theme['text']),
                      ),
                      SizedBox(
                        height: 55.h,
                      ),
                      Image.asset(
                        "assets/images/splash.png",
                        width: 161.w,
                        height: 140.h,
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                      Container(
                        width: 343.w,
                        child: TextFormField(
                          onFieldSubmitted: (_) {
                            Authprovider.btnController.start();
                          },
                          controller: Authprovider.email,
                          validator: Validationprovider.emailValidator,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(style: BorderStyle.none),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              filled: true,
                              fillColor: UIprovider.theme['textInputs'],
                              hintText: "Enter your Email",
                              hintStyle: TextStyle(
                                color: UIprovider.theme['hintText']!
                                    .withOpacity(0.3),
                                fontSize: 18.sp,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r))),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Container(
                        width: 343.w,
                        child: TextFormField(
                          onFieldSubmitted: (_) {
                            Authprovider.btnController.start();
                          },
                          controller: Authprovider.password,
                          validator: Validationprovider.requiredField,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(style: BorderStyle.none),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              filled: true,
                              fillColor: UIprovider.theme['textInputs'],
                              hintText: "Enter your Password",
                              hintStyle: TextStyle(
                                color: UIprovider.theme['hintText']!
                                    .withOpacity(0.3),
                                fontSize: 18.sp,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r))),
                        ),
                      ),
                      SizedBox(
                        height: 65.h,
                      ),
                      RoundedLoadingButton(
                        successColor: UIprovider.theme["buttonColor"],
                        loaderStrokeWidth: 4,
                        loaderSize: 34.w,
                        borderRadius: 40.r,
                        color: UIprovider.theme["buttonColor"],
                        valueColor: Colors.white,
                        height: 72.h,
                        width: 340.w,
                        controller: Authprovider.btnController,
                        onPressed: () => Authprovider.signIn(),
                        child: Text(
                          "Sign In",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: UIprovider.theme['text'],
                              fontFamily: 'Poppins',
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              AppRouter.pushWithReplacment(
                                  const SignUpScreen());
                            },
                            child: Text(
                              " Sign Up",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'Inter',
                                color: UIprovider.theme['buttonColor'],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      );
    });
  }
}
