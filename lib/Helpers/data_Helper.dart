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
  final tasksUri = Uri.http(Constants.todoApiHostName, '/tasks');
  final makeDoneURI = Uri.http(Constants.todoApiHostName, "/task-status");
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
    http.Response response = await http.post(tasksUri, headers: {
      "Authorization": "Bearer $token",
      'Content-Type': 'application/x-www-form-urlencoded'
    }, body: {
      "title": task.title!,
      "description": task.description!
    });
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  deleteTask(Tasks task) async {
    String token = SPHelper.getToken();
    Uri deleteTaskWithQuery =
        tasksUri.replace(queryParameters: {"taskId": task.id});
    http.Response response = await http.delete(deleteTaskWithQuery,
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode >= 200 && response.statusCode < 300) return true;
    return false;
  }

  makeDone(Tasks task) async {
    String token = SPHelper.getToken();
    Uri makeDoneWithQuery =
        makeDoneURI.replace(queryParameters: {"taskId": task.id});
    http.Response response = await http
        .post(makeDoneWithQuery, headers: {'Authorization': "Bearer $token"});
    print(response.body);
    if (response.statusCode == 200) return true;
    return false;
  }
}
