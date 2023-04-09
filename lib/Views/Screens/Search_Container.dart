import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: Column(
        children: [
          Container(
            height: 60.h,
            margin: EdgeInsets.only(top: 30.h),
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(217, 217, 217, 1)),
                color: const Color.fromRGBO(245, 245, 245, 1),
                borderRadius: BorderRadius.all(Radius.circular(8.r))),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(
                    fontSize: 17.sp,
                    color: const Color.fromRGBO(158, 158, 158, 1),
                    fontFamily: "Inter"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
