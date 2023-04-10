import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../colors/Colors.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 11.w),
      height: 100.h,
      margin: EdgeInsets.only(top: 23.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: appTheme['taskCartBackground'],
      ),
      child: Row(
        children: [
          ImageIcon(
            const AssetImage("assets/icons/check-square.png"),
            color: Colors.white,
            size: 35.h,
          ),
          SizedBox(
            width: 14.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pay Emma",
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    color: Colors.white),
              ),
              const Spacer(),
              Text(
                "20 dollars for manga",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              const Spacer()
            ],
          ),
          const Spacer(),
          ImageIcon(
            const AssetImage("assets/icons/trash.png"),
            color: Colors.white,
            size: 35.h,
          )
        ],
      ),
    );
  }
}
