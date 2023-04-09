import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/Views/Screens/Search_Container.dart';

import 'Home_Screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  Widget bodyWidget = HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: bodyWidget,

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(196, 3, 3, 1.0),
        elevation: 0,
        highlightElevation: 0,
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context){
            return Container(
              width: 390.w,
              height: 312.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r),topRight: Radius.circular(25.r)),
              ),
            );
          });
        },
        child: Container(
          height: 70.w,
          width: 70.w,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(50.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.redAccent.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 3,
                offset:const Offset(1, 6),
              ),
            ],
          ),
          child: Icon(Icons.add,color: Colors.white,size: 32.sp,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        onTap: (i) {
          index = i;
          if (i == 0) {
            index = 0;
            setState(() {
              bodyWidget = HomeScreen();
            });
          } else if (i == 1) {
            index = 1;
            setState(() {
              bodyWidget = SearchContainer();
            });
          }
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 32.sp,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
              size: 32.sp,
            ),
            label: 'Search',
          ),
        ],
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        backgroundColor: Colors.white,
        selectedItemColor:const Color.fromRGBO(255, 68, 68, 0.5),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
