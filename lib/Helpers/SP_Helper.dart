import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/colors/Colors.dart';

class SPHelper {
  static late SharedPreferences _sp;
  static initializeSp() async {
    _sp = await SharedPreferences.getInstance();
  }

  static getIsDark() {
    return _sp.getBool("isDark") ?? false;
  }

  static changeIsDark() {
    bool isDark = getIsDark();
    _sp.setBool("isDark", !isDark);
  }

  static saveEmail(String email) {
    _sp.setString("email", email);
  }

  static getEmail() {
    return _sp.getString("email");
  }

  static saveName(String name) {
    _sp.setString("name", name);
  }

  static getName() {
    return _sp.getString("name");
  }

  static saveToken(String token) {
    _sp.setString("token", token);
  }

  static getToken() {
    return _sp.getString("token");
  }
}
