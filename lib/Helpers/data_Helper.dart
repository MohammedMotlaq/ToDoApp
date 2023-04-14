import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_do_app/Constants/Constants.dart';
import 'package:to_do_app/Helpers/SP_Helper.dart';
import 'package:to_do_app/Models/task_model.dart';

class DataHelper {
  DataHelper._();
  static DataHelper dataHelper = DataHelper._();
  List<Tasks> tasks = [];
  final tasksUri = Uri.https(Constants.todoApiHostName, '/tasks');

  getAllTasks() async {
    String token = await SPHelper.getToken();
    http.Response response =
        await http.get(tasksUri, headers: {"Authorization": "Bearer $token"});

    if (response.statusCode == 200) {
      json.decode(response.body)["tasks"].forEach((v) {
        tasks.add(Tasks.fromJson(v));
      });
      return tasks;
    } else {
      return [];
    }
  }
}
