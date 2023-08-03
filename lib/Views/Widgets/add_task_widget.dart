import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:to_do_app/Providers/UI_Provider.dart';
import 'package:to_do_app/Providers/data_provider.dart';


class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final FocusNode _focus2 = FocusNode();

  @override
  void initState() {
    _focus2.requestFocus();
    super.initState();
  }
  @override
  void dispose() {
    _focus2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<DataProvider, UIProvider>(
        builder: (context, dataProvider, uiProvider, x) {
      return Form(
        key: dataProvider.addTaskKey,
        child: Container(
          width: 390.w,
          height:685.h,
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
                        "ToDo Title",
                        style: TextStyle(
                            fontFamily: "inter",
                            fontSize: 17.sp,
                            color: const Color.fromRGBO(82, 82, 92, 1)),
                      ),
                      SizedBox(
                        height: 11.77.h,
                      ),
                      SizedBox(
                        height: 80.h,
                        width: 358.w,
                        child: TextFormField(
                          focusNode: _focus2,
                          controller: dataProvider.taskTitleController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required *";
                            }
                            return null;
                          },
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_focus2);
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
                            hintText: "Todo title ...",
                            hintStyle: TextStyle(
                              fontSize: 17.sp,
                              color: const Color.fromRGBO(158, 158, 158, 1),
                              fontFamily: "Inter"
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: const BorderSide(
                                style: BorderStyle.solid,
                                color: Color.fromRGBO(158, 158, 158, 1),
                              )
                            ),
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
                            fontSize: 17.sp,
                            color: const Color.fromRGBO(82, 82, 92, 1)),
                      ),
                      SizedBox(
                        height: 11.85.h,
                      ),
                      SizedBox(
                        height: 80.h,
                        width: 358.w,
                        child: TextFormField(
                          controller: dataProvider.taskDescriptionController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required *";
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) => dataProvider.addTaskController.start(),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
                            hintText: "Write anything in your mind ...",
                            hintStyle: TextStyle(
                              fontSize: 17.sp,
                              color: const Color.fromRGBO(158, 158, 158, 1),
                              fontFamily: "Inter"
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: const BorderSide(
                                style: BorderStyle.solid,
                                color: Color.fromRGBO(158, 158, 158, 1),
                              )
                            ),
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
                          successColor: uiProvider.theme["buttonColor"],
                          loaderStrokeWidth: 4,
                          loaderSize: 34.w,
                          borderRadius: 10.r,
                          color: uiProvider.theme["buttonColor"],
                          valueColor: Colors.white,
                          height: 72.h,
                          width: 340.w,
                          controller: dataProvider.addTaskController,
                          onPressed: () => dataProvider.addTask(),
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
