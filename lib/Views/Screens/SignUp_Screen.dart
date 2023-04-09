import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
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
            padding: EdgeInsets.only(top: 153.h, left: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome User!",
                  style: TextStyle(
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
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  margin: EdgeInsets.only(top: 14.h),
                  width: 343.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 68, 68, 0.25),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter your full name",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide.none, // removes the line
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  margin: EdgeInsets.only(top: 14.h),
                  width: 343.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 68, 68, 0.25),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter your Email",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide.none, // removes the line
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  margin: EdgeInsets.only(top: 14.h),
                  width: 343.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 68, 68, 0.25),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter your Password",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide.none, // removes the line
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  margin: EdgeInsets.only(top: 14.h),
                  width: 343.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 68, 68, 0.25),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide.none, // removes the line
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 49.h,
                ),
                SizedBox(
                  height: 72.h,
                  width: 340.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color.fromRGBO(255, 68, 68, 1),
                    ),
                    child: Text(
                      "SignUp",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontFamily: 'Inter',
                      ),
                    ),
                    InkWell(
                      //TODO: Navigate to Login Screen
                      onTap: () {},
                      child: Text(
                        " Sign In",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'Inter',
                          color: const Color.fromARGB(255, 207, 39, 39),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
