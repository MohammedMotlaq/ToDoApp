import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Models/task_model.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Providers/data_provider.dart';

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
    return Consumer2<UIProvider, DataProvider>(
        builder: (context, UIprovider, Dataprovider, x) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        // padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 11.w),
        padding: EdgeInsets.only(top: 21.h, bottom: 7.h, left: 9.w, right: 12),
        height: 180.h,
        margin: EdgeInsets.only(top: 23.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: widget.task.isDone!
              ? Colors.green
              : UIprovider.theme['taskCartBackground'],
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.task.title ?? "Unknown",
                style: TextStyle(
                    decoration: widget.task.isDone!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
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
                child: SizedBox(
                  height: 50.h,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      widget.task.description ?? "Unknown",
                      style: TextStyle(
                          overflow: TextOverflow.fade,
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    widget.task.isDone = !widget.task.isDone!;
                    setState(() {});
                    Dataprovider.makeDone(widget.task);
                  },
                  child: widget.task.isDone!
                      ? Icon(
                          Icons.check_box_rounded,
                          size: 32.w,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.check_box_outline_blank,
                          size: 32.w,
                          color: Colors.white,
                        ),
                ),
                InkWell(
                  onTap: () => Dataprovider.deleteTasks(widget.task),
                  child: ImageIcon(
                    const AssetImage("assets/icons/trash.png"),
                    color: Colors.white,
                    size: 28.h,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
