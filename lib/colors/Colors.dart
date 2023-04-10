import 'package:flutter/material.dart';

Map<String, Color> appTheme = DarkColors;

Map<String, Color> lightColors = {
  "backgroundColor": Color(0xFFFFFFFF),
  "textInputs": Color(0x40FF4444),
  "text": Color(0xff000000),
  "buttonColor": Color(0xFFFF4444),
  "hintText": Color(0xfF000000),
  "taskCartBackground": Color(0xFFFF4444),
  "addTaskButton": Color(0x85FF0000),
  "selectedColor": Color(0xFFFF4444),
  "unselectedColor": Color(0xFF000000)
};

Map<String, Color> DarkColors = {
  "backgroundColor": Color(0xFF000000),
  "textInputs": Color(0x40FF4444),
  "text": Color(0xFFFFFFFF),
  "buttonColor": Color(0xFFFF4444),
  "hintText": Color(0xffFFEFEF),
  "taskCartBackground": Color(0xFF2B2727),
  "addTaskButton": Color(0xffBF0000),
  "selectedColor": Color(0xFFFF0000),
  "unselectedColor": Color.fromARGB(255, 255, 255, 255)
};
