import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Providers/data_provider.dart';
import 'package:to_do_app/Views/Widgets/grid_tasks_widget.dart';
import 'package:to_do_app/Views/Widgets/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool grid = true;
  int selectedIndex = -1;
  changeSelectedIndex(index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<UIProvider, DataProvider>(
        builder: (context, uiProvider, dataProvider, x) {
      return Container(
        color: uiProvider.theme['backgroundColor'],
        padding: EdgeInsets.only(top: 34.h, left: 24.w, right: 24.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(
                    iconSize: 32.sp,
                    onPressed: () {
                      setState(() {
                        grid = !grid;
                      });
                    },
                    icon: grid
                      ? Icon(
                        Icons.grid_view_rounded,
                        color: const Color(0xFFFF4444),
                        size: 32.sp,
                      )
                      : Icon(
                        Icons.menu_rounded,
                        color: const Color(0xFFFF4444),
                        size: 32.sp,
                      )),
                  const Spacer(),
                  Text(
                    "My Tasks",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Roboto",
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [
                            Color.fromRGBO(141, 56, 56, 1),
                            Color.fromRGBO(255, 68, 68, .8),
                            Color.fromRGBO(141, 56, 56, 1),
                            Color.fromRGBO(255, 68, 68, .8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(Rect.fromLTRB(22.w, 0, 0, 56.h)),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        uiProvider.changeTheme();
                      },
                      icon: Icon(
                        uiProvider.themeIcon,
                        color: const Color(0xFFFF4444),
                        size: 32.sp,
                      )),
                ],
              ),
              SizedBox(
                height: 42.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Whats on your mind?",
                  style: TextStyle(
                    color: uiProvider.theme['someText'],
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SingleChildScrollView(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height - 230.h,
                      child: (dataProvider.tasks.isEmpty)
                          ? Center(child: Lottie.asset('assets/lottie/task_done.json'))
                          : (grid)
                              ? ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: dataProvider.tasks.length,
                                  itemBuilder: (context, index) => TaskWidget(
                                    index: index,
                                    selectedIndex: selectedIndex,
                                    changeSelectedIndex: changeSelectedIndex,
                                    task: dataProvider.tasks[index],
                                  ),
                                )
                              : GridView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: dataProvider.tasks.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 22.w,
                                    childAspectRatio: 1 / 1.2,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GridTaskWidget(
                                      task: dataProvider.tasks[index],
                                    );
                                  },
                                )))
            ],
          ),
        ),
      );
    });
  }
}
