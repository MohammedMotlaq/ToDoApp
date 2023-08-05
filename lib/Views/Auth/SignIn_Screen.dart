import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Providers/auth_provider.dart';
import 'package:to_do_app/Providers/validation_provider.dart';
import 'package:to_do_app/Router/App_Router.dart';
import 'package:to_do_app/Views/Auth/SignUp_Screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<UIProvider, AuthProvider, ValidationProvider>(
        builder: (context, uiProvider, authProvider, validationProvider, x) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              backgroundColor: uiProvider.theme["backgroundColor"],
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
                SizedBox(
                  width: 390.w,
                  height: 844.h,
                  child: Form(
                    key: authProvider.signInKey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
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
                                color: uiProvider.theme['text']),
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
                          SizedBox(
                            width: 343.w,
                            child: TextFormField(
                              style: TextStyle(
                                color: uiProvider.theme["text"],
                              ),
                              textInputAction: TextInputAction.next,
                              controller: authProvider.email,
                              validator: validationProvider.emailValidator,
                              cursorColor: Colors.deepOrange,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                      borderSide: const BorderSide(
                                          width: 2,
                                          color: Colors.deepOrange
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    const BorderSide(style: BorderStyle.none),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  filled: true,
                                  fillColor: uiProvider.theme['textInputs'],
                                  hintText: "Enter your Email",
                                  hintStyle: TextStyle(
                                    color: uiProvider.theme['hintText']!
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
                          SizedBox(
                            width: 343.w,
                            child: TextFormField(
                              onFieldSubmitted: (_) {
                                authProvider.btnController.start();
                              },
                              style: TextStyle(
                                color: uiProvider.theme["text"],
                              ),
                              controller: authProvider.password,
                              validator: validationProvider.requiredField,
                              obscureText: true,
                              cursorColor: Colors.deepOrange,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                      borderSide: const BorderSide(
                                          width: 2,
                                          color: Colors.deepOrange
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    const BorderSide(style: BorderStyle.none),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  filled: true,
                                  fillColor: uiProvider.theme['textInputs'],
                                  hintText: "Enter your Password",
                                  hintStyle: TextStyle(
                                    color: uiProvider.theme['hintText']!
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
                            successColor: uiProvider.theme["buttonColor"],
                            loaderStrokeWidth: 4,
                            loaderSize: 34.w,
                            borderRadius: 40.r,
                            color: uiProvider.theme["buttonColor"],
                            valueColor: Colors.white,
                            height: 72.h,
                            width: 340.w,
                            controller: authProvider.btnController,
                            onPressed: () => authProvider.signIn(),
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
                                  color: uiProvider.theme['text'],
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  AppRouter.pushWithReplacment(SignUpScreen());
                                },
                                child: Text(
                                  " Sign Up",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: 'Inter',
                                    color: uiProvider.theme['buttonColor'],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 350.h,
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