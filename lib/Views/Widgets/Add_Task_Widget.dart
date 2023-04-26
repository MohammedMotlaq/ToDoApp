import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Providers/data_provider.dart';

import '../../Router/App_Router.dart';
import '../Screens/Main_Screen.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final _focus2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Consumer2<DataProvider, UIProvider>(
        builder: (context, Dataprovider, UIprovider, x) {
      return Form(
        key: Dataprovider.addTaskKey,
        child: Container(
          width: 390.w,
          height: 312.h,
          padding: EdgeInsets.only(
            top: 10.h,
            left: 16.w,
            right: 16.w,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 142.w,
                height: 6.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: const Color.fromRGBO(121, 121, 121, 1),
                ),
              ),
              SizedBox(
                height: 11.91.h,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Todo Title",
                        style: TextStyle(
                            fontFamily: "inter",
                            fontSize: 15.sp,
                            color: const Color.fromRGBO(82, 82, 92, 1)),
                      ),
                      SizedBox(
                        height: 11.77.h,
                      ),
                      Container(
                        height: 60.h,
                        width: 302.54.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromRGBO(217, 217, 217, 1),
                                width: 2.w),
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r))),
                        child: TextFormField(
                          controller: Dataprovider.taskTitleController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "this field is required";
                            }
                          },
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_focus2);
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18.h, horizontal: 15.w),
                            border: InputBorder.none,
                            hintText: "Todo title......",
                            hintStyle: TextStyle(
                                fontSize: 17.sp,
                                color: const Color.fromRGBO(158, 158, 158, 1),
                                fontFamily: "Inter"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.78.h,
                      ),
                      Text(
                        "Task",
                        style: TextStyle(
                            fontFamily: "inter",
                            fontSize: 15.sp,
                            color: const Color.fromRGBO(82, 82, 92, 1)),
                      ),
                      SizedBox(
                        height: 11.85.h,
                      ),
                      Container(
                        height: 60.h,
                        width: 302.54.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromRGBO(217, 217, 217, 1),
                                width: 2.w),
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r))),
                        child: TextFormField(
                          focusNode: _focus2,
                          controller: Dataprovider.taskDescriptionController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "this field is required";
                            }
                          },
                          onFieldSubmitted: (value) =>
                              Dataprovider.addTaskController.start(),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18.h, horizontal: 15.w),
                            border: InputBorder.none,
                            hintText: "Write anything in your mind",
                            hintStyle: TextStyle(
                                fontSize: 17.sp,
                                color: const Color.fromRGBO(158, 158, 158, 1),
                                fontFamily: "Inter"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.4.h,
                      ),
                      SizedBox(
                        height: 57.21.h,
                        width: double.infinity,
                        child: RoundedLoadingButton(
                          successColor: UIprovider.theme["buttonColor"],
                          loaderStrokeWidth: 4,
                          loaderSize: 34.w,
                          borderRadius: 10.r,
                          color: UIprovider.theme["buttonColor"],
                          valueColor: Colors.white,
                          height: 72.h,
                          width: 340.w,
                          controller: Dataprovider.addTaskController,
                          onPressed: () => Dataprovider.addTask(),
                          child: Text(
                            "Save",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      );
    });
  }
}
