import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Models/task_model.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';

import '../../colors/Colors.dart';

class GridTaskWidget extends StatefulWidget {
  Tasks task;
  GridTaskWidget({super.key, required this.task});

  @override
  State<GridTaskWidget> createState() => _GridTaskWidgetState();
}

class _GridTaskWidgetState extends State<GridTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UIProvider>(builder: (context, UIprovider, x) {
      return Container(
        // padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 11.w),
        padding: EdgeInsets.only(top: 21.h, bottom: 7.h, left: 9.w, right: 12),

        margin: EdgeInsets.only(top: 23.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: UIprovider.theme['taskCartBackground'],
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.task.title ?? "Unknown",
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Text(
                  widget.task.description ?? "Unknown",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
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
    });
  }
}
