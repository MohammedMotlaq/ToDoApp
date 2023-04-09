import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/Views/Widgets/Task_Widget.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15.w, 18.h, 15.w, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60.h,
              margin: EdgeInsets.only(top: 30.h, bottom: 5.h),
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(217, 217, 217, 1)),
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(8.r))),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(
                        fontSize: 17.sp,
                        color: const Color.fromRGBO(158, 158, 158, 1),
                        fontFamily: "Inter"),
                    suffix: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Image.asset(
                        "assets/icons/clear.png",
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 665.h,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => TaskWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
