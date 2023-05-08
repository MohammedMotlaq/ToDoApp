import 'dart:convert';

import 'package:to_do_app/Constants/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_app/Helpers/SP_Helper.dart';
import 'package:to_do_app/Models/User_Model.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  final signUpUri = Uri.http(Constants.todoApiHostName, '/auth/signup');
  final signInUri = Uri.http(Constants.todoApiHostName, '/auth/login');

  signUp(String email, String name, String password,
      String confirmPassword) async {
    final request = http.MultipartRequest('POST', signUpUri)
      ..fields.addAll({
        'email': email,
        'name': name,
        'password': password,
        'confirmPassword': confirmPassword
      });

    http.StreamedResponse response = await request.send();
    response.stream.bytesToString();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  signIn(String email, String password) async {
    //Stream Post
    // var request = http.MultipartRequest('Post', signInUri);
    // request.fields.addAll({'email': email, 'password': password});
    // http.StreamedResponse response = await request.send();
    // var data = await response.stream.bytesToString();
    //final mapData = json.decode(data);

    //Regular Post
    print(signInUri.port);

    http.Response response = await http
        .post(signInUri, body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      User user = User.fromJson(json.decode(response.body)["user"]);
      return user;
    } else {
      return null;
    }
  }
}
