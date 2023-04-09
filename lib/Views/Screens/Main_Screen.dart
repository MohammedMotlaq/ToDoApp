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
              size: 27.sp,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
              size: 27.sp,
            ),
            label: 'Search',
          ),
        ],
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
