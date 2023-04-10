import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/Views/Widgets/Grid_Tasks_Widget.dart';
import 'package:to_do_app/Views/Widgets/Task_Widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool grid = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 34.h, left: 24.w, right: 39.w),
      child: Column(
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
                      ? const Icon(
                          Icons.grid_view_rounded,
                          color: Color.fromRGBO(255, 68, 68, 1),
                        )
                      : const Icon(
                          Icons.list,
                          color: Color.fromRGBO(255, 68, 68, 1),
                        )),
              SizedBox(
                width: 35.w,
              ),
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.dark_mode_outlined,
                    color: const Color.fromRGBO(255, 68, 68, 0.7),
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
                color: const Color.fromRGBO(255, 68, 68, 0.8),
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
                height: MediaQuery.of(context).size.height - 225.h,
                child: grid
                    ? ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 10,
                        itemBuilder: (context, index) => const TaskWidget(),
                      )
                    : GridView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 10,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 22.w,
                          childAspectRatio: 1 / 1.2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return const GridTaskWidget();
                        },
                      )),
          )
        ],
      ),
    );
  }
}
