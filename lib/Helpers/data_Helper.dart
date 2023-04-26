import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_app/Constants/Constants.dart';
import 'package:to_do_app/Helpers/SP_Helper.dart';
import 'package:to_do_app/Models/task_model.dart';
import 'package:to_do_app/Router/App_Router.dart';

class DataHelper {
  DataHelper._();
  static DataHelper dataHelper = DataHelper._();
  final tasksUri = Uri.https(Constants.todoApiHostName, '/tasks');

  getAllTasks(String searchQuery) async {
    String token = await SPHelper.getToken();
    Uri tasksUriWithQuery =
        tasksUri.replace(queryParameters: {"q": searchQuery});
    http.Response response = await http
        .get(tasksUriWithQuery, headers: {"Authorization": "Bearer $token"});
    List<Tasks> tasks = [];

    if (response.statusCode == 200) {
      json.decode(response.body)["tasks"].forEach((v) {
        tasks.add(Tasks.fromJson(v));
      });
      // print("Helper:\n" + tasks.toString());
      return tasks;
    } else {
      return [];
    }
  }

  addTask(Tasks task) async {
    String token = SPHelper.getToken();
    Map taskMap = {"title": task.title, "description": task.description};
    print(task.title);
    http.Response response = await http.post(tasksUri, headers: {
      "Authorization": "Bearer $token",
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      "title": task.title!,
      "description": task.description!
    });

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
