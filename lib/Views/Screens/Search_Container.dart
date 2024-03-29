import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Providers/data_provider.dart';
import 'package:to_do_app/Views/Widgets/task_widget.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<UIProvider, DataProvider>(
        builder: (context, uiProvider, dataProvider, x) {
      return Container(
        color: uiProvider.theme['backgroundColor'],
        padding: EdgeInsets.fromLTRB(24.w, 18.h, 24.w, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60.h,
                margin: EdgeInsets.only(top: 30.h, bottom: 5.h),
                decoration: BoxDecoration(
                    color: uiProvider.theme['backgroundColor'],
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                child: TextFormField(
                  controller: dataProvider.searchInputController,
                  onChanged: (value) {
                    dataProvider.getSearchTasks();
                  },
                  textInputAction: TextInputAction.search,
                  style: TextStyle(
                    color: uiProvider.theme["text"],
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
                        color: uiProvider.theme['iconsColor'],
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(217, 217, 217, 1))),
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
                              dataProvider.searchInputController.clear();
                              dataProvider.clearSearchTasks();
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
                  child: dataProvider.searchTasks.isEmpty
                      ? uiProvider.notFoundJsonPath
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: dataProvider.searchTasks.length,
                          itemBuilder: (context, index) => TaskWidget(
                            index: index,
                            selectedIndex: -1,
                            changeSelectedIndex: () => {},
                            task: dataProvider.searchTasks[index],
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
