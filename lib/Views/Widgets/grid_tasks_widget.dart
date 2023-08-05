import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Models/task_model.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Providers/data_provider.dart';

class GridTaskWidget extends StatefulWidget {
  final Tasks task;
  const GridTaskWidget({super.key, required this.task});

  @override
  State<GridTaskWidget> createState() => _GridTaskWidgetState();
}

class _GridTaskWidgetState extends State<GridTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<UIProvider, DataProvider>(
        builder: (context, uiProvider, dataProvider, x) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.only(top: 7.h, bottom: 7.h, left: 9.w, right: 12),
        height: 180.h,
        margin: EdgeInsets.only(top: 23.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: widget.task.isDone!
              ? Colors.green
              : uiProvider.theme['taskCartBackground'],
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 35.h,
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
                    dataProvider.makeDone(widget.task);
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
                  onTap: () => dataProvider.deleteTasks(widget.task),
                  // child: ImageIcon(
                  //   const AssetImage("assets/icons/trash.png"),
                  //   color: Colors.white,
                  //   size: 28.h,
                  // ),
                  child: Icon(Icons.delete_forever_outlined,size: 35.h,color: Colors.white,),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
