import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/colors/Colors.dart';

class SPHelper {
  static late SharedPreferences sp;
  static initializeSp() async {
    sp = await SharedPreferences.getInstance();
  }

  static getIsDark() {
    return sp.getBool("isDark") ?? false;
  }

  static changeIsDark() {
    bool isDark = getIsDark();
    sp.setBool("isDark", !isDark);
  }
}
