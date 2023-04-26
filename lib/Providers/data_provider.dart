import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:to_do_app/Helpers/Auth_Helper.dart';
import 'package:to_do_app/Helpers/data_Helper.dart';
import 'package:to_do_app/Models/task_model.dart';

import 'package:to_do_app/Providers/auth_provider.dart';
import 'package:to_do_app/Router/App_Router.dart';
import 'package:to_do_app/Views/Screens/Main_Screen.dart';

class DataProvider extends ChangeNotifier {
  List<Tasks> tasks = [];
  List<Tasks> searchTasks = [];
  GlobalKey<FormState> addTaskKey = GlobalKey();
  TextEditingController searchInputController = TextEditingController();
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  RoundedLoadingButtonController addTaskController =
      new RoundedLoadingButtonController();

  getAllTasks() async {
    tasks = await DataHelper.dataHelper.getAllTasks('');
    notifyListeners();
  }

  getSearchTasks() async {
    String searchQuery = searchInputController.text;
    searchTasks = await DataHelper.dataHelper.getAllTasks(searchQuery);
    notifyListeners();
  }

  addTask() async {
    if (addTaskKey.currentState!.validate()) {
      String title = taskTitleController.text;
      String description = taskDescriptionController.text;
      Tasks task = Tasks(title: title, description: description);
      bool status = await DataHelper.dataHelper.addTask(task);
      if (status) {
        addTaskController.success();
        await getAllTasks();
        AppRouter.popWidget();
        clearAddTask();
      } else {
        addTaskController.error();
      }
    }
    addTaskController.reset();
  }

  deleteTasks(Tasks task) async {
    bool status = await DataHelper.dataHelper.deleteTask(task);
    if (status) {
      await getAllTasks();
      AppRouter.showSnackBar("delete task", "Task Deleted Successfully");
    } else {
      AppRouter.showErrorSnackBar("Failed", "Something went wrong");
    }
  }

  makeDone(Tasks task) async {
    bool status = await DataHelper.dataHelper.makeDone(task);
    if (!status) {
      AppRouter.showErrorSnackBar("Failed", "Something went wrong");
    }
    getAllTasks();
  }

// Helper Methods
  clearSearchTasks() {
    searchTasks.clear();
    notifyListeners();
  }

  clearAddTask() {
    taskTitleController.clear();
    taskDescriptionController.clear();
    notifyListeners();
  }
}
