import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';

import '../../colors/Colors.dart';

class TaskWidget extends StatefulWidget {
  int index,selectedIndex;
  Function changeSelectedIndex;

   TaskWidget({super.key,required this.index,required this.selectedIndex,required this.changeSelectedIndex});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UIProvider>(builder: (context, UIprovider, x) {
      return GestureDetector(
        onDoubleTap: (){
          widget.selectedIndex==widget.index?
          widget.changeSelectedIndex(-1):widget.changeSelectedIndex(widget.index);
        },
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 11.w),
          height:  widget.selectedIndex==widget.index?200.h: 100.h,
          margin: EdgeInsets.only(top: 23.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: UIprovider.theme['taskCartBackground'],
          ),
          duration: Duration(milliseconds: 300),
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
                  SizedBox(
                    width: 230.w,
                    height:  widget.selectedIndex==widget.index?145.h:45.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        "20 dollars for manga 20 dollars for manga 20 dollars for manga 20 dollars for manga 20 dollars for manga 20 dollars for manga 20 dollars for manga 20 dollars for manga 20 dollars for manga 20 dollars for manga 20 dollars for manga 20 dollars for manga 20 dollars for manga 20 dollars for manga 20 dollars for manga ",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          overflow: widget.selectedIndex==widget.index?TextOverflow.clip:TextOverflow.ellipsis
                        ),
                      ),
                    ),
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
        ),
      );
    });
  }
}
