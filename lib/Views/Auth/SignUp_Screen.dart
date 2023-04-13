import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Providers/auth_provider.dart';
import 'package:to_do_app/Providers/validation_provider.dart';
import 'package:to_do_app/Router/App_Router.dart';
import 'package:to_do_app/Views/Auth/SignIn_Screen.dart';

import '../../colors/Colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<UIProvider, AuthProvider, ValidationProvider>(
        builder: (context, UIprovider, Authprovider, Validationprovider, x) {
      return Scaffold(
        backgroundColor: UIprovider.theme['backgroundColor'],
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
              key: Authprovider.signUpKey,
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
                      "Welcome User!",
                      style: TextStyle(
                          color: UIprovider.theme['text'],
                          fontFamily: 'Poppins',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      "Lets Get Signup to add tasks",
                      style: TextStyle(
                        color: UIprovider.theme['text'],
                        fontFamily: 'Poppins',
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Image.asset(
                      "assets/images/sticker.png",
                      width: 110.w,
                      height: 94.h,
                    ),
                    Container(
                      width: 343.w,
                      margin: EdgeInsets.only(top: 11.h),
                      child: TextFormField(
                        controller: Authprovider.fullName,
                        validator: Validationprovider.requiredField,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            filled: true,
                            fillColor: UIprovider.theme['textInputs'],
                            hintText: "Enter your full name",
                            hintStyle: TextStyle(
                              color: UIprovider.theme['hintText']!
                                  .withOpacity(0.3),
                              fontSize: 18.sp,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r))),
                      ),
                    ),
                    Container(
                      width: 343.w,
                      margin: EdgeInsets.only(top: 14.h),
                      child: TextFormField(
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
                    Container(
                      width: 343.w,
                      margin: EdgeInsets.only(top: 14.h),
                      child: TextFormField(
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
                    Container(
                      width: 343.w,
                      margin: EdgeInsets.only(top: 14.h),
                      child: TextFormField(
                        controller: Authprovider.confirmPassword,
                        validator: Validationprovider.requiredField,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            filled: true,
                            fillColor: UIprovider.theme['textInputs'],
                            hintText: "Confirm your Pasword",
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
                      height: 49.h,
                    ),
                    SizedBox(
                      height: 72.h,
                      width: 343.w,
                      child: ElevatedButton(
                        onPressed: () {
                          Authprovider.signUp();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: UIprovider.theme['buttonColor'],
                        ),
                        child: Text(
                          "Sign Up",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 29,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: UIprovider.theme['text'],
                            fontFamily: 'Poppins',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            AppRouter.pushWithReplacment(SignInScreen());
                          },
                          child: Text(
                            " Sign In",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'Poppins',
                              color: UIprovider.theme['buttonColor'],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      );
    });
  }
}
