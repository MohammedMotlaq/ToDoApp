import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Models/task_model.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Providers/data_provider.dart';
import 'package:to_do_app/Views/Widgets/Task_Widget.dart';
import 'package:to_do_app/colors/Colors.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<UIProvider, DataProvider>(
        builder: (context, UIprovider, Dataprovider, x) {
      return Container(
        color: UIprovider.theme['backgroundColor'],
        padding: EdgeInsets.fromLTRB(24.w, 18.h, 24.w, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60.h,
                margin: EdgeInsets.only(top: 30.h, bottom: 5.h),
                decoration: BoxDecoration(
                    color: UIprovider.theme['backgroundColor'],
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                child: TextFormField(
                  controller: Dataprovider.searchInputController,
                  onEditingComplete: () {
                    Dataprovider.getSearchTasks();
                  },
                  textInputAction: TextInputAction.search,
                  style: TextStyle(
                    color: UIprovider.theme["text"],
                  ),
                  decoration: InputDecoration(
                      focusColor: Colors.deepOrange,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.w)),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 18.h, horizontal: 15.w),
                      prefixIcon: Icon(
                        Icons.search,
                        color: UIprovider.theme['iconsColor'],
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromRGBO(217, 217, 217, 1))),
                      hintText: "Search",
                      hintStyle: TextStyle(
                          fontSize: 17.sp,
                          color: const Color.fromRGBO(158, 158, 158, 1),
                          fontFamily: "Inter"),
                      suffixIcon: Transform.scale(
                        scale: .5,
                        child: SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: InkWell(
                            onTap: () {
                              Dataprovider.searchInputController.clear();
                              Dataprovider.clearSearchTasks();
                            },
                            child: Image.asset(
                              "assets/icons/clear.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 181.h,
                  child: Dataprovider.searchTasks.isEmpty
                      ? UIprovider.notFoundJsonPath
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: Dataprovider.searchTasks.length,
                          itemBuilder: (context, index) => TaskWidget(
                            index: index,
                            selectedIndex: -1,
                            changeSelectedIndex: () => {},
                            task: Dataprovider.searchTasks[index],
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
