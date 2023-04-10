import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../colors/Colors.dart';

class GridTaskWidget extends StatefulWidget {
  const GridTaskWidget({super.key});

  @override
  State<GridTaskWidget> createState() => _GridTaskWidgetState();
}

class _GridTaskWidgetState extends State<GridTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 11.w),
      padding: EdgeInsets.only(top: 21.h, bottom: 7.h, left: 9.w, right: 12),

      margin: EdgeInsets.only(top: 23.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: appTheme['taskCartBackground'],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Pay Emma",
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Text(
            "20 dollars for manga",
            style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w300),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ImageIcon(
                const AssetImage("assets/icons/check-square.png"),
                color: Colors.white,
                size: 28.h,
              ),
              ImageIcon(
                const AssetImage("assets/icons/trash.png"),
                color: Colors.white,
                size: 28.h,
              ),
            ],
          )
        ],
      ),
    );
  }
}
