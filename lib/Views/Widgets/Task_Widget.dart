import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Providers/data_provider.dart';

import '../../Models/task_model.dart';
import '../../colors/Colors.dart';

class TaskWidget extends StatefulWidget {
  Tasks task;
  int index, selectedIndex;
  Function changeSelectedIndex;

  TaskWidget(
      {super.key,
      required this.index,
      required this.selectedIndex,
      required this.changeSelectedIndex,
      required this.task});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<UIProvider, DataProvider>(
        builder: (context, UIprovider, Dataprovider, x) {
      return GestureDetector(
        onDoubleTap: () {
          widget.selectedIndex == widget.index
              ? widget.changeSelectedIndex(-1)
              : widget.changeSelectedIndex(widget.index);
        },
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 11.w),
          height: widget.selectedIndex == widget.index ? 200.h : 100.h,
          margin: EdgeInsets.only(top: 23.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: widget.task.isDone!
                ? Colors.green
                : UIprovider.theme['taskCartBackground'],
          ),
          duration: Duration(milliseconds: 300),
          child: Row(
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
              SizedBox(
                width: 14.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
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
                  const Spacer(),
                  SizedBox(
                    width: 230.w,
                    height: widget.selectedIndex == widget.index ? 145.h : 45.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        widget.task.description ?? "Unknown",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  const Spacer()
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () => Dataprovider.deleteTasks(widget.task),
                child: ImageIcon(
                  const AssetImage("assets/icons/trash.png"),
                  color: Colors.white,
                  size: 35.h,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
