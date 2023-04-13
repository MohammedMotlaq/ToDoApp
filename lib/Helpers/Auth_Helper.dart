import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:to_do_app/Models/User_Model.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();

  signUp(String email, String name, String password, String confirmPassword) async {

    var request = http.MultipartRequest('POST', Uri.parse('https://todo-api.yooums.repl.co/auth/signup'));

    request.fields.addAll({
      'email': email,
      'name': name,
      'password': password,
      'confirmPassword': confirmPassword
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      return false;
    }
  }
  signIn(String email, String password) async{

    var request = http.MultipartRequest('Post',Uri.parse("https://todo-api.yooums.repl.co/auth/login"));

    request.fields.addAll({
      'email': email,
      'password': password
    });

    http.StreamedResponse response = await request.send();
    var data = response.stream.bytesToString();


    // if (response.statusCode == 200) {
    //   response.stream.bytesToString();
    // } else if (response.statusCode == 400) {
    //   return false;
    // }
    //String a = await response.stream["user"];
    //log(a);
  }
}


