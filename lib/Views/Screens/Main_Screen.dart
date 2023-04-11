import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Views/Screens/Search_Container.dart';
import 'package:to_do_app/Views/Widgets/Add_Task_Widget.dart';
import 'package:to_do_app/colors/Colors.dart';

import 'Home_Screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  bool _isBottomSheetVisible = false;
  Widget bodyWidget = HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Consumer<UIProvider>(builder: (context, UIprovider, x) {
      return Scaffold(
        backgroundColor: UIprovider.theme['backgroundColor'],
        body: bodyWidget,
        floatingActionButton: FloatingActionButton(
          backgroundColor: UIprovider.theme['addTaskButton'],
          elevation: 0,
          highlightElevation: 0,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child:const AddTaskWidget(),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              )),
            );
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
                  offset: const Offset(1, 6),
                ),
              ],
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 32.sp,
            ),
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
          backgroundColor: UIprovider.theme['backgroundColor'],
          selectedItemColor: UIprovider.theme['selectedColor'],
          unselectedItemColor: UIprovider.theme['unselectedColor'],
        ),
      );
    });
  }
}
