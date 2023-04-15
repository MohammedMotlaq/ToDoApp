import 'package:flutter/material.dart';
import 'package:to_do_app/Helpers/Auth_Helper.dart';
import 'package:to_do_app/Helpers/data_Helper.dart';
import 'package:to_do_app/Models/task_model.dart';

import 'package:to_do_app/Providers/auth_provider.dart';
import 'package:to_do_app/Router/App_Router.dart';
import 'package:to_do_app/Views/Screens/Main_Screen.dart';

class DataProvider extends ChangeNotifier {
  List<Tasks> tasks = [];
  List<Tasks> searchTasks = [];
  TextEditingController searchInputController = TextEditingController();
  getAllTasks() async {
    tasks = await DataHelper.dataHelper.getAllTasks('');
    print(tasks.toString());
    notifyListeners();
  }

  getSearchTasks() async {
    print("getting tasks");
    String searchQuery = searchInputController.text;
    searchTasks = await DataHelper.dataHelper.getAllTasks(searchQuery);
    print(searchTasks.toString());
    notifyListeners();
  }

// Helper Methods
  clearSearchTasks() {
    searchTasks.clear();
    notifyListeners();
  }
}
