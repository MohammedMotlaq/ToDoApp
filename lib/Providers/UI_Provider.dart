import 'package:flutter/material.dart';
import 'package:to_do_app/Helpers/SP_Helper.dart';
import 'package:to_do_app/colors/Colors.dart';

class UIProvider extends ChangeNotifier {
  Map<String, Color> theme = SPHelper.getIsDark() ? DarkColors : lightColors;
  IconData themeIcon =
      SPHelper.getIsDark() ? Icons.dark_mode_rounded : Icons.dark_mode_outlined;
  changeTheme() {
    SPHelper.changeIsDark();
    bool isDark = SPHelper.getIsDark();
    theme = isDark ? DarkColors : lightColors;
    themeIcon = isDark ? Icons.dark_mode_rounded : Icons.dark_mode_outlined;
    notifyListeners();
  }
}
